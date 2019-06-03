<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 2.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
*
* 관리자 증명서관리 화면
 --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>증명서관리 화면</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(function() {

	});
</script>
</head>
<body>
	<div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="breadcomb-wp">
									<div class="breadcomb-ctn">
										<h2>증명서관리</h2>
										<p>
											증명서를 조회하고 관리하는 게시판입니다. <span class="bread-ntd"></span>
										</p>
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

						<table id="data-table-basic" class="table table-striped dataTable"
							role="grid" aria-describedby="data-table-basic_info">
							<thead>

							</thead>
							<tbody>
								<tr role="row" class="odd">
									<td colspan="3">증명서선택</td>
								</tr>
								<tr role="row" class="even">
									<td colspan="3">여러가지 증명서를 한번에 신청할 수 없습니다. 한개씩 신청해 주세요.</td>
								</tr>
								<tr role="row" class="even">
									<th>증명서</th>
									<th>통수</th>
									<th>신청</th>
								</tr>
								<tr role="row" class="odd">
									<td>성적증명서</td>
									<td><input type="number" value="0"></td>
									<td><button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn1">신청</button>
										<button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn2">미리보기</button></td>
								</tr>
								<tr role="row" class="even">
									<td>졸업예정증명서</td>
									<td><input type="number" value="0"></td>
									<td><button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn3">신청</button>
										<button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn4">미리보기</button></td>
								</tr>
								<tr role="row" class="odd">
									<td>학년수료 증명서</td>
									<td><input type="number" value="0"></td>
									<td><button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn5">신청</button>
										<button class="btn btn-default notika-btn-default"
											style="float: left;" id="btn6">미리보기</button></td>
								</tr>
							</tbody>
							<tfoot>

							</tfoot>
						</table>
						<div class="container">
							<div class="row">
								<textarea rows="5" cols="100">
									결제내역은 카카오페이에서 확인 가능합니다.
									무통장입금/계좌이체는 불가합니다.
									결제 명의자는 꼭 본인이 아니어도 결제가 가능합니다.
								</textarea>
							</div>
						</div>
						<button class="btn btn-default notika-btn-default" id="bbb">결제</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>