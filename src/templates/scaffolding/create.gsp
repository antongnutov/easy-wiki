<% import grails.persistence.Event %>
<% import org.codehaus.groovy.grails.plugins.PluginManagerHolder %>
<%=packageName%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>

<h1><g:message code="default.create.label" args="[entityName]"/></h1>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="\${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<section id="create" class="first">

    <g:hasErrors bean="\${${propertyName}}">
        <div class="alert alert-error">
            <g:renderErrors bean="\${${propertyName}}" as="list"/>
        </div>
    </g:hasErrors>

    <g:form action="save" class="form-horizontal" <%=multiPart ? ' enctype="multipart/form-data"' : '' %>>
    <% excludedProps = Event.allEvents.toList() << 'version' << 'id' << 'dateCreated' << 'lastUpdated'
    persistentPropNames = domainClass.persistentProperties*.name
    props = domainClass.properties.findAll { persistentPropNames.contains(it.name) && !excludedProps.contains(it.name) }
    Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
    display = true
    boolean hasHibernate = PluginManagerHolder.pluginManager.hasGrailsPlugin('hibernate')
    props.each { p ->
        if (!Collection.class.isAssignableFrom(p.type)) {
            if (hasHibernate) {
                cp = domainClass.constrainedProperties[p.name]
                display = (cp ? cp.display : true)
            }
            if (display) { %>
    <div class="control-group \${hasErrors(bean: ${propertyName}, field: '${p.name}', 'error')}">
        <label for="${p.name}" class="control-label"><g:message code="${domainClass.propertyName}.${p.name}.label"
                                                                default="${p.naturalName}"/></label>

        <div class="controls">
            ${renderEditor(p)}
            <span class="help-inline">\${hasErrors(bean: ${propertyName}, field: '${p.name}', 'error')}</span>
        </div>
    </div>
    <% }
    }
    } %>
    <div class="form-actions">
        <g:submitButton name="create" class="save btn-success"
                        value="\${message(code: 'default.button.create.label', default: 'Create')}"/>
        <button class="btn" type="reset">Reset</button>
    </div>
    </g:form>

</section>

</body>
</html>
