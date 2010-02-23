<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<c:if test="${topics != null}">
    <c:forEach items="${topics}" var="t">
        <option value="${t.id}">${t.description}</option>
    </c:forEach>
</c:if>
<c:if test="${numberofq != null}">
    <span style="color:red">${numberofq}</span>
</c:if>
