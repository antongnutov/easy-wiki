<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="wiki" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'Wiki Page')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <style type="text/css">th, td {border: 0;}</style>
    </head>
    <body>
        <div id="pageBody">
            <div class="menuButtons">
              <span class="menuButton"><a class="wiki" href="${createLink(controller: 'wiki', action: 'wiki', params: [id: 'Home'])}">Home</a></span>
              <span class="menuButton"><g:link class="pages" action="list">Pages</g:link></span>
            </div>
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${page}" field="errors">
                <div class="errors">
                    <g:renderErrors bean="${page}" as="list" field="errors"/>
                </div>
            </g:hasErrors>
            
            <g:form method="post" enctype="multipart/form-data">
                <g:hiddenField name="id" value="${page?.id}" />
                <g:hiddenField name="version" value="${page?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="page.id.label" default="Id" /></td>
                                <td valign="top" class="value">${fieldValue(bean: page, field: "id")}</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="page.name.label" default="Name" /></td>
                                <td valign="top" class="value">${fieldValue(bean: page, field: "name")}</td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="attachments"><g:message code="wikiPage.attachments.label" default="Attachments" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: page, field: 'attachments', 'errors')}">
                                    <g:select disabled="true" name="attachments" from="${wiki.Attachment.list()}" multiple="yes" optionKey="id" size="5" value="${page?.attachments*.id}" />
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                    
                    <fieldset>
                      <legend>Upload Attachment</legend>
                      <input type="file" name="attachment"/>
                    </fieldset>
                </div>
                
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="pageAccept" action="uploadAttachment" value="${message(code: 'default.button.upload.label', default: 'Upload')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
