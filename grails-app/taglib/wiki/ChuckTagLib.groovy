package wiki

class ChuckTagLib {
    static namespace = 'chuck'
    
    def jokes
    
    private def r = new Random()
    
    ChuckTagLib() {
        def text = ChuckTagLib.class.getResourceAsStream('jokes.txt')?.text
        jokes = text?.split("\n")
    }
    
    def joke = { attrs, body ->
        if (jokes) {
            out << jokes[r.nextInt(jokes.length)]
        }
    }
}
