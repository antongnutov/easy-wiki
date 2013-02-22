package wiki

class WikiTagLib {
    static namespace = 'wiki'
    
    /**
    * &copy; 2011 Anton Gnutov
    */
   def copyright = { attrs, body ->
       out << "&copy; 2011 Anton Gnutov"
   }
   
   /**
    * Build time
    */
   def buildtime = { attrs, body ->
       out << g.meta(name:"app.buildDate", "")
   }
   
   def appversion = { attrs, body ->
       out << g.meta(name:"app.version", "")
   }
   
   def appname = { attrs, body ->
       out << g.meta(name:"app.name", "")
   }
}
