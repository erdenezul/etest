<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Багшийн удирдлагын хэсэг" />
    <tiles:put name="style">
        <script src="<c:url value="/speckedit-1-0/speck/speck.js"/>" type="text/javascript"></script>
        <link href="<c:url value="/speckedit-1-0/speck/speck.css"/>" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
            var mcrow;
            $(function() {
                $("#accordion").accordion({
                    collapsible: true
                });
                $("#questiontypes > li").hover(function(){
                    $(".editor").html($("#"+$(this).attr("my")).clone());
                    //$(".editor textarea").addClass("iEdit");
                    //speckInit();
                    $(".editor textarea").attr("name", "question");
                });
                mcrow = $($(".mcirow").get(0));
                $("#resource").hide();
                lessonchanged(0);
            });
            function addmcirow(dom) {
                $(dom).parents(".mctable").append(mcrow.clone());
            }
            function removemcrow(dom) {
                $(dom).parents(".mcirow").remove();
            }
            function lessonchanged(index) {
                $.get("/test/teacher/ajax.htm", {
                    "lessonId":document.getElementById("lessons").options[index].value
                }, injectTopics);
            }
            function injectTopics(data) {
                $("#topics").html(data);
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
            .layer .content td {
                text-align: center;
            }
            .layer .content #questiontypes li {
                list-style-type: none;
                padding: 5px;
            }
            .layer .content #questiontypes li:hover {
                background:#33FFFF;
            }

            .layer .content .questionmenu {
                padding: 5px;
                height: 300px;
                vertical-align:top;
            }

            -->
        </style>
    </tiles:put>
    <tiles:put name="content">
        <c:if test="${param.success}">
            <div>Амжилттай хадгаллаа</div>
        </c:if>
        <form method="post" action="">
            <table width="100%">
                <tr>
                    <td>Хичээл:
                        <select name="lesson" id="lessons" onchange="lessonchanged(this.selectedIndex);">
                            <c:forEach items="${teacher.lesson}" var="l">
                                <option value="${l.id}">${l.code}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Сэдэв:
                        <select name="topic" id="topics">
                            <option value="1">D.SW202</option>
                            <option value="2">D.SW202</option>
                            <option value="3">D.SW202</option>
                        </select>
                    </td>
                    <td>Хүнд хөнгөн:
                        <select name="difficulty">
                            <c:forEach items="${difficulty}" var="d">
                                <option value="${d.id}">${d.description}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table width="100%">
                            <tr>
                                <td width="20%" class="questionmenu"><ul id="questiontypes">
                                        <li my="multipleresponse-form">Олон хариутай</li>
                                        <li my="multiplechoice-form">Олон сонголттой</li>
                                        <li my="truefalse-form">Үнэн худал</li>
                                        <%--<li my="match-form">Тохируулах</li>--%>
                                        <%--<li my="fill-form">Хоосон зай бөглөх</li>--%>
                                    </ul></td>
                                <td style="vertical-align:top"><div class="editor"></div></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        Медиа нэмэх:
                        <div style="padding-left:100px;">
                            <table>
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>Нэр</td>
                                        <td>Төрөл</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${teacher.files}" var="f">
                                        <tr>
                                            <td width="30px"><input type="radio" name="ufile" value="${f.id}"/></td>
                                            <td width="80px">${f.name}</td>
                                            <td width="80px">${f.fileType}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
        <div id="resource">
            <div id="multiplechoice-form">
                <input type="hidden" name="qtype" value="multiplechoice-form"/>
                <table>
                    <tr>
                        <td>
                            <div style="text-align:left">Асуулт:</div>
                            <div style="text-align:left; ">
                                <textarea cols="90" rows="10" name="question"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="mctable">
                                <tr>
                                    <td><input type="button" onclick="addmcirow(this);" value="Хариулт нэмэх"/></td>
                                </tr>
                                <tr class="mcirow">
                                    <td>Хариулт:<input type="text" name="answer"/></td>
                                    <td>Оноо:<input type="text" name="point"/></td>
                                    <td><a href="#" onclick="removemcrow(this);">Устгах</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Хадгал"/></td>
                    </tr>
                </table>
            </div>
            <div id="multipleresponse-form">
                <input type="hidden" name="qtype" value="multipleresponse-form"/>
                <table>
                    <tr>
                        <td>
                            <div style="text-align:left">Асуулт:</div>
                            <div style="text-align:left; ">
                                <textarea cols="90" rows="10" name="question"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="mctable">
                                <tr>
                                    <td><input type="button" onclick="addmcirow(this);" value="Хариулт нэмэх"/></td>
                                </tr>
                                <tr class="mcirow">
                                    <td>Хариулт:<input type="text" name="answer"/></td>
                                    <td>Оноо:<input type="text" name="point"/></td>
                                    <td><a href="#" onclick="removemcrow(this);">Устгах</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Хадгал"/></td>
                    </tr>
                </table>
            </div>
            <div id="truefalse-form">
                <input type="hidden" name="qtype" value="truefalse-form" />
                <table>
                    <tr>
                        <td>
                            <div style="text-align:left">Асуулт:</div>
                            <div style="text-align:left; ">
                                <textarea cols="90" rows="10" name="question"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" name="val" checked="true" value="true"/>Үнэн
                            <input type="radio" name="val" value="false"/>Худал
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="tfpoint"/>Оноо
                        </td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Хадгал"/></td>
                    </tr>
                </table>
            </div>
            <div id="match-form">
                MATCHING
            </div>
            <div id="fill-form">
                <div style="text-align:left;">Асуулт. Загвар: (&lt;xanswer|pointx&gt;)</div>
                <div style="text-align:left;">
                    <input type="hidden" name="qtype" value="fill-form" />
                    <textarea cols="90" rows="10" name="question"></textarea>
                </div>
                <input type="submit" value="Хадгал"/>
            </div>
        </div>
    </tiles:put>
</tiles:insert>