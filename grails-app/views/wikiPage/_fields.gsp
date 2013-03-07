<script type="text/javascript">
    $(document).ready(function() {
        $('.tooltipable').tooltip();
    });
</script>

<div class="control-group">
    <div class="value ${hasErrors(bean: wikiPageInstance, field: 'name', 'errors')}">
        <g:textField class="tooltipable" name="name" maxlength="100" value="${wikiPageInstance?.name}" placeholder="${message(code: 'wikiPage.name.placeholder', default: 'Name')}"
                     title="${message(code: 'wikiPage.name.tooltip', default: 'Page name')}"/>
    </div>
</div>

<div class="control-group">
    <div class="value ${hasErrors(bean: wikiPageInstance, field: 'content', 'errors')}">
        <g:textArea class="input-block-level" name="content" rows="20" value="${wikiPageInstance?.content}" style="height: 30em;" placeholder="${message(code: 'wikiPage.content.label', default: 'Content')}"/>
    </div>
</div>

<div class="control-group">
    <div class="value ${hasErrors(bean: wikiPageInstance, field: 'syntax', 'errors')}">
        <g:select class="tooltipable" name="syntax" from="${wikiPageInstance.constraints.syntax.inList}" value="${wikiPageInstance?.syntax}"
                  valueMessagePrefix="wikiPage.syntax" title="${message(code: 'wikiPage.syntax.tooltip', default: 'Wiki syntax')}"/>
    </div>
</div>

<div class="control-group">
    <div class="value ${hasErrors(bean: wikiPageInstance, field: 'parentPage', 'errors')}">
        <g:select class="tooltipable" name="parentPage.id" from="${wiki.WikiPage.list()}" optionKey="id" value="${wikiPageInstance?.parentPage?.id}"
                  noSelection="['null': '']" title="${message(code: 'wikiPage.parentPage.tooltip', default: 'Parent page')}"/>
    </div>
</div>