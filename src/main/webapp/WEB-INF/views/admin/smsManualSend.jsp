<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Data Table JS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
<!-- normalize CSS
		============================================ -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/normalize.css">
<style>
	tr { height: 20px !important; } 
	
	.table-responsive {
		display: inline;
	}
	
	#sendUserList {
		float : right;
		width: 100%;
		height: 500px;
		overflow-y: scroll;
	}
	#data-table-basic{
		overflow: auto;
	}
	.sms_div1 {
		width:300px;
		height:300px;
		margin:auto;
		display: block;
		background: url('${pageContext.request.contextPath }/res/images/phone_bg4.png') repeat-x 0 0 transparent;
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
	
	#btnBox {
		height: 800px;
		text-align: center;
	}
	#selectListBox {
		height: 800px;
	}
	#tableBox {
		height: 800px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		var table = $('#data-table-basic').DataTable({
			ajax: {
				"type" : "get",
				"url" : "${pageContext.request.contextPath}/sms/menualSend",
				"dataType" : 'JSON'
			},
			columns : [
				{data : "checkbox"} ,
				{data : "user_id"} ,
				{data : "user_name"} ,
				{data : "user_hp"} ,
				{data : "lower_organization"} ,
				{data : "button"} 
			]
		});
		
		$('#checkAll').on('click', function(){
			$('.checkbox').prop('checked', this.checked);
		});
		
		var table = $('#data-table-basic').DataTable();
		$('#data-table-basic tbody').on( 'click','.btn', function() {
			var tr = $(this).parents('tr');
			var name = table.row(tr).data().user_name;
			var id = table.row(tr).data().user_id;
			var hp = table.row(tr).data().user_hp;
			
			var values = $("#sendUserList>option").map(function() { return $(this).val(); });
			console.log(values);
			v

// 			console.log(tr);
// 		    console.log( table.row(tr).data().user_name );
		    $('#sendUserList').append("<option value='"+id+"'>"+name+"|"+hp+"</option>");
// 		    $(this).attr('onclick', '').unbind('click');
		    $(this).unbind('click');
		});
		
		$('#nextBtn').on('click', function() {
			$("input[name=smsCheck]:checked").each(function() { 
				var tr = $(this).parents('tr');
				var name = table.row(tr).data().user_name;
				var id = table.row(tr).data().user_id;
				var hp = table.row(tr).data().user_hp;
				$('#sendUserList').append("<option value='"+id+"'>"+name+"|"+hp+"</option>");
			});
		});

	})	
	
	function smsSelectReset() {
		$('#sendUserList').empty();
	};
	
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
            chkword(obj, 4000);
        }
        
        $("#ByteTxt").text(totalByte);
    }
</script>

<div class="data-table-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12" id="smsCont">
				<div class="data-table-list">
					<div class="col-md-8">
						<div class="basic-tb-hd">
							<h2>SMS발송</h2>
						</div>
						<div class="table-responsive" id="tableBox">
							<table id="data-table-basic" class="table table-striped dataTable table-hover"
								role="grid" aria-describedby="data-table-basic_info">
								<thead>
									<tr>
										<th><input type="checkbox" id="checkAll" /></th>
										<th>아이디</th>
										<th>이름</th>
										<th>번호</th>
										<th>학과</th>
										<th>비고</th>
									</tr>
								</thead>
								<tbody id="dataBody">
								</tbody>
							</table>
						</div>
						</div>
						<div class="col-md-1" id="btnBox">
							<div class="BtnTBlack20">
								<button type="button" id="nextBtn">
									<span style="font-size:15px;font-weight:bold;padding:5px 0 5px 3px">▶</span>
								</button>
							</div>
						</div>
						<div class="col-md-3" id="selectListBox">
							<div style="background-color:#ebebeb;">
								<p class="float_l" style="margin:10px 0 0 10px;">선택&nbsp;학생(<span id="SelectTotalCnt" class="fontred fs_14"></span>)명</p>
								<div>
									<button type="button" onclick="smsSelectReset();"><span>초기화</span></button>
								</div>
							</div>
							<select name="sendUserList" id="sendUserList" multiple="multiple" >
							</select>
						</div>
					</div>
					<div class="col-md-6">
						<div class="sms_div1">
							<ul>
								<li><textarea id="Reg_Msg" name="Reg_Msg" class="smstextarea" onkeyup="checkByte(this, 80)" cols="16" rows="6" border="1"></textarea></li>
							</ul>
							<ul>
								<li><p class="float_l ml_10 mt_5"><span id="ByteTxt" class="fontred">0</span> / <span id="maxByteTxt" style="color:#fff">80Byte</span></p><p></p></li>
							</ul>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>


<script src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
