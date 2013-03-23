package wiki

class WikiPage {
    public static def SYNTAX_MAPPING = [Confluence: 'confluence/1.0', creole: 'creole/1.0', MediaWiki: 'mediawiki/1.0', Xwiki: 'xwiki/2.1']

	static searchable = {
        only = ['name', 'content']
        mapping {
            spellCheck "include"
        }
    }

    static constraints = {
        name(blank: false, maxSize: 100, unique: true)
        content(maxSize: 10000)
        syntax(inList: ['Confluence', 'Creole', 'MediaWiki', 'Xwiki'])
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
