<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/normalize.css">
<link rel="stylesheet"href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">
<style>
tr {
	height: 20px !important;
}

.table-responsive {
	display: inline;
}

#sendUserList {
	float: right;
	width: 100%;
	height: 500px;
	overflow-y: scroll;
}

#data-table-basic {
	overflow: auto;
	font-size: 12px !important;
}

.sms_div1 {
	width: 300px;
	height: 300px;
	margin: auto;
	display: block;
	background:
		url('${pageContext.request.contextPath }/res/images/phone_bg4.png')
		repeat-x 0 0 transparent;
	text-align: center;
}

.smstextarea {
	width: 280px;
	height: 230px;
	background-color: transparent;
	border: 0px solid;
	margin-top: 35px;
	overflow-y: auto;
	word-break: break-all;
}

.fontred {
	font-weight: bold;
	color: #ed5f00 !important;
}

#smsCont {
	background: #fff;
}


.comment {
	color: #959595;
	font-size: 12px !important;
}
.qwerTable {
	font-size: 12px !important;
    table-layout: fixed;
    border-top: 2px solid #7b7b7b;
    border-bottom: 2px solid #7b7b7b;
    border-collapse: collapse;
}
.qwerTable tr td {
	with:800px;
	padding: 13px 13px 13px 13px;
    text-align: left;7
    border-bottom: 1px #ebebeb solid;
}
.qwerTable tr th {
    padding: 13px 0 13px 13px;
    text-align: left;
    border-bottom: 1px solid #cecece;
    background: #ebebeb;
    font-size: 12px;
    font-weight: bold;
}
.list_Toolbar {
    margin-bottom: 10px;
    overflow: hidden;
}
.mt_20 {
    margin-top: 20px !important;
}
.align_c {
    text-align: center !important;
}
input:focus {
	border: 1px solid #00c292;
}
.form-control input:focus {
	border: 1px solid #00c292;
	outline-color:  #00c292;
}
#data_1 {
	display:none;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#SendType2").on('click', function() {
			$("#data_1").show();
		});
		$("#SendType").on('click', function() {
			$("#data_1").hide();
		});
		
		$('.smsSendSubmit').on('click', function() {
			var jsonData = {};
			var msg = $('.sms_div1').find('textarea').val();
			var no = "${sendlist[0].smsgroup_no}";
			var msgType = $("input[name=SendType]:checked").val();
			var msgGroupName = $("input[name=smsgroup_name]").val();
			var msgDate = null;
			if(msgType=="0") {
				msgType="즉시발송";
				msgDate = getTimeStamp();
				msgDate = msgDate.replace(/-/gi,"");
				msgDate = msgDate.replace(/\:/gi,"");
				msgDate = msgDate.replace(" ","");
			} else {
				msgType="예약발송";
				msgDate = $("input[name=SendDate]").val();
				var sendDateMin = $("#sendDateMin option:selected").val();
				var sendDateSec = $("#sendDateSec option:selected").val();
				msgDate+=sendDateMin;
				msgDate+=(sendDateSec+"00");
				msgDate = msgDate.replace(/\//gi,"");
			}
			
			jsonData['msgDate']=msgDate;
			jsonData['msg']=msg;
			jsonData['no']=no;
			jsonData['msgGroupName']=msgGroupName;
			jsonData['msgType']=msgType;
			console.log(jsonData);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/sms/smsSendSubmit",
				method : "post",
				data : JSON.stringify(jsonData),
				contentType : "application/json; charset=UTF-8",
				dataType : "text", // request header(Accept), response header(Content-Type),
				success : function(resp) {
					console.log(resp);
					window.location = 'smsGroupList';
				},
				error : function(errorResp) {
					console.log(errorResp.status);
					window.location = 'smsGroupList';
				}
			});

		})
	});

	//문자내용 입력 글자 검사
	function checkByte(obj, maxByte) {
		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}
			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}
		//넘어가는 글자는 자른다.
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
		}

		$("#ByteTxt").text(totalByte);
	}
	
	function formLocation() {
        window.location = "smsGroupForm";
    }
	function listLocation() {
        window.location = "smsGroupList";
    }
	function sendLocation() {
        window.location = "smsGroupSend";
    }
	
	function getTimeStamp() {
		var d = new Date();
		var s =
		  leadingZeros(d.getFullYear(), 4) + '-' +
		  leadingZeros(d.getMonth() + 1, 2) + '-' +
		  leadingZeros(d.getDate(), 2) + ' ' +
		
		  leadingZeros(d.getHours(), 2) + ':' +
		  leadingZeros(d.getMinutes(), 2) + ':' +
		  leadingZeros(d.getSeconds(), 2);
		
		return s;
	}
	
	function leadingZeros(n, digits) {
		var zero = '';
		n = n.toString();
		
		if (n.length < digits) {
		  for (i = 0; i < digits - n.length; i++)
		    zero += '0';
		}
		return zero + n;
	}
	
