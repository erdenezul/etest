<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*, java.util.List"%>
<%@include file="../include.jsp" %>
<%
            List<Grade> gs = (List) request.getAttribute("grades");
            int i = 0;
            double sum = 0;
%>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Багшийн удирдлагын хэсэг" />
    <tiles:put name="style">
        <style type="text/css">
            <!--
            /*@import url("jquery-ui-1.7.2.custom/development-bundle/themes/base/ui.all.css");*/
            body {
                margin: 0px;
                padding: 0px;
            }
            .layer .content .download {
                text-align: right;
                padding: 40px;
            }
            .layer .content .journal {
                text-align: center;
                padding: 10px;
            }
            .journal table td {
                padding:2px;
                padding-left:30px;
                padding-right:30px;
            }
            .journal table thead td {
                background-color:#33CCFF;
                border-width:0px;
            }

            tbody tr:nth-child(even) {
                background-color:#E5EEFF
            }
            tbody tr:nth-child(odd) {

            }
            -->
        </style>
    </tiles:put>
    <tiles:put name="content">
        <div class="content">
            <div>Хичээлийн код: <c:out value="${lesson.code}"/></div>
            <div>Хичээлийн нэр: <c:out value="${lesson.lessonName}"/></div>
            <div class="journal">
                <center>
                    <table>
                        <thead>
                            <tr>
                                <td rowspan="2">№</td>
                                <td colspan="5">Оюутны</td>
                                <td rowspan="2">Тайлбар</td>
                            </tr>
                            <tr>
                                <td>Овог</td>
                                <td>Нэр</td>
                                <td>Код</td>
                                <td>Авсан оноо</td>
                                <td>Дүн</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${grades}" var="g">
                                <tr>
                                    <td><% out.print(++i);%></td>
                                    <td>${g.student.lastName}</td>
                                    <td>${g.student.firstName}</td>
                                    <td>${g.student.code}</td>
                                    <td>${g.score}</td>
                                    <td>${g.relativeScore}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${g.explanation!=null&&g.explanation!=''}">
                                                ${g.explanation}
                                            </c:when>
                                            <c:otherwise>
                                                N/A
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="" method="post">
                                            <input type="hidden" name="tId" value="${param.t}"/>
                                            <input type="hidden" name="gId" value="${g.id}"/>
                                            <input type="submit" value="Хувил"/>
                                        </form>
                                    </td>
                                </tr>
                                <%
            Grade g = (Grade) pageContext.getAttribute("g");
            sum += g.getScore() == null ? 0 : g.getScore();
                                %>
                            </c:forEach>
                            <tr>
                                <td colspan="7">Нийт:
                                    <%
            out.print(gs.size());
                                    %> оюутан. Дундаж <%=((int) (sum * 100 / i)) / (double) 100%>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </center>
            </div>
            <div class="download">
                <form>
                    <%--Тайланг татаж авъя:
                <input type="button" value="Татах" />
                <select>
                    <option>PDF</option>
                    <option>XLS</option>
                    <option>RTF</option>
                    <option>TXT</option>
                </select>--%>

                </form>
                <form method="post" action="dgrade.htm">
                    <input type="hidden" name="tId" value="${param.t}"/>
                    <input type="submit" value="Устга"/>
                </form>
            </div>
        </div>
    </tiles:put>
</tiles:insert>