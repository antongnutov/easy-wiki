<g:if test="${flash.message}">
    <div class="alert alert-block alert-info">
        <a class="close" data-dismiss="alert" href="#">&times;</a>
        ${flash.message}
    </div>
</g:if>

<g:if test="${flash.error}">
    <div class="alert alert-block alert-error">
        <a class="close" data-dismiss="alert" href="#">&times;</a>
        ${flash.error}
    </div>
</g:if>