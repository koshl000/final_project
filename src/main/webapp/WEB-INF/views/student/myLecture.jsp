<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function newTab(a){
		window.open("lecture_code_1/eduGoal", "상세강의보기", "width=1000, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=yes");
	}
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
                              <h2>나의강의</h2>
                              <p>나의강의 조회 페이지<span class="bread-ntd"></span></p>
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
                            <div id="data-table-basic_filter" class="dataTables_filter sangyup">
                            <span>Search:</span>
                            <input type="search" placeholder="" aria-controls="data-table-basic" />
                            <span>학년<select><OPTION>2019년</OPTION><OPTION>2018년</OPTION><OPTION>2017년</OPTION></select></span>
                            <span>학기<select><option>1학기</option><option>2학기</option></select></span>
                            <button class="btn btn-default notika-btn-default" id="asd">조회하기</button>
                            </div><table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 20%;">과목명</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 20%;">이수구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 20%;">학점</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 20%;">수강인원</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" style="width: 20%;">강의계획서</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${lectures}" var="lecture">
                                    <tr role="row" class="odd">
                                        <td class="sorting_1"><a target="_blank" href=${pageContext.request.contextPath}/subjectPage/${lecture.lecture_code}/eduGoal>${lecture.lecture_name}</a></td>
                                        <td>${lecture.lecture_coursetype}</td>
                                        <td>${lecture.lecture_credit}</td>
                                        <td>${lecture.lecture_current}/${lecture.lecture_credit}</td>
                                        <td><button class="btn btn-default notika-btn-default">보기</button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
	<script
		src="${pageContext.request.contextPath }/notika/js/data-table/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/notika/js/data-table/data-table-act.js"></script>