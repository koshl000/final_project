<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/res/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#assignmentSend')
	})
</script>
<style>
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

	<!--    메뉴 소개 영역 -->
    <div class="breadcomb-area">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
               <div class="breadcomb-list">
                  <div class="row">
                     <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="breadcomb-wp">
                           <div class="breadcomb-ctn">
                              <h2>과제물</h2>
                              <p>과제물페이지 <span class="bread-ntd"></span></p>
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
                    <div>
						<span>초급자바</span><span>이상엽</span>
					</div>
                        <div class="table-responsive">
                            <div id="data-table-basic_wrapper" class="dataTables_wrapper">
                            <div class="dataTables_length" id="data-table-basic_length">
                            <label>Show <select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
                             entries</label>
                            <div id="data-table-basic_filter" class="dataTables_filter sangyup">
                            <button class="btn btn-default notika-btn-default" id="asd">강의계획서보기</button>
                            </div><table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">회차</th>
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">주차</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 100px;">강의명</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 80px;">과제파일</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 80px;">등록일</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">마감일</th>
                                    </tr>
                                </thead>
                                <tbody>
	                                <tr role="row" class="odd">
	                                    <td class="sorting_1">1회차</td>
	                                    <td>1주차</td>
	                                    <td>강의명</td>
	                                    <td> <button class="btn btn-default notika-btn-default" id="assignmentSend">과제제출</button> <button class="btn btn-default notika-btn-default" id="resourceFileView">참고자료보기</button> <button class="btn btn-default notika-btn-default" id="assignmentView">과제보기</button></td>
	                                    <td>2019-05-11</td>
	                                    <td>2019-05-18</td>
	                                </tr>
	                                <tr role="row" class="odd">
	                               		<td class="sorting_1">1회차</td>
	                                    <td>1주차</td>
	                                    <td>강의명</td>
	                                    <td> <button class="btn btn-default notika-btn-default" id="bbb">과제제출</button> <button class="btn btn-default notika-btn-default" id="asd">참고자료보기</button> <button class="btn btn-default notika-btn-default" id="asd">과제보기</button></td>
	                                    <td>2019-05-11</td>
	                                    <td>2019-05-18</td>
	                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    