</script>
<div class="main">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="data-table-list">
					<div class="basic-tb-hd sgSend">
						<h2>SMS 그룹발송</h2>
					</div>
					<div class="table-responsive">
						<div class="smsGroupSendBox">
							<form method="post" id="smsWriteForm">
								<table class="qwerTable">
										<tr>
											<th><img src="${pageContext.request.contextPath }/res/images/icon_title01.png">발송&nbsp;번호</th>
											<td width="*.*" colspan="3" class="inputTd">
												<input type="text" name="smsgroup_hp" class="form-control inputGroupName" value="010-9940-9824" disabled="disabled"/>
											</td>
										</tr>
										<tr>
											<th><img src="${pageContext.request.contextPath }/res/images/icon_title01.png">발송&nbsp;그룹</th>
											<td width="*.*" colspan="3" class="inputTd">
											<c:set var="sList" value="${sendlist}" />
											<c:choose>
												<c:when test="${not empty sList}">
													<input type="text" name="smsgroup_name" class="form-control inputGroupName" value="${sList[0].smsgroup_name}" disabled="disabled"/>
												</c:when>
												<c:otherwise>
													<input type="text" name="smsgroup_name" class="form-control inputGroupName" disabled="disabled"/>
												</c:otherwise>
											</c:choose>
											</td>
										</tr>
										<tr>
											<th><img src="${pageContext.request.contextPath }/res/images/icon_title01.png">SMS&nbsp;내용</th>
											<td width="*.*" colspan="3" class="inputTd">
												<div class="sms_div1">
													<ul>
														<li><textarea id="Reg_Msg" name="Reg_Msg"
																class="smstextarea" onkeyup="checkByte(this, 80)"
																cols="16" rows="6" border="1" placeholder="::보낼 SMS내용을 입력해주세요 ::"></textarea></li>
													</ul>
													<ul>
														<li style="margin-top: 5px;"><p
																class="float_l ml_10 mt_5">
																<span id="ByteTxt" class="fontred">0</span> / <span id="maxByteTxt" style="color: #fff">80Byte</span>
															</p>
															<p></p></li>
													</ul>
												</div>
												<div>
													<input type="radio" id="SendType" name="SendType" value="0" checked="checked" > 즉시&nbsp;발송&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" id="SendType2" name="SendType" value="1" > 예약&nbsp;발송
													<div class="form-group nk-datapk-ctm form-elet-mg" id="data_1">
					                                    <div class="input-group date nk-int-st">
					                                        <span class="input-group-addon"></span>
					                                        <input type="text" class="form-control" name="SendDate" id="date_reserve" value="2019/05/31">
					                                        <select id="sendDateMin" name="sendDateMin">
																<option value="">시</option><option value="00">00</option><option value="01">01</option>
																<option value="02">02</option><option value="03">03</option><option value="04">04</option>
																<option value="05">05</option><option value="06">06</option><option value="07">07</option>
																<option value="08">08</option><option value="09">09</option><option value="10">10</option>
																<option value="11">11</option><option value="12">12</option><option value="13">13</option>
																<option value="14">14</option><option value="15">15</option><option value="16">16</option>
																<option value="17">17</option><option value="18">18</option><option value="19">19</option>
																<option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
															</select>시
															<select id="sendDateSec" name="sendDateSec">
																<option value="">분</option> <option value="00">00</option> <option value="05">05</option>
																<option value="10">10</option> <option value="15">15</option> <option value="20">20</option>
																<option value="25">25</option> <option value="30">30</option> <option value="35">35</option>
																<option value="40">40</option> <option value="45">45</option> <option value="50">50</option> <option value="55">55</option>
															</select>분
					                                    </div>
					                                </div>
												</div>
											</td>
										</tr>
								</table>
								<div class="list_Toolbar mt_20 align_c">
									<span class="BtnRed30 align_c">
										<button type="button" class="btn btn-default notika-btn-default waves-effect smsGroupList" onclick="listLocation()">목록보기</button>
										<button type="button" class="btn btn-success notika-btn-success waves-effect smsSendSubmit" >SMS발송</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/datapicker/datepicker-active.js"></script>

