package wiki

class Attachment {

    static constraints = {
        name(blank: false, maxSize: 200, unique: 'wikiPage')
        wikiPage(nullable: false)
        contentType(nullable: true)
    }
    
    static belongsTo = [wikiPage: WikiPage]
    static mapping = {
        table 'WIKI_ATTACH'
        sort "name": "asc"
    }
    
    String name
    String contentType

    String toString() {
        name
    }
}
