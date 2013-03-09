<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Wiki" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'wiki.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images/skin',file:'wiki.png')}"/>

        <g:layoutHead />
    </head>
    <body onload="${pageProperty(name:'body.onload')}">
        <div id="wrap">
            <div id="spinner" class="spinner" style="display:none;">
                <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
            </div>
            <!-- login/logout link -->
            <div id="loginHeader">
                <sec:ifNotLoggedIn>
                    [<g:link controller="login" action="auth">Login</g:link>]
                </sec:ifNotLoggedIn>
                <sec:ifLoggedIn>
                    Logged in as <b><sec:username/></b> [<g:link controller="logout">Logout</g:link>]
                </sec:ifLoggedIn>
            </div>
            
            <div id="logo">
              <div id="chuckJoke">
                <chuck:joke />
              </div>
            </div>
            <g:render template="/wikipanel"/>
            <div id="main">
                <g:layoutBody />
            </div>
        </div>
        <div id="footer">
            <g:render template="/footer"/>
        </div>
    </body>
</html>
