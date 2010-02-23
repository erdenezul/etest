<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<style type="text/css">
    .bool {
        text-decoration:none;
    }
</style>
<script type="text/javascript">
    $($(".bool").click(function() {
        $(".bool").css("color", "red");
        $(this).css("color", "green");
        if($(this).html()=="Үнэн") {
            answeredOn(true,'true-false.jsp');
        } else if($(this).html()=="Худал") {
            answeredOn(false,'true-false.jsp');
        }
    }));
</script>
<p>${question.question}(<a class="bool" href="#">Үнэн</a>/<a class="bool" href="#">Худал</a>)</p>
<input type="hidden" id="qtype" value="${question.template}"/>
