import grails.converters.JSON
import grails.util.Environment
import wiki.WikiPage
import wiki.security.Role
import wiki.security.User
import wiki.security.UserRole

class BootStrap {

    def init = { servletContext ->
        initSecurity()
        printDBSettings()
        
        switch(Environment.current){
            case Environment.DEVELOPMENT:
                def home = new WikiPage(name: 'Home', syntax: 'Confluence', content: 'h1. Welcome to Wiki!').save()
                new WikiPage(name: 'Page1', syntax: 'Confluence', content: 'h2. Test page', parentPage: home).save()
                new WikiPage(name: 'Page2', syntax: 'Confluence', content: 'h2. Test page', parentPage: home).save()
            break;
        }
    }
    
    def destroy = {
    }
    
    def initSecurity() {
        log.info("initSecurity")
        def wikiRole = Role.findByAuthority('ROLE_WIKI') ?: new Role(authority: 'ROLE_WIKI').save(failOnError: true)
        def wikiAdminRole = Role.findByAuthority('ROLE_WIKI_ADMIN') ?: new Role(authority: 'ROLE_WIKI_ADMIN').save(failOnError: true)
        def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = User.findByUsername('admin') ?: new User(username: 'admin', password: 'admin', enabled: true).save(failOnError: true)
        if (!adminUser.authorities.contains(wikiAdminRole)) {
            UserRole.create(adminUser, wikiAdminRole)
        }
        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create(adminUser, adminRole)
        }

        def user = User.findByUsername('user') ?: new User(username: 'user', password: 'user', enabled: true).save(failOnError: true)
        if (!user.authorities.contains(wikiRole)) {
            UserRole.create(user, wikiRole)
        }
    }

    def printDBSettings() {
        String VCAP_SERVICES = System.getenv('VCAP_SERVICES')
        println "VCAP_SERVICES: ${VCAP_SERVICES}"

        if (VCAP_SERVICES) {
            try {
                def servicesMap = JSON.parse(VCAP_SERVICES)
                servicesMap.each { key, services ->
                    if (key.startsWith('mysql')) {
                        for (service in services) {
                            print "MySQL service $service.name: "
                            print "url='jdbc:mysql://$service.credentials.hostname:$service.credentials.port/$service.credentials.name', "
                            print "user='$service.credentials.user', "
                            println "password='$service.credentials.password'n"
                        }
                    } else if (key.startsWith('postgresql')) {
                        for (service in services) {
                            print "PostgreSQL service $service.name: "
                            print "url='jdbc:postgresql://$service.credentials.hostname:$service.credentials.port/$service.credentials.name', "
                            print "user='$service.credentials.user', "
                            println "password='$service.credentials.password'n"
                        }
                    }
                }
            } catch (e) {
                println "Error occurred parsing VCAP_SERVICES: $e.message"
            }
        }
    }
}
