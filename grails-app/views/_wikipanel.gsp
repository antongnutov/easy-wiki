<div class="well sidebar-nav">
  <sec:ifAllGranted roles="ROLE_ADMIN">
    <h4>Admin resources</h4>
    <ul class="nav nav-list">
      <li><g:link controller="console">Groovy console</g:link></li>
      <li><g:link controller="dbconsole">DB console</g:link></li>
      <li><g:link controller="user">Users</g:link></li>
      <li><g:link controller="userRole">User roles</g:link></li>
    </ul>
  </sec:ifAllGranted>

  <h4>All pages</h4>
  <ul class="nav nav-list">
    <g:each var="page" in="${wiki.WikiPage.list()}">
        <li><g:link controller="wiki" params="[id: page.name]">${page.name}</g:link></li>
    </g:each>
  </ul>
</div>