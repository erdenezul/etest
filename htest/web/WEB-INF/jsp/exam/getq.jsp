<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%@include file="../include.jsp" %>
Асуултын дугаар:${param.qId+1}
<tiles:insert page="${question.template}">

</tiles:insert>
<div align="center">
    <c:if test="${question.ufile!=null}">
        <c:choose>
            <c:when test="${question.ufile.fileType=='Зураг'}">
                <img src="<c:url value="/getfile.htm?f=${question.ufile.url}"/>" alt="image"/>
            </c:when>
            <c:when test="${question.ufile.fileType=='Видео'}">
                <script type="text/javascript" src="flowplayer-3.1.4.min.js"></script>
                <a
                    href="<c:url>/getfile.htm?f=${question.ufile.url}</c:url>"
                    style="display:block;width:425px;height:300px;"
                    id="player">
                </a>
                <script type="text/javascript">
                    flowplayer("player", "/player/flowplayer-3.1.5.swf");
                </script>
            </c:when>
            <c:otherwise>
                Файлыг таньсангүй
            </c:otherwise>
        </c:choose>
    </c:if>
</div>