<script type="text/javascript">
    $(document).ready(function() {
        $('.tooltipable').tooltip();
    });
</script>

<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'name', 'error')}">
    <div class="value">
        <g:textField class="tooltipable" name="name" maxlength="100" value="${wikiPageInstance?.name}" placeholder="${message(code: 'wikiPage.name.placeholder', default: 'Name')}"
                     title="${message(code: 'wikiPage.name.tooltip', default: 'Page name')}"/>
        <span class="help-inline">${hasErrors(bean: wikiPageInstance, field: 'name', 'error')}</span>
    </div>
</div>

<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'content', 'error')}">
    <div class="value">
        <g:textArea class="input-block-level" name="content" rows="20" value="${wikiPageInstance?.content}" style="height: 30em;" placeholder="${message(code: 'wikiPage.content.label', default: 'Content')}"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'syntax', 'error')}">
    <div class="value">
        <g:select class="tooltipable" name="syntax" from="${wikiPageInstance.constraints.syntax.inList}" value="${wikiPageInstance?.syntax}"
                  valueMessagePrefix="wikiPage.syntax" title="${message(code: 'wikiPage.syntax.tooltip', default: 'Wiki syntax')}"/>
    </div>
</div>

<div class="control-group ${hasErrors(bean: wikiPageInstance, field: 'parentPage', 'error')}">
    <div class="value">
        <g:select class="tooltipable" name="parentPage.id" from="${wiki.WikiPage.list()}" optionKey="id" value="${wikiPageInstance?.parentPage?.id}"
                  noSelection="['null': '']" title="${message(code: 'wikiPage.parentPage.tooltip', default: 'Parent page')}"/>
    </div>
</div>