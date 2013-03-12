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

    def create = {
        def wikiPageInstance = new WikiPage()
        wikiPageInstance.parentPage = WikiPage.get(params.parentPage)
        return [wikiPageInstance: wikiPageInstance]
    }
}
