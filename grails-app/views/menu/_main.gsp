<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
 
            <a class="brand" href="${createLink(uri: '/')}">Easy-Wiki</a>

            <div class="nav-collapse collapse">
                <ul class="nav">

                    <sec:ifAllGranted roles="ROLE_ADMIN">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><b class="caret"></b>&nbsp;Administration</a>
                            <ul class="dropdown-menu">
                                <li><g:link controller="console">Groovy console</g:link></li>
                                <li><g:link controller="dbconsole">DB console</g:link></li>
                                <li><g:link controller="user">Users</g:link></li>
                                <li><g:link controller="userRole">User roles</g:link></li>
                            </ul>
                        </li>
                    </sec:ifAllGranted>
                    
                    <sec:ifAnyGranted roles="ROLE_WIKI, ROLE_WIKI_ADMIN">
                        <li><g:link controller="search">Search</g:link></li>
                        <li><g:link controller="wikiPage" action="list">Pages</g:link></li>
                    </sec:ifAnyGranted>
                    <sec:ifAllGranted roles="ROLE_WIKI_ADMIN">
                        <li><g:link controller="wikiPage" action="create">New Page</g:link></li>
                    </sec:ifAllGranted>
                                                              
                </ul>  
                
                <ul class="nav pull-right">
                    <g:render template="/menu/language"/>
                    <g:render template="/menu/login"/>
                </ul>              
            </div>
                        
        </div>
    </div>
</div>
