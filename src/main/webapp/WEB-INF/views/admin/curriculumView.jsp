<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 12.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
* 교육과정관리 - 관리자(과목관리 교과목명 클릭)
 --%>
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
                                        <td>학기선택</td>
                                        <td><select><OPTION>1학기</OPTION><OPTION>2학기</OPTION></td>
                                        <td></td>
                                        <td>대상학년</td>
                                        <td><select><OPTION>1학년</OPTION><OPTION>2학년</OPTION><OPTION>3학년</OPTION><OPTION>4학년</OPTION></td>
                                    </tr><tr role="row" class="even">
                                        <td>교과목명</td>
                                        <td>대학생활과 자기이해</td>
                                        <td></td>
                                        <td>이수구분</td>
                                        <td><select><OPTION>전공</OPTION><OPTION>교양</OPTION></td>
                                    </tr><tr role="row" class="odd">
                                        <td>학점</td>
                                        <td colspan="3">2</td>
                                    </tr><tr role="row" class="even">
                                        <td rowspan="2">교과목 개요</td>
                                        <td colspan="3"><textarea rows="5" cols="100"></textarea></td>
                                       </tr>
                                       <tr>
                                       </tr>
                                        <tr role="row" class="odd">
                                        <td rowspan="2">수업진행방법</td>
                                        <td colspan="3"><textarea rows="5" cols="100"></textarea></td>
                                       
                                    </tr>
                                    <tr></tr>
                                    <tr role="row" class="even">
                                       <td rowspan="2">교재, 참고자료</td>
                                        <td colspan="3"><textarea rows="5" cols="100"></textarea></td>
                                    </tr>
                                   </tbody>
                                <tfoot>
                                <tr>
                                <td colspan="4">
                               		 <button class="btn btn-default notika-btn-default" style="float:left;"  id="btn1" >목록</button>
                               		</td>
                               		<td>
                               		<button class="btn btn-default notika-btn-default" style="float:right;"  id="btn2" >설정저장</button>
                               		</td>
                               		<td>
                               		 <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn3" >교과목명 삭제</button>
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


