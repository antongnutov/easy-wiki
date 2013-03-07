<g:set var="lang" value="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'}"/>

<li class="dropdown">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <span>${lang ? lang.toString().toUpperCase() : "${message(code: 'default.language.button', default: 'Language')}"}</span>
        <b class="caret"></b>
    </a>
    <ul class="dropdown-menu">
        <li><a title="English" data-lang-code="en" href="${createLink(uri: '/?lang=en')}">English</a></li>
        <li><a title="German" data-lang-code="de" href="${createLink(uri: '/?lang=de')}">Deutsch</a></li>
        <li><a title="Spanish" data-lang-code="es" href="${createLink(uri: '/?lang=es')}">Español</a></li>
        <li><a title="French" data-lang-code="fr" href="${createLink(uri: '/?lang=fr')}">Français</a></li>
        <li><a title="Russian" data-lang-code="ru" href="${createLink(uri: '/?lang=ru')}">Русский</a></li>
    </ul>
</li>