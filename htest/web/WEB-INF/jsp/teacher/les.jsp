<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%@include file="../include.jsp" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Багшийн удирдлагын хэсэг" />
    <tiles:put name="style">
        <style type="text/css">
            .table td {
                padding-left:20px;
                padding-right:70px;
            }
            .content input {
                margin-left:50px;
            }
            .table {
                margin-top:20px;
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
    </tiles:put>
    <tiles:put name="content">
        <div>
            <div>
                Хичээл: ${lesson.lessonName}
            </div>
            <div class="table">
                <table>
                    <thead>
                        <tr>
                            <td>ID</td>
                            <td>Сэдэв:</td>
                        </tr>
                    </thead>
                    <c:forEach items="${lesson.topic}" var="t">
                        <tr>
                            <td>${t.id}</td>
                            <td>${t.description}</td>
                            <td>
                                <form action="" method="post">
                                    <input type="hidden" name="act" value="del"/>
                                    <input type="hidden" name="l" value="${lesson.id}"/>
                                    <input type="hidden" name="tId" value="${t.id}"/>
                                    <input type="submit" value="Устга"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div>
                <form action="" method="post">
                    <input type="hidden" name="act" value="add"/>
                    <input type="hidden" name="l" value="${lesson.id}"/>
                    <input type="text" name="topic"/>
                    <input type="submit" value="Нэм"/>
                </form>
            </div>
        </div>
    </tiles:put>
</tiles:insert>