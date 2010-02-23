<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<% //WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext()); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Нэвтрэх хэсэг</title>
        <style type="text/css">
            .main {
                position:absolute;
                top:200px;
                right:200px;
            }
            .etest {
                margin-top:150px;
                margin-left:200px;
            }
        </style>
    </head>
    <body>
        <div class="etest">
            <div style="margin-bottom:50px;">Онлайн шалгалтын систем рүү нэвтэрч орохын тулд та бүртгэлтэй <br/>байх хэрэгтэй</div>
            <img src="<c:url value="/images/math.jpg"/>" alt="online"/>
        </div>
        <div class="main">
            <form action="" method="post">
                <c:if test="${msg != null}">
                    ${msg}
                </c:if>
                <table style="border:solid 1px graytext; padding:10px; padding-top:20px;padding-bottom:70px;">
                    <c:if test="${msg != null}">
                        <tr>
                            <td>${msg}</td>
                        </tr>
                    </c:if>
                    <tr>
                        <td>Нэвтрэх нэр</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="userName"></td>
                    </tr>
                    <tr>
                        <td>Нууц үг</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="pass"></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;"><input type="submit" value="Нэвтрэх"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
