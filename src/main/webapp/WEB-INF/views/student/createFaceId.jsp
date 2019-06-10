<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 15.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
 --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CreateFaceId</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/res/js/webcam.min.js"></script>
<!-- dialog CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">	

<script type="text/javascript">
$(function() {
	
	if (!($('.modal.in').length)) {
		$('.modal-dialog').css({
			top : 0,
			left : 0
		});
	}
	$('#faceModal').modal({
		backdrop : false,
		show : true
	});

//   $("#faceModal").modal({backdrop: 'static', keyboard: false});
	
	var fac1;
	 $("#createFaceid").on('click', function(){
		var data1;
		// take snapshot and get image data
		Webcam.snap(function(data_uri) {
					// display results in page
					document.getElementById('results').innerHTML = '<img src="'+data_uri+'"/>';
					data1 = data_uri;
					var params = {
						// Request parameters
						"returnFaceId" : "true",
						"returnFaceLandmarks" : "false",
						"returnFaceAttributes" : "age,gender,headPose,smile,facialHair,glasses,emotion,"
								+ "hair,makeup,occlusion,accessories,blur,exposure,noise"
					};

					var baseimg = data1;
					var sourceImageUrl = baseimg;
					// 					            document.querySelector("#sourceImage").src = sourceImageUrl;

					function mkblob(dataURL) {
						var BASE64_MARKER = ';base64,';
						if (dataURL.indexOf(BASE64_MARKER) == -1) {
							var parts = dataURL.split(',');
							var contentType = parts[0].split(':')[1];
							var raw = decodeURIComponent(parts[1]);
							return new Blob([ raw ], {
								type : contentType
							});
						}
						var parts = dataURL.split(BASE64_MARKER);
						var contentType = parts[0].split(':')[1];
						var raw = window.atob(parts[1]);
						var rawLength = raw.length;

						var uInt8Array = new Uint8Array(rawLength);

						for (var i = 0; i < rawLength; ++i) {
							uInt8Array[i] = raw.charCodeAt(i);
						}

						// return new Blob(uInt8Array, { type: contentType });
						return uInt8Array;
					}

					// alert(mkblob(baseimg));
					// console.log($.param(params));

					$.ajax({
							url : "https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect?"
									+ $.param(params),
							beforeSend : function(xhrObj) {
								// Request headers
								xhrObj.setRequestHeader("Content-Type","application/octet-stream");
								xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","71d36159ce92459f8b72ffa1184ad667");
							},
							type : "POST",
							// Request body
							data : mkblob(baseimg),
							processData : false,
							success : function(resp) {
								if(resp!=""){
								
								fac1 = resp[0].faceId;
								var facId = {"faceId" : fac1};

								$.ajax({
											url : "${pageContext.request.contextPath}/createFaceId",
											type : "POST",
											data : facId,
											dataType : "text",
											success : function(resp) {
												if (resp == "success") {
													swal("FaceID 생성","FaceID 생성에 성공하였습니다", "success"); 
													location.href = '${pageContext.request.contextPath}/chooseMain';
												}else{
													swal("FaceID 생성 실패","FaceID 생성에 실패하였습니다. 정면을 보고 다시 촬영해주시기 바랍니다.", "error"); 
												}
											},
											error : function(
													errorResp) {
												console.log(errorResp.status);
											}
										});

											}else{
												swal("FaceID 생성 실패","FaceID 생성에 실패하였습니다. 정면을 보고 다시 촬영해주시기 바랍니다.", "error"); 
											}
										}
									}).done(function(data) {
								// alert("success");
							}).fail(function() {
								alert("error");
							});
				});

	});
	
});
</script>
<style type="text/css">
		body {
			font-family: Helvetica, sans-serif;
		}
		
		h2, h3 {
			margin-top: 0;
		}
		
		form {
			margin-top: 15px;
		}
		
		form>input {
			margin-right: 15px;
		}
		
		#my_camera{
			float: left;
			
		}
		#results {
			float: inherit;
		/* 	margin: 20px; */
		/* 	padding: 20px; */
		/* 	border: 1px solid; */
		/* 	background: #ccc; */
		}
</style>

<div class="modal fade" id="faceModal" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
              <h3>출석 확인을 위한 FaceId 생성 페이지입니다.</h3>
            </div>
            <div class="modal-body">
            <h4>카메라정면을 바라보고 FaceId생성 버튼을 눌러주세요.</h4>
			<div id="my_camera" style="float:left; margin-right:50px "></div>
			<div id="results"></div>
			<!-- Configure a few settings and attach camera -->
			<script language="JavaScript">
				Webcam.set({
					// live preview size
					width : 320,
					height : 240,

					// device capture size
					dest_width : 320,
					dest_height : 240,

					// final cropped size
					crop_width : 240,
					crop_height : 240,

					// format and quality
					image_format : 'jpeg',
					jpeg_quality : 90
				});

				Webcam.attach('#my_camera');
			</script>
                
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="createFaceid">faceId생성</button>
            </div>
        </div>
    </div>
</div>


<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>
