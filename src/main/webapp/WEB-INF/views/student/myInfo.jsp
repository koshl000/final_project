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
* 로그인에 성공하면 나타나는 메인 페이지(학생, 교수)
 --%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지(학생, 교수)</title>

</head>
<body>
<%-- 	<form action="${pageContext.request.contextPath }/common/search"> --%>
<!-- 		<input type="text" name="keyword" /> -->
<!-- 		<input type="submit" id="search" value="검색" /> -->
<!-- 	</form> -->
	
<%-- 	<form id="chatForm" action="${pageContext.request.contextPath }/common/chatbot"> --%>
<%-- 		<img src="${pageContext.request.contextPath }/res/images/Jellyfish.jpg" id="chatbot" /> --%>
<!-- 	</form> -->

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
                              <h2>개인정보</h2>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
	<div class="line-chart-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="line-chart-wp chart-display-nn">
						<img src="" />
						<h4>학번</h4>
						<p>1901100511</p>
						<h4>학과</h4>
						<p>인공지능응용SW 과</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="line-chart-wp sm-res-mg-t-30 chart-display-nn">
						<h4>이름</h4>
						<p>정창훈</p>
						<h4>전번</h4>
						<p>01012345678</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="line-chart-wp mg-t-30 chart-display-nn">
						<h4>메일</h4>
						<p>qwae@naver.com</p>
						<h4>주소</h4>
						<p>대전 동구 우암로</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class="line-chart-wp mg-t-30 chart-mg-nt"></div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>