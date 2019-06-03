<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 11.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
* 관리자 기초정보 등록화면
 --%>

   <div class="data-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="data-table-list">
                       
                        <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 189px;">구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 150px;"></th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 150px;"></th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 52px;"></th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 150px;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">학기입력</td>
                                        <td><label><select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            			<option value="2019">2019</option><option value="2018">2018</option></select></label>년</td>
                                        <td>년도</td>
                                        <td><input type="text"></td>
                                        <td>학기</td>
                                      
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">학기기간</td>
									<td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_1">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_2">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                       
                                    </tr><tr role="row" class="odd">
                                        <td class="sorting_1">수강신청기간</td>
                                       <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_3">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_4">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">수강정정기간</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_5">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_6">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="odd">
                                        <td class="sorting_1">성적등록기간</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_7">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_8">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">강의평가기간</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_9">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_10">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="odd">
                                        <td class="sorting_1">성적열람기간</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_11">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_12">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">성적이의기간</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_13">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_14">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="odd">
                                        <td class="sorting_1">성적정정기간</td>
                                       <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_15">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_16">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr><tr role="row" class="even">
                                        <td class="sorting_1">수강기간</td>
                                       <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_17">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
									<td>~</td>
                                        <td><div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
											<div class="form-group nk-datapk-ctm form-elet-mg"
												id="data_18">
												<div class="input-group date nk-int-st">
													<span class="input-group-addon"></span> <input type="text"
														class="form-control" value="03/19/2018">
												</div>
											</div>
										</div></td>
                                    </tr></tbody>
                               		<tfoot>
                               		<tr>
                               		<td colspan="3">
                               		  <button class="btn btn-default notika-btn-default" style="float:left;"  id="btn1" >목록</button>
                               		 
                               		</td>
                               		<td>
                               		 <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn2" >수정</button>
                               		  <button class="btn btn-default notika-btn-default" style="float:right;"  id="btn3" >취소</button>
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
	



<script src="${pageContext.request.contextPath }/notika/js/datapicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath }/notika/js/datapicker/datepicker-active.js"></script>
