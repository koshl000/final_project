<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: a
  Date: 2019-06-11
  Time: 오전 1:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        .bs-example {
            margin: 100px;

        }

        .form-group {
            margin: 100px;
        }
    </style>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/res/js/bootstrap-filestyle.min.js"></script>
</head>
<body>
<div>
    <form id="data" method="post" enctype="multipart/form-data">
        <input type="file" name="vidfile">
        <button type="submit" id="button1" style="width: height:20px;width: 100px; margin-top: 15px;margin-left: 200px;
                background-color: #0E993C" ;font>업로드
        </button>
    </form>
</div>
<%--<div class="bs-example">--%>
<%--    <div class="progress">--%>
<%--        <div class="progress-bar" style="width: 60%;">--%>
<%--            60%--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
<script>
    $('#BSbtnsuccess').filestyle({
        buttonName: 'btn-success',
        buttonText: ' Open'
    });
    $('#data').on("submit", function (event) {
        event.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            dataType:'text',
            timeout: 600000,
            success: function (data) {
                alert('파일 업로드가 완료되었습니다.');
            }
        });
    });


</script>
</html>
