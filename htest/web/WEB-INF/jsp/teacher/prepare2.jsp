<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Багшийн удирдлагын хэсэг" />
    <tiles:put name="style">
        <script type="text/javascript">
            $(function() {
                $("#accordion").accordion({
                    collapsible: true
                });
            });
            function addmore() {
                $("#examContent > tbody").append($("#initial").clone());
            }
            function removeme(dom) {
                $(dom).parent().parent().remove();
            }
            function randomchoose() {
                $("#randomchoose").slideToggle("fast");
            }
            function getmax(dom) {
                var initial = $(dom).parents("#initial");
                var topic = initial.find(".topic");
                topicId = topic.val();
                var difficulty = initial.find(".difficulty");
                diffId = difficulty.val();
                $.get("/test/teacher/getnumberofq.htm", {
                    "tId":topicId,
                    "dId":diffId
                }, function(data) {
                    initial.find(".maxNumber").html("<=" + data);
                });
            <%--alert(topic.options[topic.selectedIndex].value);--%>
                }
        </script>
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
            -->
        </style>
    </tiles:put>
    <tiles:put name="content">
        <table>
            <tr><td>Хичээлийн нэр:</td><td>${lesson.lessonName}</td></tr>
            <tr><td>Шалгалт:</td><td>${test.examType.desc}</td></tr>
        </table>
        <form action="cr8test.htm" method="post">
            <div>
                <input type="button" value="Илүү нэмэх" onclick="addmore();"/>
                <input type="hidden" id="variantNum" name="variantNum" value="<c:out value="${variantNumber}"/>"/>
            </div>
            <table id="examContent">
                <tbody>
                    <tr id="initial">
                        <td>Сэдэв:</td>
                        <td>
                            <select class="topic" name="topic" onchange="getmax(this);">
                                <c:forEach items="${lesson.topic}" var="t">
                                    <option value="${t.id}">${t.description}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>Хүнд хөнгөн</td>
                        <td>
                            <select class="difficulty" name="difficulty" onchange="getmax(this);">
                                <c:forEach items="${difficulty}" var="df">
                                    <option value="${df.id}">${df.description}</option>
                                </c:forEach>
                            </select>
                        </td>
                        <td>Асуултын тоо:</td>
                        <td><input type="text" name="numberOfQuestions" onclick="getmax(this);"/>
                        </td>
                        <td class="maxNumber"></td>
                        <td><a href="#" onclick="removeme(this);">Устга</a></td>
                    </tr>
                </tbody>
            </table>
            <div>
                <table>
                    <tr>
                        <td><input name="doNotIntercept" type="checkbox"/></td><td>Нэг вариантын асуулт бусад вариантуудад байх ёсгүй</td>

                    </tr>
                    <tr>
                        <td><input name="shuffleQuestions" type="checkbox"/></td><td>Вариантын асуултуудыг холино</td>

                    </tr>
                    <tr>
                        <td><input type="checkbox"/></td><td>Асуултын хариултуудыг холино</td>

                    </tr>
                    <tr>
                        <td><input name="randomlyAssign" type="checkbox" onchange="randomchoose(this.checked);"/></td><td>Оюутнуудад санамсаргүйгээр вариант олгоно</td>

                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="randomchoose">
                                <table>
                                    <c:forEach items="${lesson.student}" var="s">
                                        <tr>
                                            <td>
                                                ${s.code}
                                                <input type="hidden" name="student" value="${s.id}"/>
                                            </td>
                                            <td>
                                                Вариант:
                                                <select name="variant">
                                                    <%
            Long vn = (Long) request.getAttribute("variantNumber");
            for (char var = 'A'; vn-- > 0; var++) {
                                                    %>
                                                    <option value="<%=var%>"><%=var%></option>
                                                    <% }%>
                                                </select>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div>
                <div>Тайлбар:(Шалгалт эхлэхийн өмнө үзэгдэнэ. Жишээ нь: "Анхааралтай уншаарай","Амжилт хүсье" г.м)</div>
                <div>
                    <textarea name="desc" cols="90" rows="10"></textarea>
                </div>
            </div>
            <div style="text-align:right;">
                <div><input type="submit" value="Зохио"/></div>
            </div>
        </form>
    </tiles:put>
</tiles:insert>