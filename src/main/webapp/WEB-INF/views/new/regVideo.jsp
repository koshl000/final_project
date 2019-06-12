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
    <form id="data" enctype="multipart/form-data" method="post">
        <div class="form-group">
            <input type="file" name="file" id="BSbtnsuccess">
            <input type="submit" value="업로드" id="BSbtnsuccess">
        </div>
    </form>
</div>
<div class="bs-example">
    <div class="progress">
        <div class="progress-bar" style="width: 60%;">
            60%
        </div>
    </div>
</div>
</body>
<script>
    $('#BSbtnsuccess').filestyle({
        buttonName: 'btn-success',
        buttonText: ' Open'
    });
    $('#form#data').submit(function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $.ajax({
            url: "${pageContext.request.contextPath}/professor/${lecture_code}/${class_identifying_code}/regvideo",
            type: 'POST',
            data: formData,
            success: function (data) {
                alert(data)
            },
            cache: false,
            contentType: false,
            processData: false
        });
    });

</script>
</html>
