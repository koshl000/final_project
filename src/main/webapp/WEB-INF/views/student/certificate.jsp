<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 학생 증명서 신청화면
 --%>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">

<!-- dialog CSS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/sweetalert2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/dialog/dialog.css">

<script type="text/javascript">
	$(function() {
		$('#data-table-basic').DataTable({
	        ajax: {
	            "type" : "get",
	               "url" : "${pageContext.request.contextPath}/certificateList",
	                  "dataType": "JSON"
	               },
	              columns: [
	                         { data: "certificate_name" },
	                         { data: "inputNumber" },
	                         { data: "certificate_price"},
	                         { data: "sum"},
	                         { data: "btnApply" },
	                         { data: "btnView" }
	                        
	                     ]
	          });
		
		$table = $('#data-table-basic').DataTable();
		var datatable =  $('#data-table-basic').DataTable();
		$table.on('click', '.viewbtn', function () {
			var name = $(this).attr("name");
			window.open("${pageContext.request.contextPath }/"+name,"증명서 미리보기",'width=1000,height=700,toolbar=no, menubar=no,location=no,resizable=yes,status=no');
	    });
		
		$table.on('click', '.applybtn', function () {
			var code = $(this).attr("name");
			var cnt=$(this).parent().parent().find($(".numberinput")).val();
			var sum = $(this).parent().parent().find($(".suminput")).text();
			var na = $(this).parent().parent().find($(".sorting_1")).text();
			if(cnt==0){
				swal("증명서 신청", "신청하신 증명서가 없습니다.", "warning"); 
			}else{
				var myForm = document.popForm;
				$('#code').val(code);
				$('#name').val(na);
				$('#count').val(cnt);
				$('#sum').val(sum);
				
				$(".numberinput").val("0");
				var sum = $(this).parent().parent().find($(".suminput")).text("0");
				
				var url = '${pageContext.request.contextPath }/kakaoPay';    
			     	window.open("" ,"popForm",'width=450,height=600,toolbar=no, menubar=no,location=no,resizable=yes,status=no'); 
				    myForm.action =url;
				    myForm.method="post";
				    myForm.target="popForm";
				    myForm.submit();
				    
// 			window.open("${pageContext.request.contextPath }/kakaoPay","결제",'width=1000,height=700,toolbar=no, menubar=no,location=no,resizable=yes,status=no');
				
			}
			
	    });
		
		$table.on('keyup mouseup','.numberinput',function(){
			var cnt=$(this).val();
			var price = $(this).parent().next().text();
			var sum = $(this).parent().siblings().find($(".suminput")).text(cnt*price);
		});
		
	});
</script>

<form action="Gate" name="popForm" method="post">
   	<input type="hidden" id="code"  name="code" />  
    <input type="hidden" id ="name" name="name" />
    <input type="hidden" id="count" name="count" />
   	<input type="hidden" id="sum" name="sum" />  
</form>
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="breadcomb-wp">
									<div class="breadcomb-ctn">
										<h2>증명서신청</h2>
										<p>
											증명서를 신청하고 출력하실 수 있습니다. <span class="bread-ntd"></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="data-table-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="data-table-list">
						<table id="data-table-basic" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>
								<tr>
									<th>증명서</th>
									<th>통수</th>
									<th>가격(1통)</th>
									<th>합계</th>
									<th>신청</th>
									<th>미리보기</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
							<tfoot>

							</tfoot>
						</table>
						<div class="container">
							<div class="row">
								<textarea rows="4" cols="100">
									신청(결제)한 매수만큼만 출력 가능합니다.
						 			신청(결제)일 기준, 30일 내에만 취소/환불 가능합니다.
						 			본 서비스를 통해 출력한 증명서는 원본증명서 입니다.
								</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script	src="${pageContext.request.contextPath }/notika/js/dialog/sweetalert2.min.js"></script>