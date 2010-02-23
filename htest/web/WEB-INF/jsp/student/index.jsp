<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%@include file="../include.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Оюутны хэсэг</title>
        <style type="text/css">
            .examresult td {
                padding:20px;
                padding-top:0px;
                padding-bottom:10px;
            }
            body {
                text-align:center;
            }
            tbody td {
                padding-bottom:10px;
                padding-right:10px;
                padding-left:10px;
            }
            .signout {
                position:absolute;
                top:5px;
                right:5px;
            }

            table thead td {
                background-color:#33CCFF;
                border-width:0px;
            }

            tbody tr:nth-child(even) {
                background-color:#E5EEFF
            }
            tbody tr:nth-child(odd) {

            }
        </style>
    </head>
    <body>
        <h1>${student.code} <span style="font-size:medium">${student.firstName}</span></h1>
        <div class="signout"><a href="login.htm">гарах</a></div>
        <div>
            <h3>Идэвхтэй шалгалтууд:</h3>
            <center>
                <table>
                    <thead>
                        <tr>
                            <td>Код</td>
                            <td>Нэр</td>
                            <td>Төрөл</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${student.lesson}" var="l">
                            <c:forEach items="${l.exam}" var="e">
                                <c:if test="${e.isActive}">
                                    <tr>
                                        <td>${l.code}</td>
                                        <td>${l.lessonName}</td>
                                        <td>${e.examType.desc}</td>
                                        <td><a href="take.htm?id=${e.id}">Өгөх</a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                    </tbody>
                </table>
            </center>
        </div>
        <div>
            <h3>Өгсөн шалгалт</h3>
            <center>
                <table class="examresult">
                    <thead>
                        <tr>
                            <td>Код:</td>
                            <td>Хичээл:</td>
                            <td>Төрөл:</td>
                            <td>Оноо:</td>
                            <td>Дүн:</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${gs}" var="g">
                            <c:if test="${g[0]!=null}">
                                <tr>
                                    <td>${g[0]}</td>
                                    <td>${g[1]}</td>
                                    <td>${g[2]}</td>
                                    <td>${g[3]} оноо</td>
                                    <td>${g[4]}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
</html>
