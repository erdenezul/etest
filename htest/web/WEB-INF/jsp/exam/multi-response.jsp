<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<p>${question.question}</p>
<input type="hidden" id="qtype" value="${question.template}"/>
<c:forEach items="${question.answer}" var="a">
    <input onclick="answeredOn(this,'multi-response.jsp');" class="multi" type="checkbox" name="ans" value="${a.id}"/>${a.answer}<br/>
</c:forEach>