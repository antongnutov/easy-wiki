package wiki

import grails.converters.JSON
import org.springframework.http.HttpStatus
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class AttachmentController {

    def loadContent = {
        def attName = params.id

        def c = Attachment.createCriteria()
        def attachment = c.get {
            eq('name', attName)
            eq('wikiPage.id', session.pageId)
        }

        if (!attachment || !attachment.content || !attachment.contentType) {
            response.sendError(404)
            return
        }
        response.setContentType(attachment.contentType)
        response.setContentLength(attachment.content.size())
        OutputStream out = response.getOutputStream()
        out.write(attachment.content)
        out.close()
    }

    def upload() {
        def page = WikiPage.get(params.id)

        switch (request.method) {
            case "GET":
                def results = []
                for (Attachment a : page.attachments) {
                    results << [
                            name: a.name,
                            size: a.content.size(),
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

                        def attachment = new Attachment(name: file.originalFilename, content: file.getBytes(), wikiPage: page, contentType: file.contentType)

                        log.debug("File uploaded: ${file.originalFilename}: ${file.contentType}")

                        // validation works, will check if the file is too big
                        if (!attachment.save(flush: true)) {
                            flash.message = "File (${attachment.contentType}, ${attachment.content.size()} bytes) could not be saved."
                        } else {
                            flash.message = "File (${attachment.contentType}, ${attachment.content.size()} bytes) uploaded."
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
                attachment.delete(flush: true)
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.name])
            } catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'attachment.label', default: 'Attachment'), attachment.name])
            }
        }
    }
}
