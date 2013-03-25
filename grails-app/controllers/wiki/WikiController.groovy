package wiki

class WikiController {

    static defaultAction = "wiki"

    def xwikiRenderer
    def defaultXWikiSyntaxFactory

    private final def transformations = [new TableTransformation()]

    def wiki = {
        def pageName = params.id?.decodeURL()

        def page = pageName ? WikiPage.findByName(pageName) : null
        def breadcrumb = page ? breadcrumb(page) : ''
        
        if (page) {
            session.pageId = page.id

            def inputSyntax = defaultXWikiSyntaxFactory.getSyntax(WikiPage.SYNTAX_MAPPING[page.syntax])
            String content = xwikiRenderer.render(page.content, inputSyntax, transformations)
            [page: page, name: pageName, breadcrumb: breadcrumb, content: content]
        } else {
            if (session.pageId) {
                redirect(controller: "attachment", action: "loadContent", params: params)
            }
        }
    }

    def breadcrumb(def page) {
        def result = new StringBuffer("<b>$page.name</b>")
        def parent = page.parentPage
        
        while (parent && parent != parent.parentPage) {
            result.insert(0, createLink(parent))
            parent = parent.parentPage
        }
        
        result.toString()
    }
    
    def createLink(def page) {
        "[<a href=\"${g.createLink(controller: 'wiki', params: [id: page.name])}\">$page.name</a>] > "
    }

}
