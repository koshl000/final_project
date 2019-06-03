<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 증명서관리 화면
 --%>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<script type="text/javascript">
	$(function() {
		$('#data-table-basic').DataTable({
	        ajax: {
	            "type" : "get",
	               "url" : "${pageContext.request.contextPath}/certificateAdminList",
	                  "dataType": "JSON"
	               },
	              columns: [
	                         { data: "user_authority" },
	                         { data: "user_id" },
	                         { data: "user_name"},
	                         { data: "certificate_name"},
	                         { data: "issue_count" },
	                         { data: "issue_totalprice" },
	                         { data: "issue_date" }
	                        
	                     ]
	          });
		
	});
</script>
<div class="breadcomb-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="breadcomb-list">
                  <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="breadcomb-wp">
                           <div class="breadcomb-ctn">
                              <h2>증명서관리</h2>
                              <p>발급된 증명서내역을 조회합니다. <span class="bread-ntd"></span></p>
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
                       <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr>
									<th>구분</th>
									<th>아이디</th>
									<th>성명</th>
									<th>증명서</th>
									<th>발급통수</th>
									<th>총결제금액</th>
									<th>발급날짜</th>
								</tr>
                                </thead>
                                <tbody>
                               
                                </tbody>
                                <tfoot>
                           			
                                </tfoot>
                            </table>
                            </div>
                            </div>
                            </div>
                            </div>
     

