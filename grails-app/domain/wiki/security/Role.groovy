package wiki.security

class Role {

	String authority
    
	static mapping = {
		cache true
        table 'WIKI_ROLE'
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
