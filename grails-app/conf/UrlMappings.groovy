class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
        
        // wiki itself
        "/wiki/$id"(controller: "wiki", action: 'wiki')
        
        // root
       "/" {
            controller = "wiki"
            action = "wiki"
            id = "Home"
        }

        "500"(view:'/error')
	}
}
