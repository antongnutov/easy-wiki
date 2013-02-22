<%@ page import="wiki.WikiPage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="wiki" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'WikiPage')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <style type="text/css">th, td {border: 0;}</style>
    </head>
    <body>
        <div id="pageBody">
            <div class="menuButtons">
              <span class="menuButton"><a class="wiki" href="${createLink(controller: 'wiki', action: 'wiki', params: [id: 'Home'])}">Home</a></span>
              <sec:ifAllGranted roles="ROLE_WIKI_ADMIN">
                  <span class="menuButton"><g:link class="pageAdd" action="create">New Page</g:link></span>
              </sec:ifAllGranted>
            </div>
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <g:if test="${session.user}">
                              <th><g:message default="" /></th>
                            </g:if>
                        
                            <g:sortableColumn property="name" title="${message(code: 'wikiPage.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="syntax" title="${message(code: 'wikiPage.syntax.label', default: 'Syntax')}" />
                        
                            <th><g:message code="wikiPage.parentPage.label" default="Parent Page" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${wikiPageInstanceList}" status="i" var="wikiPageInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <g:if test="${session.user}">
                              <td><g:link action="edit" id="${wikiPageInstance.id}"><img src="${createLinkTo(dir:'images/skin', file:'page_edit.png')}"/></g:link></td>        
                            </g:if>
                        
                            <td><g:link action="show" id="${wikiPageInstance.id}">${fieldValue(bean: wikiPageInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: wikiPageInstance, field: "syntax")}</td>
                        
                            <td>${fieldValue(bean: wikiPageInstance, field: "parentPage")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${wikiPageInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
