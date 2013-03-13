<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="gnutov@gmail.com">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

    <title><g:layoutTitle default="Wiki"/></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'wiki.css')}" />
    <link rel="shortcut icon" href="${resource(dir: 'images/skin', file: 'wiki.png')}"/>
    <r:require modules="bootstrap"/>
    <g:layoutHead/>

    <style type="text/css">
        body {padding-top: 60px;}
    </style>

    <g:javascript library="jquery" plugin="jquery"/>
    <r:layoutResources/>
</head>

<body>
<g:render template="/forkme"/>
<g:render template="/menu/main"/>
<div id="Content" class="container-fluid">

    <div class="row-fluid">
        <div class="span3">
            <g:render template="/wikipanel"/>
        </div>

        <div class="span9">
            <g:render template="/flash"/>

            <g:layoutBody/>
        </div>
    </div>

    <hr>
    <g:render template="/footer"/>
</div>

<r:layoutResources/>
</body>
</html>
