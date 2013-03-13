<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title><g:layoutTitle default="Login" /></title>
    <link rel="shortcut icon" href="${resource(dir: 'images/skin', file: 'wiki.png')}"/>
    
    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <r:require modules="bootstrap"/>
    <g:layoutHead />
    <style type="text/css">
        body {
            padding-top: 60px;
        }
    </style>
    <style type="text/css">
        body {padding-top: 60px;}
    </style>

    <r:layoutResources/>
</head>

<body>
    <g:render template="/menu/main"/>
        
    <div id="Content" class="container-fluid">
    
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
    
        <g:layoutBody />
    </div>
            
    <r:layoutResources />   
</body>

</html>