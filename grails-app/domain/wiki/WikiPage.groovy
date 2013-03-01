package wiki

class WikiPage {

	static searchable = {
        only = ['name', 'content']
        mapping {
            spellCheck "include"
        }
    }

    static constraints = {
        name(blank: false, maxSize: 100, unique: true)
        content(maxSize: 10000)
        syntax(inList: ['Textile', 'MediaWiki', 'TracWiki', 'TWiki', 'Confluence'])
        parentPage(nullable: true)
    }
    
    static hasMany = [attachments: Attachment, childPages: WikiPage]
    static belongsTo = [parentPage: WikiPage]
    static mapping = {
        table 'WIKI_PAGE'
        sort "name": "asc"
    }
    
    String name
    String content
    String syntax = 'Confluence'
    
    String toString() {
        name
    }
}
