<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 강의운영관리(수강관리View) 화면
 --%>
<script type="text/javascript">
	$(function() {
		
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
                                        <td colspan="3">학점</td>
                                        <td>2</td>
                                        <td colspan="2">수강인원</td>
                                        <td>4</td>
                                    </tr>
                                   </tbody>
                                <tfoot>
                           
                                </tfoot>
                            </table>
                            
                            <button class="btn btn-default notika-btn-default" style="float:left;"  id="btn2" >학습정보조회</button>
                            <button class="btn btn-default notika-btn-default" style="float:left;"  id="btn3" >학습참여도조회</button>
                            <br/>
                            <br/>
                            
                            <div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                       <table id="data-table-basic2" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 189px;">소속</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">이름</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">ID</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 125px;">과제</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">퀴즈</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">중간</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 125px;">기말</th>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td>전산학부(컴퓨터공학)</td>
                                        <td>201081070</td>
                                        <td>이상엽</td>
                                        <td>6/10</td>
                                        <td>15/15</td>
                                        <td>1</td>
                                        <td>-</td>
                                    </tr>
                                   </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                            
                            <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn4" >메일발송</button>
                            <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn5" >쪽지발송</button>
                            <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn6" >SMS 발송</button>
                            
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
</div>
