<%@ page import="wiki.WikiPage" %>
<html>
    <head>
        <title>Wiki</title>
        <meta name="layout" content="main" />
    </head>
    <body>
        <g:if test="${page}">
            <div id="breadcrumb">${breadcrumb}</div>

            <div id="wikiBody">
                ${content}
            </div>

            <div id="wikiBottom">
                <div id="wikiChildren">
                    <h4>${page.childPages.size()} child page(s)</h4>
                    <ul style="list-style-type: none;">
                        <g:each var="child" in="${page.childPages}">
                            <li><a href="${g.createLink(params: [id: child.name])}"><i class="icon-file"></i> ${child.name}</a></li>
                        </g:each>
                    </ul>
                </div>

                <div id="wikiAttachments">
                    <h4>${page.attachments.size()} attachment(s)</h4>
                    <ul style="list-style-type: none;">
                        <g:each var="att" in="${page.attachments}">
                            <li><a href="${g.createLink(controller: 'attachment', action: 'loadContent', params: [id: att.name])}"><i class="icon-envelope"></i> ${att.name}</a></li>
                        </g:each>
                    </ul>
                </div>
            </div>
        </g:if>
        <g:else>
            <div id="wikiBody">Page '${name}' not found</div>
        </g:else>

        <sec:ifAllGranted roles="ROLE_WIKI_ADMIN">
            <div class="buttons">
                <g:link class="btn btn-small" controller="wikiPage" action="create" params="${[parentPage: page.id]}"><i class="icon-file"></i> Add child</g:link>
                <g:link class="btn btn-small" controller="wikiPage" action="edit" params="${[id: page.id]}"><i class="icon-edit"></i> <g:message code="default.button.edit.label" default="Edit"/></g:link>
                <g:link class="btn btn-small" controller="wikiPage" action="attach" params="${[id: page.id]}"><i class="icon-upload"></i> <g:message code="default.button.attach.label" default="Attach"/></g:link>
                <g:link class="btn btn-small btn-danger" controller="wikiPage" action="delete" params="${[id: page.id]}"
                        onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    <i class="icon-remove icon-white"></i> <g:message code="default.button.delete.label" default="Delete"/>
                </g:link>
            </div>
        </sec:ifAllGranted>
    </body>
</html>
