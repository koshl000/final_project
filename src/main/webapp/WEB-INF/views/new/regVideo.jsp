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
${pageContext.request.contextPath}/professor/regVideo
<div>
    <form id="data" enctype="multipart/form-data" method="post">
        <div class="form-group">
            <form>
                <input type="file" name="file" id="BSbtnsuccess">
                <input type="hidden" name="lecture_code" value="${lecture_code}">
                <input type="hidden" name="class_identifying_code" value="${class_identifying_code}">
                <button>업로드</button>
            </form>
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
    $('#fileSubmit').submit(function () {
        $.ajax({
            type: "post",
            enctype: 'multipart/form-data',
            url: "/professor/regvideo",
            data:

        })
    })

</script>
</html>
