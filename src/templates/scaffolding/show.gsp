<% import grails.persistence.Event %>
<%=packageName%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>

        <dl class="dl-horizontal">
            <%  excludedProps = Event.allEvents.toList() << 'version'
                allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
                props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) }
                Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                props.each { p -> %>


                <dt><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></dt>
                <%  if (p.isEnum()) { %>
                <dd valign="top" class="value">\${${propertyName}?.${p.name}?.encodeAsHTML()}</dd>
                <%  } else if (p.oneToMany || p.manyToMany) { %>
                <dd valign="top" style="text-align: left;" class="value">
                    <ul>
                    <g:each in="\${${propertyName}.${p.name}}" var="${p.name[0]}">
                        <li><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${p.name[0]}.id}">\${${p.name[0]}?.encodeAsHTML()}</g:link></li>
                    </g:each>
                    </ul>
                </dd>
                <%  } else if (p.manyToOne || p.oneToOne) { %>
                <dd valign="top" class="value"><g:link controller="${p.referencedDomainClass?.propertyName}" action="show" id="\${${propertyName}?.${p.name}?.id}">\${${propertyName}?.${p.name}?.encodeAsHTML()}</g:link></dd>
                <%  } else if (p.type == Boolean.class || p.type == boolean.class) { %>
                <dd valign="top" class="value"><g:formatBoolean boolean="\${${propertyName}?.${p.name}}" /></dd>
                <%  } else if (p.type == Date.class || p.type == java.sql.Date.class || p.type == java.sql.Time.class || p.type == Calendar.class) { %>
                <dd valign="top" class="value"><g:formatDate date="\${${propertyName}?.${p.name}}" /></dd>
                <%  } else if(!p.type.isArray()) { %>
                <dd valign="top" class="value">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</dd>
                <%  } %>
            <%  } %>
        </dl>

        <sec:ifAllGranted roles="ROLE_ADMIN">
            <div class="buttons controls">
                <g:link class="btn btn-small" controller="${className}" action="edit" params="\${[id: ${propertyName}?.id]}"><i class="icon-edit"></i> <g:message code="default.button.edit.label" default="Edit"/></g:link>
                <g:link class="btn btn-small btn-danger" controller="${className}" action="delete" params="\${[id: ${propertyName}?.id]}"
                        onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                    <i class="icon-remove"></i> <g:message code="default.button.delete.label" default="Delete"/>
                </g:link>
            </div>
        </sec:ifAllGranted>

    </body>
</html>
