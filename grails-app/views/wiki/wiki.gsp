<html>
    <head>
        <title>Wiki</title>
        <meta name="layout" content="wiki" />
    </head>
    <body>
        <div id="pageBody" class="body">
        
            <div class="menuButtons">
              <span class="menuButton"><a class="wiki" href="${createLink(action: 'wiki', params: [id: 'Home'])}">Home</a></span>
              <span class="menuButton"><a class="pageSearch" href="${createLink(controller: 'search')}">Search</a></span>
              <sec:ifAllGranted roles="ROLE_WIKI_ADMIN">
                <span class="menuButton"><a class="pages" href="${createLink(controller: 'wikiPage')}">Pages</a></span>
                <span class="menuButton"><a class="pageAdd" href="${createLink(controller: 'wikiPage', action: 'create', params: [parentPage: page?.id])}">New Page</a></span>
                <span class="menuButton"><a class="pageEdit" href="${createLink(controller: 'wikiPage', action: 'edit', params: [id: page?.id])}">Edit</a></span>
                <span class="menuButton"><a class="attach" href="${createLink(controller: 'wikiPage', action: 'attach', params: [id: page?.id])}">Attach</a></span>
                <span class="menuButton"><a class="pageDelete" href="${createLink(controller: 'wikiPage', action: 'delete', params: [id: page?.id])}">Delete</a></span>
              </sec:ifAllGranted>
            </div>
            
            <g:if test="${page}">
                <div id="breadcrumb">${breadcrumb}</div>

                <div id="wikiBody">
                    <wikitext:renderHtml markup="${page.syntax}">${page.content}</wikitext:renderHtml>
                </div>

                <div id="wikiBottom">
                    <div id="wikiChildren">
                        <h3>${page.childPages.size()} child page(s)</h3>
                        <ul style="list-style-type: none;">
                            <g:each var="child" in="${page.childPages}">
                                <li><a href="${g.createLink(params: [id: child.name])}"><img src="${g.resource(dir: 'images/skin', file: 'page.png')}"/>${child.name}</a></li>
                            </g:each>
                        </ul>
                    </div>
    
                    <div id="wikiAttachments">
                        <h3>${page.attachments.size()} attachment(s)</h3>
                        <ul style="list-style-type: none;">
                            <g:each var="att" in="${page.attachments}">
                                <li><a href="${g.createLink(controller: 'attachment', action: 'loadContent', params: [id: att.name])}"><img src="${g.resource(dir: 'images/skin', file: 'attachment.png')}"/>${att.name}</a></li>
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
                    <g:form controller="wikiPage">
                        <g:hiddenField name="id" value="${page?.id}" />
                        <span class="button"><g:actionSubmit class="pageEdit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                        <span class="button"><g:actionSubmit class="attach" action="attach" value="${message(code: 'default.button.attach.label', default: 'Attach')}" /></span>
                        <span class="button"><g:actionSubmit class="pageDelete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                    </g:form>
                </div>
            </sec:ifAllGranted>
        </div>
    </body>
</html>
