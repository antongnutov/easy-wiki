<%@ page import="wiki.WikiPage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'WikiPage')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style type="text/css">th, td {border: 0;}</style>
    </head>
    <body>
        <h1><g:message code="default.create.label" args="[entityName]" /></h1>

        <g:hasErrors bean="${wikiPageInstance}">
        <div class="errors">
            <g:renderErrors bean="${wikiPageInstance}" as="list" />
        </div>
        </g:hasErrors>
        <g:form action="save" class="form-horizontal" method="post">
            <g:render template="fields"/>

            <div class="control-group">
                <div class="buttons">
                    <button class="btn btn-small btn-success" type="submit"><i class="icon-ok"></i> <g:message code="default.button.create.label" default="Create"/></button>
                </div>
            </div>
        </g:form>
    </body>
</html>
