<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Тест"/>
    <tiles:put name="style">
        <style type="text/css">
            .table {
                padding-top:50px;
            }
            .table td {
                padding:3px;
                padding-left:30px;
                padding-right:30px;
            }
            .content {
                text-align:center;
            }
            thead td {
                background-color:#33CCFF;
            }
            tbody tr:nth-child(even) {
                background-color:#E5EEFF
            }
            tbody tr:nth-child(odd) {

            }
        </style>
    </tiles:put>
    <tiles:put name="content">
        <center>
            <table class="table">
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Тест</td>
                        <td>Хичээл</td>
                        <td>Төлөв</td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${tests}" var="t">
                        <tr>
                            <td>${t.id}</td>
                            <td>${t.examType.desc}</td>
                            <td>${t.lesson.lessonName}</td>
                            <td>
                                <a href="?toggle=yes&tId=${t.id}">
                                    <c:choose>
                                        <c:when test="${t.isActive}">
                                            Идэвхтэй
                                        </c:when>
                                        <c:when test="${!t.isActive}">
                                            Идэвхгүй
                                        </c:when>
                                    </c:choose>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </center>
        <div>
            <p>Тайлбар:<br/>Энэ нь зөвхөн идэвхгүй шалгалтуудыг идэвхгүй болгоход ашиглагдана. Буцаад тэрхүү шалгалтыг идэвхгүй болгоно.</p>
        </div>
    </tiles:put>
</tiles:insert>