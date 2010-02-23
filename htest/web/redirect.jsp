<%--
Views should be stored under the WEB-INF folder so that
they are not accessible except through controller process.

This JSP is here to provide a redirect to the dispatcher
servlet but should be the only JSP outside of WEB-INF.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="scripts/jquery-1.3.2.js"></script>
        <script type="text/javascript" src="ui/ui.core.js"></script>
        <script type="text/javascript" src="ui/ui.accordion.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#accordion").accordion({
                    autoHeight: false
                });
            })
        </script>
        <style type="text/css">
            #accordion {
                width:300px;
            }
            #accordion > div {
                margin-left:20px;
            }
        </style>
    </head>
    <body>
        <div id="accordion">
            <h3><a href="#">Асуулт</a></h3>
            <div>
                <div>Нэмэх</div>
                <div>Жагсаалт</div>
            </div>
            <h3><a href="#">Хичээл</a></h3>
            <div>
                <div>Жагсаалт</div>
                <div></div>
            </div>
            <h3><a href="#">Шалгалт</a></h3>
            <div>
                <div>Нэмэх</div>
                <div>Удирдах</div>
            </div>
            <h3><a href="#">Дүн</a></h3>
            <div>
                <div>D.EL310</div>
                <div>D.EL210</div>
                <div>D.EL102</div>
            </div>
        </div>
    </body>
</html>