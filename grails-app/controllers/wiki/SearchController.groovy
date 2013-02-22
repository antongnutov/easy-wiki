package wiki

import org.compass.core.engine.SearchEngineQueryParseException

class SearchController {

    def searchableService
    
    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
    
        try {
            def result = [searchResult: searchableService.search(params.q, params)]
            return result
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
}
