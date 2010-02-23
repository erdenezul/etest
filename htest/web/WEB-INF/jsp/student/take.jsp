<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8" import="modls.*"%>
<%@include file="../include.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<c:url value="/scripts/jquery-1.3.2.js"/>">
        </script>
        <script type="text/javascript" src="<c:url value="/scripts/jquery.cycle.all.js"/>">
        </script>
        <style type="text/css">
            #head {
                position:absolute;
                top:0;
                left:0;
                width:100%;
                height:150px;
            }
            #s7 {
                margin:0;
                margin-top:150px;
                margin-right:200px;
                height:500px;
                border:1px solid #000000;
                border-left:#ffffff;
                border-bottom:#ffffff;
            }
            #s7 > div {
                padding:20px;
                width: 700px;
            }
            #nav {
                position:absolute;
                right:0;
                top:0;
                margin-top:180px;
                padding:0;
                width:200px;
                cursor:pointer;
                padding-bottom:30px;
            }
            .navi {
                text-align:center;
                margin:5px;
            }
            #nav .navi:hover {
                background-color:green;
            }
            .answered {
                background-color:orange;
            }
            .asuulg {
                padding-bottom:50px;
            }
        </style>
        <script type="text/javascript">
            var currentV = 0;
            var qId = -1;
            $('#s7').cycle({
                fx:     'scrollDown',
                speed:  'fast',
                timeout:0
            });
            $(function() {
                $("#nav .navi").click(function(){
                    qId = parseInt($(this).find("span").text())-1;
                    $.get("/test/exam/getq.htm", {
                        "qId":qId
                    }, function(data) {
                        if(currentV == 0) {
                            $($("#s7 > div").get(1)).html(data);
                            currentV = 1;
                        } else
                            if(currentV == 1) {
                                $($("#s7 > div").get(0)).html(data);
                                currentV = 0;
                            }
                        $("#s7").cycle('next');
                        url = "";
                    });
                });
                decTime();
            })
            function decTime() {
                var time = parseInt($("#time").html());
                if(time==0) {
                    alert("Хугацаа дууслаа.");
                    window.location.href="index.htm";
                }
                $("#time").html(time-1);
                setTimeout(decTime, 1000);
            }
            function answeredOn(boolValue,qtype) {
                $(".Q"+qId+"").addClass("answered");
                var url = "ansexam.htm?qId="+qId;
                switch(qtype) {
                    case "multi-choice.jsp": {
                            url+="&aId="+$(boolValue).val()+"&type=multi-choice";
                            break;
                        }
                    case "multi-response.jsp": {
                            $(".multi").each(function() {
                                if($(this).attr("checked")) {
                                    url+="&aId="+$(this).val();
                                }
                            });
                            url+="&type=multi-response";
                            break;
                        }
                    case "true-false.jsp": {
                            if(boolValue) { url+="&a=true&type=true-false"; }
                            else { url+="&a=false&type=true-false"; }
                            break;
                        }
                    case "fillinblank.jsp": {
                            break;
                        }
                }
            <%--alert(url);--%>
                    $.get(url, null, function(data) {
            <%--alert(url+":"+data);--%>
                    });
                    url = "";
                }
        </script>
        <script type="text/javascript">

            function onKeyDown() {
                // current pressed key
                var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();

                if (event.ctrlKey && (pressedKey == "c" ||
                    pressedKey == "v")) {
                    // disable key press porcessing
                    event.returnValue = false;
                }
            } // onKeyDown
        </script>
    </head>
    <body oncontextmenu="return false;" onkeydown="onKeyDown();" style="background-color:#CCFFEE">
        <div id="head" style="background-color:#CCFFEE">
            <div style="padding-top:100px;padding-left:50px;">Тестийн нийт хугацаа: <span style="color:green;">${test.durationInMinute}</span> минут, Оюутны код:${student.code}<br/></div>
        </div>
        <div id="s7" style="background-color:white;">
            <div>
                Шалгалт эхлэхэд бэлэн боллоо.
            </div>
            <div>
                ${test.desc}
            </div>
        </div>
        <div id="nav">
            <div class="asuulg">
                Хугацаа: <span id="time">${seconds}</span>
            </div>
            <c:forEach items="${grade.questionOrder}" var="qo">
                <c:if test="${!qo.answered}">
                    <div class="navi Q${qo.orderNumber}">Асуулт №<span>${qo.orderNumber+1}</span></div>
                </c:if>
            </c:forEach>
            <div style="text-align:center;"><a href="finish.htm">Дуусгах</a></div>
        </div>
    </body>
</html>
