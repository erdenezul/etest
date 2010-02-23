<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
String qId = request.getParameter("qId");
out.println("Question number:"+qId);
%>
<div>
There are tons of options you can use to control how and when your slide transitions occur. Test them out and see what ones you like. Check out the many examples on this website and see which ones catch your eye.
</div>
<input type="radio" name="ans"/>University<br/>
<input type="radio" name="ans"/>School<br/>
<input type="radio" name="ans"/>College<br/>
<input type="radio" name="ans"/>Institute<br/>