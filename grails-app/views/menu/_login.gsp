<sec:ifNotLoggedIn>
    <li>
        <g:link controller="login" action="auth"><g:message code="default.login.button" default="Login"/></g:link>
    </li>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b><sec:username/></b><b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li class=""><g:link controller="logout"><g:message code="default.logout.button" default="Logout"/></g:link></li>
        </ul>
    </li>
</sec:ifLoggedIn>
