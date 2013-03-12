package wiki

import grails.converters.JSON
import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class AttachmentController {

    private static final String ATTACHMENTS_FOLDER = 'attachments'

    def loadContent = {
        def attName = params.id
        def pageId = session.pageId

        def c = Attachment.createCriteria()
        def attachment = c.get {
            eq('name', attName)
            eq('wikiPage.id', pageId)
        }

        def file = getAttachmentFile(attName, attachment.wikiPage.name)

        if (!attachment || !file.exists() || !attachment.contentType) {
            response.sendError(404)
            return
        }

        response.setContentType(attachment.contentType)
        response.setContentLength(file.length() as int)
        OutputStream out = response.getOutputStream()
        out.write(file.bytes)
        out.close()
    }

    def upload() {
        def page = WikiPage.get(params.id)

        switch (request.method) {
            case "GET":
                def results = []
                for (Attachment a : page.attachments) {
                    File attachmentFile = getAttachmentFile(a.name, page.name)
                    results << [
                            name: a.name,
                            size: attachmentFile.length(),
                            url: createLink(controller: 'attachment', action: 'loadContent', params: [id: a.name]),
                            delete_url: createLink(controller: 'attachment', action: 'delete', params: [id: a.id]),
                            delete_type: 'DELETE']
                }

                render results as JSON
                break;
            case "POST":
                def results = []

                if (request instanceof MultipartHttpServletRequest) {
                    for (String filename : request.getFileNames()) {
                        MultipartFile file = request.getFile(filename)

                        File newFile = getAttachmentFile(file.originalFilename, page.name)
                        file.transferTo(newFile)
                        def size = newFile.length()

                        def attachment = new Attachment(name: file.originalFilename, wikiPage: page, contentType: file.contentType)

                        log.debug("File uploaded: ${file.originalFilename}: ${file.contentType}")

                        if (!attachment.save(flush: true)) {
                            flash.message = "File (${attachment.contentType}, $size bytes) could not be saved."
                        } else {
                            flash.message = "File (${attachment.contentType}, $size bytes) uploaded."
                        }

                        results << [
                                name: file.originalFilename,
                                size: file.size,
                                url: createLink(controller: 'attachment', action: 'loadContent', params: [id: file.originalFilename]),
                                delete_url: createLink(controller: 'attachment', action: 'delete'),
                                delete_type: 'DELETE'
                        ]
                    }
                }

                render results as JSON
                break;
            default: render status: HttpStatus.METHOD_NOT_ALLOWED.value()
        }
    }

    def delete = {
        def attachment = Attachment.get(params.id)
        if (attachment) {
            try {
                // delete file from disk
                getAttachmentFile(attachment.name, attachment.wikiPage.name).delete()
                // delete object from database
                attachment.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.name])
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.name])
            }
        }
    }

    private File getAttachmentFile(String fileName, String pageName) {
        String storageFolder = grailsApplication.config.file.upload.directory ?: ATTACHMENTS_FOLDER
        String pageFolderName = "$storageFolder/$pageName"

        File pageFolder = new File(pageFolderName)
        if (!pageFolder.exists()) {
            pageFolder.mkdirs()
        }

        new File("$pageFolderName/$fileName")
    }
}
