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
                $("#resourse").css("visibility", "hidden");
            });
            function check_form() {
                document.getElementById("myform").submit();
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
            .layer .content #labs > li {
                list-style-type: none;
            }
            #myform table td {
                padding-top:3px;
                padding-bottom:3px;
            }
            #myform table {
                margin-left:40px;
            }
            #myform {
                padding-top:50px;
            }
            -->
        </style>
    </tiles:put>
    <tiles:put name="content">
        <form id="myform" action="prepare2.htm" method="post">
            <table>
                <tr>
                    <td><select name="examType">
                            <c:forEach items="${examTypes}" var="e">
                                <option value="${e.id}">${e.desc}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Шалгалтын төрөл:</td>
                </tr>
                <tr>
                    <td><select name="lesson">
                            <c:forEach items="${teacher.lesson}" var="l">
                                <option value="${l.id}">${l.code}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>Хичээл:</td>
                </tr>
                <tr>
                    <td><input type="text" name="duration" class="valid-number" /></td>
                    <td>Шалгалт явагдах хугацаа(минутаар)</td>
                </tr>
                <tr>
                    <td class="datetime start">
                        <div id="datetime">
                            <select name="start-year" class="year">
                                <option>2009</option>
                                <option>2010</option>
                                <option>2011</option>
                            </select>
                            <select name="start-month" class="month">
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="start-day" class="day">
                                <option>31</option>
                                <option>30</option>
                                <option>29</option>
                                <option>28</option>
                                <option>27</option>
                                <option>26</option>
                                <option>25</option>
                                <option>24</option>
                                <option>23</option>
                                <option>22</option>
                                <option>21</option>
                                <option>20</option>
                                <option>19</option>
                                <option>18</option>
                                <option>17</option>
                                <option>16</option>
                                <option>15</option>
                                <option>14</option>
                                <option>13</option>
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="start-hour" class="hour">
                                <option>00</option>
                                <option>23</option>
                                <option>22</option>
                                <option>21</option>
                                <option>20</option>
                                <option>19</option>
                                <option>18</option>
                                <option>17</option>
                                <option>16</option>
                                <option>15</option>
                                <option>14</option>
                                <option>13</option>
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="start-minute" class="minute">
                                <option>00</option>
                                <option>55</option>
                                <option>50</option>
                                <option>45</option>
                                <option>40</option>
                                <option>35</option>
                                <option>30</option>
                                <option>25</option>
                                <option>20</option>
                                <option>15</option>
                                <option>10</option>
                                <option>5</option>
                            </select>
                        </div>
                    </td>
                    <td>Эхлэх огноо(он/сар/өдөр/цаг/минут)</td>
                </tr>
                <tr>
                    <td class="datetime end">
                        <div id="datetime">
                            <select name="end-year" class="year">
                                <option>2009</option>
                                <option>2010</option>
                                <option>2011</option>
                            </select>
                            <select name="end-month" class="month">
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="end-day" class="day">
                                <option>31</option>
                                <option>30</option>
                                <option>29</option>
                                <option>28</option>
                                <option>27</option>
                                <option>26</option>
                                <option>25</option>
                                <option>24</option>
                                <option>23</option>
                                <option>22</option>
                                <option>21</option>
                                <option>20</option>
                                <option>19</option>
                                <option>18</option>
                                <option>17</option>
                                <option>16</option>
                                <option>15</option>
                                <option>14</option>
                                <option>13</option>
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="end-hour" class="hour">
                                <option>00</option>
                                <option>23</option>
                                <option>22</option>
                                <option>21</option>
                                <option>20</option>
                                <option>19</option>
                                <option>18</option>
                                <option>17</option>
                                <option>16</option>
                                <option>15</option>
                                <option>14</option>
                                <option>13</option>
                                <option>12</option>
                                <option>11</option>
                                <option>10</option>
                                <option>9</option>
                                <option>8</option>
                                <option>7</option>
                                <option>6</option>
                                <option>5</option>
                                <option>4</option>
                                <option>3</option>
                                <option>2</option>
                                <option>1</option>
                            </select>
                            <select name="end-minute" class="minute">
                                <option>00</option>
                                <option>55</option>
                                <option>50</option>
                                <option>45</option>
                                <option>40</option>
                                <option>35</option>
                                <option>30</option>
                                <option>25</option>
                                <option>20</option>
                                <option>15</option>
                                <option>10</option>
                                <option>5</option>
                            </select>
                        </div>
                    </td>
                    <td>Дуусах огноо(он/сар/өдөр/цаг/минут)</td>
                </tr>
                <tr>
                    <td><input type="text" class="valid-number" name="variantNumber"/></td>
                    <td>Вариантын тоо</td>
                </tr>
                <tr>
                    <td><input type="checkbox" name="registerStudentAtRuntime"/></td>
                    <td>Хичээлд бүртгэлгүй оюутан шалгалт өгч болно</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div>Шалгалт явагдах өрөөнүүд:</div>
                        <ul id="labs">
                            <li><input type="checkbox" id="lab_all" name="rooms" value="-1"/>Бүх газар</li>
                                <c:forEach items="${rooms}" var="r">
                                <li><input type="checkbox" name="rooms" value="${r.id}"/>${r.desc}</li>
                                </c:forEach>
                        </ul>
                    </td>
                </tr>
            </table>
            <div style="margin-left:200px;"><input type="button" value="Үүсгэ" onclick="check_form();"/></div>
        </form>
    </tiles:put>
</tiles:insert>