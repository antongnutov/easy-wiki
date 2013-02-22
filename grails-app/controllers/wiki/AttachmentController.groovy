package wiki

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
}
