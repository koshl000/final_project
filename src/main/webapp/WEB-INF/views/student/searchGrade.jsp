<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/res/js/jquery-3.3.1.min.js"></script> --%>
<!-- Data Table JS
		============================================ -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/notika/css/jquery.dataTables.min.css">
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
                              <h2>성적조회</h2>
                              <p>성적조회 페이지 <span class="bread-ntd"></span></p>
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
                		 <span>이름</span><span>이상엽</span>
                		 <span>학부</span><span>전산학부</span>
                		 <span>학과</span><span>콤퓨타</span>
                		 <span>학년</span><span>4학년</span>
                	</div>
                        <div class="table-responsive">
                            <div id="data-table-basic_wrapper" class="dataTables_wrapper">
                            <div class="dataTables_length" id="data-table-basic_length">
<!--                             <label>Show <select name="data-table-basic_length" aria-controls="data-table-basic" class=""> -->
<!--                             <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> -->
<!--                              entries</label> -->
                            <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">년도</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 100px;">학기구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 80px;">과목코드</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 80px;">이수구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">과목명</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 117px;">담당교수</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 80px;">숫자성적</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 80px;">영어성적</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">2019</td>
                                        <td>1학기</td>
                                        <td>BC001</td>
                                        <td>전공</td>
                                        <td>초급자바</td>
                                        <td>이상엽</td>
                                        <td>4.0</td>
                                        <td>A</td>
                                    </tr>
                                  	<tr role="row" class="even">
                                       <td class="sorting_1">2019</td>
                                        <td>2학기</td>
                                        <td>BC001</td>
                                        <td>교양</td>
                                        <td>초급자바</td>
                                        <td>이진우</td>
                                        <td>3.5</td>
                                        <td>B</td>
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
    
     <div class="normal-table-area" style="margin-top:30px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				    <div class="normal-table-list">
					    <div class="bsc-tbl">
					        <table class="table table-sc-ex">
					            <thead>
					                <tr>
					                    <th>년도</th>
					                    <th>학기구분</th>
					                    <th>이수학점</th>
					                    <th>전체학점</th>
					                    <th>이전학기성적</th>
					                    <th>전체평균</th>
					                </tr>
					            </thead>
					            <tbody>
					                <tr>
					                    <td>2019</td>
					                    <td>2학기</td>
					                    <td>15</td>
					                    <td>15</td>
					                    <td>4.2</td>
					                    <td>4.27</td>
					                </tr>
					            </tbody>
					        </table>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- jquery
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/vendor/jquery-1.12.4.min.js"></script>
	<!-- Data Table JS
		============================================ -->
    <script src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>
