<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="gnutov@gmail.com">

    <title><g:layoutTitle default="Wiki"/></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'wiki.css')}" />
    <link rel="shortcut icon" href="${resource(dir: 'images/skin', file: 'wiki.png')}"/>
    <g:layoutHead/>

    <style type="text/css">
    body {
        padding-top: 60px;
        padding-bottom: 40px;
    }

    .sidebar-nav {
        padding: 9px 0;
    }

    @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
            float: none;
            padding-left: 5px;
            padding-right: 5px;
        }
    }
    </style>

    <g:javascript library="jquery" plugin="jquery"/>
    <r:require modules="application"/>
    <r:require modules="bootstrap-full"/>
    <r:layoutResources/>
</head>

<body>
<g:render template="/menu/main"/>

<div id="Content" class="container-fluid">

    <div class="row-fluid">
        <div class="span3">
            <g:render template="/wikipanel"/>
        </div>

        <div class="span9">
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

            <g:layoutBody/>
        </div>
    </div>

    <hr>
    <g:render template="/footer"/>
</div>

%{--<div id="footer">
    <g:render template="/footer"/>
</div>--}%
<r:layoutResources/>
</body>
</html>
