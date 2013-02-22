package wiki

import org.compass.core.engine.SearchEngineQueryParseException

class SearchController {

    def searchableService
    
    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
    
        try {
            [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ignored) {
            [parseException: true]
        }
    }
}
