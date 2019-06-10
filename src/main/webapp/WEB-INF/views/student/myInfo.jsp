<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.wen {width:150px; height:150px; border-radius:150px; overflow:hidden; margin: 20px;}
	.wen img {height:auto; width:200px;}
	.studInfo { margin: 20px;}
	.head {font-weight: bold; margin-right: 20px;}
	.row {
		font-size: 20px;
	}
	.faceBox {
		margin: 16px 8px 0;
	    padding: 32px 29px 32px;
	    text-align: left;
	    border: 1px solid #dadada;
	    -webkit-border-radius: 2px;
	    border-radius: 2px;
	    background: #fff;
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
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="line-chart-wp chart-display-nn">
					<h4>개인 프로필</h4>
					<div class="row">
						<div class="col-md-3">
							<div class="wen">
								<img src="https://static.nid.naver.com/images/web/user/default.png" width="100" height="100" alt="">
							</div>
						</div>
						<div class="col-md-9">
							<table class="table table-bordered">
								<tr>
									<th>학번</th>
									<td>${alba.al_id } 1901100511</td>
								</tr>
								<tr>
									<th>학과</th>
									<td>${alba.al_id } 인공지능응용SW 과</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${alba.al_id } 정창훈</td>
								</tr>
								<tr>
									<th>전번</th>
									<td>${alba.al_id } 01012345678</td>
								</tr>
								<tr>
									<th>메일</th>
									<td>${alba.al_id } qwae@naver.com</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${alba.al_id } 대전 동구 우암로</td>
								</tr>
							</table>
<!-- 							<span class="head">학번</span><span>1901100511</span><br> -->
<!-- 							<span class="head">학과</span><span>인공지능응용SW 과</span><br> -->
<!-- 							<span class="head">이름</span><span>정창훈</span><br> -->
<!-- 							<span class="head">전번</span><span>01012345678</span><br> -->
<!-- 							<span class="head">메일</span><span>qwae@naver.com</span><br> -->
<!-- 							<span class="head">주소</span><span>대전 동구 우암로</span><br> -->
						</div>
						<div class="col-md-9 faceBox">
							faceId수정
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>