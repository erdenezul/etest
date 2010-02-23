<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Wow! This is video</title>
        <script src="flowplayer-3.1.4.min.js"></script>
    </head>
    <body>

        <a
            href="billiejean.flv"
            style="display:block;width:425px;height:300px;"
            id="player">
        </a>

        <script language="JavaScript">
            flowplayer("player", "flowplayer-3.1.5.swf");
        </script>
    </body>
</html> 
