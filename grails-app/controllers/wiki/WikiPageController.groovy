package wiki

class WikiPageController {

    def scaffold = WikiPage

    def show = {
        def page = WikiPage.get(params.id)
        redirect(controller: 'wiki', action: 'wiki', params: [id: page?.name?.encodeAsURL()])
    }
    
    def attach = {
        def page = WikiPage.get(params.id)
        if (!page) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'wikiPage.label', default: 'Wiki Page'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [page: page]
        }
    }

    def uploadAttachment = {
        def page = WikiPage.get(params.id)
        
        // Get file from the multi-part request
        def f = request.getFile('attachment')
        
        def attachment = new Attachment(name: f.originalFilename, content: f.getBytes(), wikiPage: page, contentType: f.contentType)
        
        // Save the image and mime type
        log.debug("File uploaded: " + f.contentType)
        
        // Validation works, will check if the image is too big
        if (!attachment.save(flush: true)) {
            flash.message = "File (${attachment.contentType}, ${attachment.content.size()} bytes) could not be saved."
            redirect(action:'attach', id:params.id)
        } else {
            flash.message = "File (${attachment.contentType}, ${attachment.content.size()} bytes) uploaded."
            redirect(action:'show', id:params.id)
        }
    }
    
    def create = {
        def wikiPageInstance = new WikiPage()
        wikiPageInstance.parentPage = WikiPage.get(params.parentPage)
        return [wikiPageInstance: wikiPageInstance]
    }
}
