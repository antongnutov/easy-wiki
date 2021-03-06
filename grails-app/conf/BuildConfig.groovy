grails.servlet.version = "2.5"
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.war.file = "target/${appName}.war"

grails.project.target.level = 1.6
grails.project.source.level = 1.6

// xwiki plugin
grails.xwiki.rendering.syntaxes = 'mediawiki, confluence, creole'
grails.xwiki.rendering.macros = "comment, box, toc, footnotes, html, id, message"

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
    }

    log "warn"

    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
        mavenRepo "http://maven.springframework.org/milestone"
        mavenRepo "http://nexus.xwiki.org/nexus/content/groups/public/"
    }

    dependencies {
        provided 'mysql:mysql-connector-java:5.1.25'
    }

    plugins {
        compile ":spring-security-core:1.2.7.3"
        compile ":cloud-foundry:1.2.3"
        compile(":xwiki-rendering:1.0-RC3") {
            excludes 'xercesImpl'
        }
        compile ":searchable:0.6.4"

        compile ":resources:1.2.RC2"
        compile ":twitter-bootstrap:2.3.2"
        compile(":bootstrap-file-upload:2.1.1") {
            excludes 'jquery'
        }

        runtime ":jquery:1.10.0"
        runtime ":console:1.2"
        runtime ":hibernate:$grailsVersion"

        build ":tomcat:$grailsVersion"
    }
}
