<%@ page import="wiki.WikiPage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'WikiPage')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

        <style type="text/css">th, td {border: 0;}</style>
    </head>
    <body>
        <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
        <g:hasErrors bean="${wikiPageInstance}">
        <div class="errors">
            <g:renderErrors bean="${wikiPageInstance}" as="list" />
        </div>
        </g:hasErrors>
        <g:form class="form-horizontal" method="post" action="update">
            <g:hiddenField name="id" value="${wikiPageInstance?.id}" />
            <g:hiddenField name="version" value="${wikiPageInstance?.version}" />

            <g:render template="fields"/>

            <div class="control-group">
                <div class="buttons">
                    <button class="btn btn-small btn-success" type="submit"><i class="icon-ok"></i> <g:message code="default.button.update.label" default="Update"/></button>
                    <g:link class="btn btn-small btn-danger" controller="wikiPage" action="delete" params="${[id: wikiPageInstance.id]}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                        <i class="icon-remove"></i> <g:message code="default.button.delete.label" default="Delete"/>
                    </g:link>
                </div>
            </div>
        </g:form>
    </body>
</html>
