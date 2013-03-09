<div class="well">
    <ul class="nav nav-list">
        <li class="nav-header">${entityName}</li>
        <li>
            <g:link class="list" action="list">
                <i class="icon-list"></i>
                <g:message code="default.list.label" args="[entityName]" />
            </g:link>
        </li>
        <li class="active">
            <g:link class="create" action="create">
                <i class="icon-plus icon-white"></i>
                <g:message code="default.create.label" args="[entityName]" />
            </g:link>
        </li>
    </ul>
</div>