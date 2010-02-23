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
                $("#lab_all").click(function() {
                    $("#labs input").not("#lab_all").attr("checked", $("#lab_all").attr("checked"));

                });
                $('input.valid-number').bind('keypress', function(e) {
                    return ( e.which!=8 && e.which!=0 && (e.which<48 || e.which>57)) ? false : true ;
                })
                $(".datepicker").datepicker({
                    minDate: -0,
                    maxDate: '+1M +10D'
                });
                $(".datetime").append($("#datetime"));
                $("#resourse").css("visibility", "hidden");
            });
            function check_form() {

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
        <p>Онлайн шалгалтын веб хуудсанд тавтай морилно уу.</p>
    </tiles:put>
</tiles:insert>