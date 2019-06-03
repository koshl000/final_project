<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 12.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*관리자 강의운영관리(수강신청관리view) 화면
 --%>
<script type="text/javascript">
	$(function(){
		$('.name').click(function() {
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

			  $('.modal-dialog').draggable({
			    handle: ".modal-header"
			  });

			});
		
	});
	</script>

	<div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                        
                       <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td colspan="2">학기 (기간)</td>
                                        <td colspan="2">2019년 1학기</td>
                                        <td colspan="2">교과목명</td>
                                        <td colspan="2">대학생활과 자기이해</td>
                                    </tr><tr role="row" class="even">
                                        <td colspan="2">담당교수</td>
                                        <td colspan="2">이진우, 최희연</td>
                                        <td colspan="2">이수구분</td>
                                        <td colspan="2">교양선택</td>
                                    </tr><tr role="row" class="odd">
                                        <td>학점</td>
                                        <td>2</td>
                                        <td>인원제한</td>
                                        <td>50</td>
                                        <td>수강인원</td>
                                        <td>4</td>
                                        <td>학습주차</td>
                                        <td>16</td>
                                        <td>학점</td>
                                    </tr><tr role="row" class="even">
                                    <td colspan="2">수강기간</td>
                                    <td colspan="4">2015년 02월 20일 ~ 2015년(6월 21일(총 16주차))</td>
                                       </tr>
                                       <tr>
                                        <td colspan="2">수강신청기간</td>
                                    <td colspan="4">2015년 01월 12일 ~ 2015년 3월 02일</td>
                                       </tr>
                                        <tr role="row" class="odd">
                                          <td colspan="2">수강정정기간</td>
                                    <td colspan="4">2015년 01월 12일 ~ 2015년 3월 02일</td>
                                    </tr>
                                   
                                   </tbody>
                                <tfoot>
                                
                                </tfoot>
                            </table>
                            
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
                             <br/> 
                            
                                            
        <div class="data-table-area">
         <div class="container">
         <div class="row">
         <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn3" >수강생등록</button>
         <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn2" >엑셀 다운로드</button>
          </div>
        </div>
        </div>
         <br/>     
       <div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                         <div id="data-table-basic_filter" class="dataTables_filter sangyup">
                           
                             <span>검색<select><OPTION>전체</OPTION><OPTION>소속</OPTION><OPTION>이름</OPTION></select></span>
                        
                        </div>
                       <table id="data-table-basic2" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 189px;">번호</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">소속</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">이름(ID)</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">신청일</th>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td>2</td>
                                        <td>비즈니스 중국어</td>
                                        <td class="name">강경근(201081070)</td>
                                        <td>2019-05-05</td>
                                    </tr><tr role="row" class="even">
                                        <td>1</td>
                                        <td>중국 비즈니스</td>
                                        <td class="name">강경근(201081070)</td>
                                        <td>2019-05-05</td>
                                    </tr>
                                   </tbody>
                                <tfoot>
                                <tr>
                                
                                <td colspan="2">
                               		 
                               		</td>
                                <td>
                               		 <button class="btn btn-default notika-btn-default" style="float:left;"  id="btn1" >목록</button>
                               		 
                               		</td>
                               		
                                </tr>
                                
                                </tfoot>
                            </table>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
	<div id="myModal" class="modal modelss" >
	<div class="modal-dialog modal-large">
		<div class="modal-content">
			<div class="modal-header">
			</div>
			<div class="modal-body" >
                    <div class="data-table-list">
                        
                       <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td rowspan="3" >이미지</td>
                                        <td>이름</td>
                                        <td>이상엽</td>
                                        <td>상태</td>
                                        <td>재학</td>
                                    </tr><tr role="row" class="even">
                                        <td colspan="2">소속</td>
                                        <td colspan="2">전산학부(컴퓨터공학과)</td>
                                    </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
   				 </div>
			</div>
			<div class="modal-footer">
			   <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>

			</div>
		</div>
	</div>
