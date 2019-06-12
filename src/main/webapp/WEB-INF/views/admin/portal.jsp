<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 포털관리(팝업공지) 화면
 --%>

<script type="text/javascript">
	$(function() {
		
	});
</script>
<style>
   .selectSpan {
      font-size: 16px;
      font-weight: bold;
      margin : 0 5px 0 20px;
   }
   #grade, #credit, #course {
      width: 60px;
   }
   
    .sangyup {
       display: inline;
        float:right;
    }
    .dataTables_wrapper .dataTables_filter {
       width: 45%;
   }
    .dataTables_wrapper .dataTables_filter input, .dataTables_wrapper .dataTables_filter label {
       width: 20%;
       
   }
</style>
	<div class="breadcomb-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="breadcomb-list">
                  <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="breadcomb-wp">
                           <div class="breadcomb-ctn">
                              <h2>포털관리</h2>
                              <p>팝업공지 관리 페이지 <span class="bread-ntd"></span></p>
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
                            <div id="data-table-basic_wrapper" class="dataTables_wrapper">
                            <div class="dataTables_length" id="data-table-basic_length">
                            <label>Show <select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
                             entries</label>
                            <div id="data-table-basic_filter" class="dataTables_filter sangyup">
                            <span>분류<select><OPTION>공지사항</OPTION><OPTION>과목</OPTION><OPTION>일반</OPTION></select></span>
                            <button class="btn btn-default notika-btn-default" id="asd1">등록</button>
                            <button class="btn btn-default notika-btn-default" id="asd2">수정</button>
                            <button class="btn btn-default notika-btn-default" id="asd3">삭제</button>
                            </div><table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">분류</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">글번호</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 100px;">제목</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 80px;">작성자</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="2" aria-label="Start date: activate to sort column ascending" style="width: 125px;" >표시기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr role="row" class="odd">
                                       <td class="sorting_1">공지글</td>
                                       <td>1</td>
                                       <td>글제목(20글자까지만)</td>
                                       <td>최희연</td>
                                       <td colspan="2">2019-05-11</td>
                                   </tr>
                                   <tr role="row" class="odd">
                                     <td class="sorting_1">2번글</td>
                                       <td>2</td>
                                       <td>글제목(20글자까지만)</td>
                                       <td>이진우</td>
                                       <td colspan="2">2019-05-11</td>
                                   </tr>
                                </tbody>
                            </table>
                            <div class="dataTables_info" id="data-table-basic_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div><div class="dataTables_paginate paging_simple_numbers" id="data-table-basic_paginate"><a class="paginate_button previous disabled" aria-controls="data-table-basic" data-dt-idx="0" tabindex="0" id="data-table-basic_previous">Previous</a><span><a class="paginate_button current" aria-controls="data-table-basic" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="4" tabindex="0">4</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="5" tabindex="0">5</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="6" tabindex="0">6</a></span><a class="paginate_button next" aria-controls="data-table-basic" data-dt-idx="7" tabindex="0" id="data-table-basic_next">Next</a></div></div>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
