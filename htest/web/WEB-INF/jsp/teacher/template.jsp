<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title><tiles:getAsString name="title"/></title>
        <link href="<c:url value="/style/general.css" />" rel="stylesheet" type="text/css" />
        <style type="text/css">
            .leftpanel a {
                text-decoration:none;
            }
            .leftpanel {
                padding-left:10px;
                padding-top:20px;
                padding-bottom:20px;
            }
            .header {
                background-image:url(<c:url value="/images/header.jpg"/>);
                background-position:center;
                background-repeat:no-repeat;
            }
            #accordion h3:hover {
                background-color:#ffff00;
            }
            #accordion h3 {
                padding:2px;
            }
        </style>
        <script type="text/javascript" src="<c:url value="/jquery-ui-1.7.2.custom/development-bundle/jquery-1.3.2.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/jquery-ui-1.7.2.custom/development-bundle/ui/ui.core.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/jquery-ui-1.7.2.custom/development-bundle/ui/ui.accordion.js"/>"></script>
        <script type="text/javascript">
            $(function() {
                $("#accordion").accordion({
                    collapsible: true
                });
            });
        </script>
        <tiles:getAsString name="style"/>
    </head>
    <body>
        <div class="header">&nbsp;</div>
        <div class="layer">
            <table width="100%" border="0">
                <tr>
                    <td width="20%" align="left" valign="top">
                        <div class="leftpanel">
                            <div>${teacher.firstName} ${teacher.code}</div>
                            <div id="accordion">
                                <h3><a href="#">Дүн</a></h3>
                                <div>
                                    <table id="exam">
                                        <c:forEach items="${teacher.lesson}" var="l">
                                            <c:forEach items="${l.exam}" var="t">
                                                <tr>
                                                    <td><a href="grades.htm?t=${t.id}" style="text-decoration:none">${l.code}</a></td>
                                                    <td>${t.examType.desc}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:forEach>
                                    </table>
                                </div>
                                <h3><a href="#">Шалгалт</a></h3>
                                <div>
                                    <div><a href="<c:url value="/teacher/prepare.htm" />">Бэлдэх</a></div>
                                    <div><a href="<c:url value="/teacher/tcontrol.htm" />">Удирдах</a></div>
                                </div>
                                <h3><a href="#">Асуултын сан</a></h3>
                                <div>
                                    <div><a href="<c:url value="/teacher/qadd.htm" />">Нэмэх</a></div>
                                    <div><a href="<c:url value="/teacher/qmain.htm" />">Засварлах</a></div>
                                </div>
                                <h3><a href="#">Хичээл</a></h3>
                                <div>
                                    <table id="exam">
                                        <c:forEach items="${teacher.lesson}" var="l">
                                            <tr>
                                                <td> <a href="les.htm?l=${l.id}">${l.code}</a> </td>
                                                <td> ${l.lessonName} </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <h3><a href="#" onclick="window.location.href='files.htm';">Файлууд</a></h3>
                            </div>
                            <div id="signout"><a href="<c:url value="/teacher/signout.htm"/>">Гарах</a></div>
                        </div>
                    </td>
                    <td width="80%" align="left" valign="top">
                        <div class="content">
                            <tiles:getAsString name="content"/>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="bottom">SW06D103, Melug</div>
    </body>
</html>