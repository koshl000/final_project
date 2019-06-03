<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/res/js/jquery-3.3.1.min.js"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 12.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
* 포탈관리(팝업공지 등록)(관리자)
 --%>

<style>
.sangyup {
	display: inline;
	float: right;
}

.dataTables_wrapper .dataTables_filter {
	width: 45%;
}

.dataTables_wrapper .dataTables_filter input, .dataTables_wrapper .dataTables_filter label
	{
	width: 20%;
}
</style>
<div class="summernote-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="view-mail-list sm-res-mg-t-30">
					<div class="cmp-int mg-t-20">
						<div class="row">
							<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
								<div class="cmp-int-lb cmp-int-lb1 text-right">
									<span>게시판선택 </span>
								</div>
							</div>
							<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
								<div class="form-group">
									<div class="nk-int-st cmp-int-in cmp-email-over">
										<select name="data-table-basic_length"
											aria-controls="data-table-basic" class="">
											<option value="">일반</option>
											<option value="">공지</option>
											<option value="">과목</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-1 col-md-2 col-sm-2 col-xs-12">
								<div class="cmp-int-lb cmp-int-lb1 text-right">
									<span>제목 : </span>
								</div>
							</div>
							<div class="col-lg-11 col-md-10 col-sm-10 col-xs-12">
								<div class="form-group">
									<div class="nk-int-st cmp-int-in cmp-email-over">
										<input type="title" class="form-control"
											placeholder="게시글 제목을 입력하세요">
									</div>
								</div>

							</div>
							<p>
								<b>팝업위치:</b><input type="text">
							</p>
							<p>
								<b>URL:</b><input type="text">
							</p>
						</div>
						<div class="multiupload-sys">
							<div id="dropzone" class="dropmail">
								<form action="/upload"
									class="dropzone dropzone-custom needsclick dz-clickable"
									id="demo-upload">
									<div class="dz-message needsclick download-custom">
										<i class="notika-icon notika-cloud" aria-hidden="true"></i>
										<h2>업로드할 파일을 올려주세요.</h2>
										<!--                                     <p><span class="note needsclick">(This is just a demo dropzone. Selected files are <strong>not</strong> actually uploaded.)</span> -->
										</p>
									</div>
								</form>
							</div>
						</div>
						<div class="cmp-int-box mg-t-20">
							<div class="html-editor-cm" style="display: none;"></div>
							<div class="note-editor panel panel-default">
								<div class="note-dialog">
									<div class="note-image-dialog modal" aria-hidden="false">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" aria-hidden="true"
														tabindex="-1">×</button>
													<h4 class="modal-title">Insert Image</h4>
												</div>
												<div class="modal-body">
													<div class="form-group row note-group-select-from-files">
														<label>Select from files</label><input
															class="note-image-input form-control" type="file"
															name="files" accept="image/*" multiple="multiple">
													</div>
													<div class="form-group row">
														<label>Image URL</label><input
															class="note-image-url form-control col-md-12" type="text">
													</div>
												</div>
												<div class="modal-footer">
													<button href="#"
														class="btn btn-primary note-image-btn disabled waves-effect"
														disabled="">Insert Image</button>
												</div>
											</div>
										</div>
									</div>
									<div class="note-link-dialog modal" aria-hidden="false">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" aria-hidden="true"
														tabindex="-1">×</button>
													<h4 class="modal-title">Insert Link</h4>
												</div>
												<div class="modal-body">
													<div class="form-group row">
														<label>Text to display</label>
														<div class="nk-int-st">
															<input class="note-link-text form-control" type="text">
														</div>
													</div>
													<div class="form-group row">
														<label>To what URL should this link go?</label>
														<div class="nk-int-st">
															<input class="note-link-url form-control col-md-12"
																type="text" value="http://">
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button href="#"
														class="btn btn-primary note-link-btn disabled waves-effect"
														disabled="">Insert Link</button>
												</div>
											</div>
										</div>
									</div>
									<div class="note-help-dialog modal" aria-hidden="false">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-body">
													<a class="modal-close pull-right" aria-hidden="true"
														tabindex="-1">Close</a>
													<div class="title">Keyboard shortcuts</div>
													<div class="note-shortcut-row row">
														<div
															class="note-shortcut note-shortcut-col col-sm-6 col-xs-12">
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-title col-xs-offset-6">Action</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Z</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Undo</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + Z</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Redo</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ ]</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Indent</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ [</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Outdent</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ ENTER</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Insert
																	Horizontal Rule</div>
															</div>
														</div>
														<div
															class="note-shortcut note-shortcut-col col-sm-6 col-xs-12">
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-title col-xs-offset-6">Text
																	formatting</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ B</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Bold</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ I</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Italic</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ U</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Underline</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ \</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Remove
																	Font Style</div>
															</div>
														</div>
													</div>
													<div class="note-shortcut-row row">
														<div
															class="note-shortcut note-shortcut-col col-sm-6 col-xs-12">
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-title col-xs-offset-6">Document
																	Style</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM0</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Normal</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM1</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	1</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM2</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	2</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM3</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	3</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM4</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	4</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM5</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	5</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ NUM6</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Header
																	6</div>
															</div>
														</div>
														<div
															class="note-shortcut note-shortcut-col col-sm-6 col-xs-12">
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-title col-xs-offset-6">Paragraph
																	formatting</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + L</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Align
																	left</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + E</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Align
																	center</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + R</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Align
																	right</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + J</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Justify
																	full</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + NUM7</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Ordered
																	list</div>
															</div>
															<div class="note-shortcut-row row">
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-key">Ctrl
																	+ Shift + NUM8</div>
																<div
																	class="note-shortcut-col col-xs-6 note-shortcut-name">Unordered
																	list</div>
															</div>
														</div>
													</div>
													<p class="text-center">
														<a href="//summernote.org/" target="_blank">Summernote
															0.6.16</a> · <a href="//github.com/summernote/summernote"
															target="_blank">Project</a> · <a
															href="//github.com/summernote/summernote/issues"
															target="_blank">Issues</a>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="note-dropzone">
									<div class="note-dropzone-message"></div>
								</div>
								<div class="note-toolbar panel-heading">
									<div class="note-style btn-group">
										<div class="btn-group" data-name="style">
											<button type="button"
												class="btn btn-default btn-sm dropdown-toggle waves-effect"
												data-toggle="dropdown" title="" tabindex="-1"
												data-original-title="Style">
												<i class="fa fa-magic"></i> <span class="caret"></span>
											</button>
											<ul class="dropdown-menu">
												<li><a data-event="formatBlock" href="#" data-value="p">Normal</a></li>
												<li><a data-event="formatBlock" href="#"
													data-value="blockquote"><blockquote>Quote</blockquote></a></li>
												<li><a data-event="formatBlock" href="#"
													data-value="pre">Code</a></li>
												<li><a data-event="formatBlock" href="#"
													data-value="h1"><h1>Header 1</h1></a></li>
												<li><a data-event="formatBlock" href="#"/>
												</li>
												</ul>
												</div>
												
												</div>
												</div>
												</div>
												</div>
												</div>
												</div>
												</div>
												</div>
												<button class="btn btn-default notika-btn-default" style="float:right" id="asd1">완료</button>
                     							<button class="btn btn-default notika-btn-default" style="float:right" id="asd2">목록</button>
												</div>
												
												</div>
												
												