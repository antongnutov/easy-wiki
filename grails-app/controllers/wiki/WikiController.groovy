package wiki

class WikiController {
    
    def wiki = {
        def pageName = params.id

        def page = pageName ? WikiPage.findByName(pageName) : null
        def breadcrumb = page ? breadcrumb(page) : ''
        
        if (page) {
            session.pageId = page.id
        } else {
            if (session.pageId) {
                redirect(controller: "attachment", action: "loadContent", params: params)
            }
        }
        
        [page: page, name: pageName, breadcrumb: breadcrumb]
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
