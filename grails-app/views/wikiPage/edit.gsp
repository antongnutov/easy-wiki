<%@ page import="wiki.WikiPage" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="wiki" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'WikiPage')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        
        <style type="text/css">th, td {border: 0;}</style>
    </head>
    <body>
        <div id="pageBody">
            <div class="menuButtons">
              <span class="menuButton"><a class="wiki" href="${createLink(controller: 'wiki', action: 'wiki', params: [id: 'Home'])}">Home</a></span>
              <span class="menuButton"><g:link class="pages" action="list">Pages</g:link></span>
              <span class="menuButton"><g:link class="pageAdd" action="create" params="${[parentPage: wikiPageInstance?.id]}">New Page</g:link></span>
            </div>
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${wikiPageInstance}">
            <div class="errors">
                <g:renderErrors bean="${wikiPageInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${wikiPageInstance?.id}" />
                <g:hiddenField name="version" value="${wikiPageInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="wikiPage.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" maxlength="100" value="${wikiPageInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content"><g:message code="wikiPage.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'content', 'errors')}">
                                    <g:textArea name="content" cols="40" rows="5" value="${wikiPageInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="syntax"><g:message code="wikiPage.syntax.label" default="Syntax" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'syntax', 'errors')}">
                                    <g:select name="syntax" from="${wikiPageInstance.constraints.syntax.inList}" value="${wikiPageInstance?.syntax}" valueMessagePrefix="wikiPage.syntax"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="parentPage"><g:message code="wikiPage.parentPage.label" default="Parent Page" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'parentPage', 'errors')}">
                                    <g:select name="parentPage.id" from="${wiki.WikiPage.list()}" optionKey="id" value="${wikiPageInstance?.parentPage?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="attachments"><g:message code="wikiPage.attachments.label" default="Attachments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'attachments', 'errors')}">
                                    <g:select name="attachments" from="${wiki.Attachment.list()}" multiple="yes" optionKey="id" size="5" value="${wikiPageInstance?.attachments*.id}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="childPages"><g:message code="wikiPage.childPages.label" default="Child Pages" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: wikiPageInstance, field: 'childPages', 'errors')}">
                                    
<ul>
<g:each in="${wikiPageInstance?.childPages?}" var="c">
    <li><g:link controller="wikiPage" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="wikiPage" action="create" params="['wikiPage.id': wikiPageInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'wikiPage.label', default: 'WikiPage')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="pageAccept" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="pageDelete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
