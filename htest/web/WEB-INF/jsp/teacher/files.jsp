<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../include.jsp" %>
<tiles:insert page="template.jsp">
    <tiles:put name="title" value="Файлууд" />
    <tiles:put name="style">
        <style type="text/css">
            .filetable a {
                text-decoration:none;
            }
            .filetable td {
                padding:5px;
            }
            form td {
                padding:7px;
            }
            table thead th {
                background-color:#33CCFF;
                border-width:0px;
            }

            .filetable tbody tr:nth-child(even) {
                background-color:#E5EEFF
            }
            .filetable tbody tr:nth-child(odd) {

            }
        </style>
        <script type="text/javascript">
            function del(fId) {
                window.location.href="dfile.htm?fId="+fId;
            }
        </script>
    </tiles:put>
    <tiles:put name="content">
        <div>
            <table class="filetable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Файлын нэр</th>
                        <th>Нэр</th>
                        <th>Төрөл</th>
                        <th>Татах зам(URL)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${teacher.files}" var="f">
                        <tr>
                            <td>${f.id}</td>
                            <td>${f.fileName}</td>
                            <td>${f.name}</td>
                            <td>${f.fileType}</td>
                            <td><a href="<c:url value="/getfile.htm?f=${f.url}"/>">Авах (${f.url})</a></td>
                            <td><input type="button" value="Устгах" onclick="del(${f.id});"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div>
            <form action="" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td>Нэр:</td><td><input name="name" type="text"></td>
                    </tr>
                    <tr>
                        <td>Файл:</td><td><input name="file" type="file"></td>
                    </tr>
                    <tr>
                        <td>Төрөл:</td>
                        <td>
                            <select name="fileType">
                                <option value="Зураг">Зураг</option>
                                <option value="Видео">Видео</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="Хадгалах"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </tiles:put>
</tiles:insert>