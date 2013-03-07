<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'wikiPage.label', default: 'Wiki Page')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <style type="text/css">th, td {border: 0;}</style>
        <r:require modules="bootstrap-file-upload"/>
    </head>
    <body>
        <h2>
            <g:message code="default.attachment.label" args="[page.name]" default="Attachments for page:"/>
            <g:link controller="wiki" action="wiki" params="id: page.name">${page.name}</g:link>
        </h2>

        <bsfu:fileUpload action="upload" controller="attachment" sequentialUploads="true" params="[id: page.id]" acceptFileTypes="/(.+)\$/i" />
    </body>
</html>
