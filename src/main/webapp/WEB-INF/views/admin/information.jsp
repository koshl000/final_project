<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 기초정보관리 화면
 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/datapicker/datepicker3.css">
<script type="text/javascript">
	$(function(){
		$('#btn1').click(function() {
			  // reset modal if it isn't visible
			  if (!($('.modal.in').length)) {
			    $('.modal-dialog').css({
			      top: 0,
			      left: 0
			    });
			  }
			  $('#myModal').modal({
			    backdrop: false,
			    show: true
			  });

// 			  $('.modal-dialog').draggable({
// 			    handle: ".modal-header"
// 			  });

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
                              <h2>기초정보관리</h2>
                              <p>학년, 학기별로 각종 기간을 설정하는 게시판입니다. <span class="bread-ntd"></span></p>
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
                        <div class="table-responsive">
                        <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn1" >등록</button>
                        
                            <div id="data-table-basic_wrapper" class="dataTables_wrapper">
                            <div class="dataTables_length" id="data-table-basic_length">
                            <label>Show <select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
                             entries</label>
                           <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 150px;">연도/학기</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 150px;">학기기간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 150px;">수강신청기간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 150px;">수강정정기간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 150px;">성적열람기간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 150px;">성적이의기간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 150px;">성적정정기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">2019년도 1학기</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">2019년도 2학기</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                                        <td>2019-05-05~2019-10-10</td>
                            </table><div class="dataTables_info" id="data-table-basic_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div><div class="dataTables_paginate paging_simple_numbers" id="data-table-basic_paginate"><a class="paginate_button previous disabled" aria-controls="data-table-basic" data-dt-idx="0" tabindex="0" id="data-table-basic_previous">Previous</a><span><a class="paginate_button current" aria-controls="data-table-basic" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="4" tabindex="0">4</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="5" tabindex="0">5</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="6" tabindex="0">6</a></span><a class="paginate_button next" aria-controls="data-table-basic" data-dt-idx="7" tabindex="0" id="data-table-basic_next">Next</a></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/datapicker/datepicker-active.js"></script>
