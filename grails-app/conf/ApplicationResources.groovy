modules = {
    'application' {
        resource url: 'js/application.js'
    }

    'bootstrap-full' {
        dependsOn 'bootstrap'
        resource url: [plugin: 'twitter-bootstrap', dir: 'css', file: 'bootstrap-responsive.min.css'], disposition: 'head', exclude: 'minify'
        resource url: [dir: 'css', file: 'fixtaglib.css'], disposition: 'head'
    }
}
