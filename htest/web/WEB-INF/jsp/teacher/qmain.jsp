<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%@include file="../include.jsp" %>
<% int counter=0; %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Асуулт засварлах"/>
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
            .qtable {
                text-align: center;
            }
            .questions td {
                padding:4px;
            }

            tbody tr:nth-child(even) {
                background-color:#E5EEFF
            }
            tbody tr:nth-child(odd) {

            }
            -->
        </style>
        <script type="text/javascript">
            $(function() {
                filter = function(){
                    lesson = $("#lesson").val();
                    topic = $("#topic").val();
                    diffi = $("#difficult").val();
                    type = $("#type").val();
                    var url="?";
                    if(topic!=-1) {
                        url+="topicId="+topic+"&";
                    }
                    if(diffi!=-1) {
                        url+="difficultId="+diffi+"&";
                    }
                    if(type!=-1) {
                        url+="typeId="+type+"&";
                    }
                    url+="lessonId="+lesson;
                    return url;
                };
                changelesson = function() {
                    lesson = $("#lesson").val();
                    var url="?";
                    url+="lessonId="+lesson;
                    window.location.href=url;
                };
                changefilter = function() {
                    window.location.href=filter();
                }
                deletequestion = function(qId) {
                    var back = window.location.href;
                    while(back.indexOf("&")!=-1) {
                        back = back.replace("&","&amp;");
                    }
                    url="deletequestion.htm?qId="+qId+"&back="+window.location.href;
                    window.location.href=url;
                }
                $("#lesson").change(changelesson);
                $("#topic").change(changefilter);
                $("#difficult").change(changefilter);
                $("#type").change(changefilter);
            })
        </script>
    </tiles:put>
    <tiles:put name="content">
        <div class="content">
            <div>
		Хичээл:
                <select id="lesson" onchange="filter();">
                    <c:forEach items="${teacher.lesson}" var="l">
                        <c:choose>
                            <c:when test="${l.id == param.lessonId}">
                                <option selected="true" value="${l.id}">${l.code}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${l.id}">${l.code}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>№</th>
                        <th>
				  Асуулт:
                        </th>
                        <th>
				  Сэдэв:
                            <select id="topic" onchange="filter();">
                                <option value="-1">Бүгд</option>
                                <c:forEach items="${lesson.topic}" var="t">
                                    <c:choose>
                                        <c:when test="${t.id==param.topicId}">
                                            <option selected="true" value="${t.id}">${t.description}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${t.id}">${t.description}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </th>
                        <th>
				  Асуулт хүнд, хөнгөн:
                            <select id="difficult" onchange="filter();">
                                <option value="-1">Бүгд</option>
                                <c:forEach items="${difficulties}" var="d">
                                    <c:choose>
                                        <c:when test="${d.id==param.difficultId}">
                                            <option selected="true" value="${d.id}">${d.description}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${d.id}">${d.description}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </th>
                        <th>
                            Асуултын төрөл:
                            <select id="type" onchange="filter();">
                                <option value="-1">Бүгд</option>
                                <option <c:out value="${param.typeId==1?'selected=\"true\"':''}"/> value="1">Олон сонголттой</option>
                                <option <c:out value="${param.typeId==2?'selected=\"true\"':''}"/> value="2">Үнэн худал</option>
                                <option <c:out value="${param.typeId==3?'selected=\"true\"':''}"/> value="3">Нөхөх</option>
                                <option <c:out value="${param.typeId==4?'selected=\"true\"':''}"/> value="4">Олон хариутай</option>
                            </select>
                        </th>
                    </tr>
                </thead>
                <tbody class="questions">
                    <c:forEach items="${questions}" var="q">
                        <tr>
                            <td>
                                <a href="#"><%=++counter%></a>
                            </td>
                            <td>${q.question}</td>
                            <td class="qtable topic-${q.topic.id}">${q.topic.description}</td>
                            <td class="qtable diff-${q.difficult.id}">${q.difficult.description}</td>
                            <% Question q = (Question) pageContext.getAttribute("q");
            int typeId = -1;
            String type = null;
            if (q instanceof MultipleChoice) {
                type = "Олон сонголттой";
                typeId = 1;
            }
            if (q instanceof TrueFalse) {
                type = "Үнэн худал";
                typeId = 2;
            }
            if (q instanceof FillInBlank) {
                type = "Нөхөх";
                typeId = 3;
            }
            if (q instanceof MultipleResponse) {
                type = "Олон хариутай";
                typeId = 4;
            }
            pageContext.setAttribute("type", type);
            pageContext.setAttribute("typeId", typeId);
                            %>
                            <td class="qtable type-${typeId}">
                                ${type}
                            </td>
                            <td>
                                <input type="submit" value="Устга" onclick="deletequestion(${q.id});"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </tiles:put>
</tiles:insert>