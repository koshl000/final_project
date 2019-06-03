<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 강의운영관리(수강신청관리) 화면
 --%>

<script type="text/javascript">
	$(function() {
		
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
                              <h2>수강신청관리</h2>
                              <p>수강신청내역을 조회하고 관리하는 게시판입니다. <span class="bread-ntd"></span></p>
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
                            <label><select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
                             	건씩 정렬</label>
                            <div id="data-table-basic_filter" class="dataTables_filter sangyup">
                           
                             <span>검색<select><OPTION>학기선택</OPTION><OPTION>1학기</OPTION><OPTION>2학기</OPTION></select></span>
                            
                            
                            <input type="search" placeholder="" aria-controls="data-table-basic" />
                            <button class="btn btn-default notika-btn-default">검색</button>
                             <button class="btn btn-default notika-btn-default">전체조회</button>
                            
                            </div>
                            <div>     
                               		  <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn1" >엑셀다운로드</button>
                            </div>
                            <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 189px;">교과목명</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">담당교수</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">이수구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">학점</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">신청인원</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">개설상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">초급자바</td>
                                        <td>이영만</td>
                                        <td>교양</td>
                                        <td>2</td>
                                        <td>4</td>
                                        <td>대기</td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">궁극자바</td>
                                        <td>이상엽</td>
                                        <td>전공</td>
                                        <td>3</td>
                                        <td>0</td>
                                        <td>대기</td>
                                    </tr>
                                      <tr role="row" class="odd">
                                        <td class="sorting_1">궁극자바</td>
                                        <td>이상엽</td>
                                        <td>전공</td>
                                        <td>3</td>
                                        <td>43</td>
                                        <td>개설</td>
                                    </tbody>
                                <tfoot>
                                    
                                </tfoot>
                            </table><div class="dataTables_info" id="data-table-basic_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div><div class="dataTables_paginate paging_simple_numbers" id="data-table-basic_paginate"><a class="paginate_button previous disabled" aria-controls="data-table-basic" data-dt-idx="0" tabindex="0" id="data-table-basic_previous">Previous</a><span><a class="paginate_button current" aria-controls="data-table-basic" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="4" tabindex="0">4</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="5" tabindex="0">5</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="6" tabindex="0">6</a></span><a class="paginate_button next" aria-controls="data-table-basic" data-dt-idx="7" tabindex="0" id="data-table-basic_next">Next</a></div></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

