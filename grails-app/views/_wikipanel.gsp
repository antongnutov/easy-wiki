<div id="wikipanel">
  <div class="homePagePanel">
      <div class="panelTop"></div>
      <div class="panelBody">
          <sec:ifAllGranted roles="ROLE_ADMIN">
            <h2>Admin resources</h2>
            <ul>
              <li><g:link controller="console">Groovy console</g:link></li>
              <li><g:link controller="dbconsole">DB console</g:link></li>
            </ul>
          </sec:ifAllGranted>
          
          <h1>All pages</h1>
          <ul>
            <g:each var="page" in="${wiki.WikiPage.list()}">
                <li><g:link controller="wiki" params="[id: page.name]">${page.name}</g:link></li>
            </g:each>
          </ul>
      </div>
      <div class="panelBtm"></div>
  </div>
</div>
