<%@ page import="org.codehaus.groovy.grails.web.servlet.GrailsApplicationAttributes" %>
<!doctype html>
<html lang="en">
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

    <r:layoutResources/>
</head>

<body>
<g:render template="/forkme"/>
<g:render template="/menu/main"/>

<div id="Content" class="container-fluid">

    <div class="row-fluid">
        <g:layoutBody/>
    </div>

    <hr>
    <g:render template="/footer"/>
</div>

<r:layoutResources/>
</body>
</html>