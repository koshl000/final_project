<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/res/js/jquery-3.3.1.min.js"></script>
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2019. 5. 12.      AA      최초작성
* Copyright (c) 2019 by DDIT All right reserved
* 포탈관리(팝업공지 상세보기)(관리자)
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
                           <h2>포털관리</h2>
                           <p>포털관리 상세 페이지 <span class="bread-ntd"></span>
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
            <div class="view-mail-list sm-res-mg-t-30">
               <div class="view-mail-hd">
                  <!--                             <div class="view-mail-hrd"> -->
                  <!--                             </div> -->
                  <div class="view-ml-rl">
                     <select name="data-table-basic_length"
                        aria-controls="data-table-basic" class="">
                        <option value="">일반</option>
                        <option value="">공지</option>
                        <option value="">과목</option>
                     </select>
                     <button class="btn btn-default notika-btn-default" id="asd">수정</button>
                     <button class="btn btn-default notika-btn-default" id="asd">삭제</button>
                  </div>
               </div>
               <div class="mail-ads mail-vw-ph">
                  <p class="first-ph">
                     <b>분류 : </b>공지게시판
                  </p>
                  <p>
                     <b>제목:</b> <a href="#">부스트스랩개어렵다람쥐</a>
                  </p>
                  <p class="last-ph">
                     <b>Date:</b> 2019.05.11
                  </p>
                  <p>
                     <b>작성자:</b> <a href="#">누구야</a>
                  </p>
                  <button class="btn btn-default notika-btn-default" id="asd1">쪽지</button>
                  <button class="btn btn-default notika-btn-default" id="asd2">메일</button>
                  <button class="btn btn-default notika-btn-default" id="asd3">채팅</button>
                  <p>
                     <b>팝업위치:</b> 
                  </p>
                   <p>
                     <b>URL:</b> 
                  </p>
                  <p>
                     <b>이미지파일:</b><input type="file"> 
                  </p>
                  
               </div>
               <div class="file-download-system">
                  <div class="dw-st-ic mg-t-20">
                     <div class="dw-atc-sn">
                        <span><i class="notika-icon notika-paperclip"></i> 4
                           attachments <i class="notika-icon notika-arrow-right atc-sign"></i></span>
                     </div>
                     <div class="dw-atc-sn">
                        <a class="btn dw-al-ft waves-effect" href="#">Download all
                           in zip format <i class="notika-icon notika-file"></i>
                        </a>
                     </div>
                  </div>
               </div>
               <div class="view-mail-atn">
                  <h2>글내용이 들어갈 자리</h2>
                  <p>
                     글내용<a href="#">Read more</a>.
                  </p>
               </div>
               <div class="vw-ml-action-ls text-left mg-t-20">
                  <div class="btn-group ib-btn-gp active-hook nk-email-inbox">
                     <button class="btn btn-default btn-sm waves-effect">
                        <i class="notika-icon notika-right-arrow"></i> 조회수
                     </button>
                     <!--                                 <button class="btn btn-default btn-sm waves-effect"><i class="notika-icon notika-trash"></i> Remove</button> -->
                  </div>
               </div>

               
               <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <div class="form-element-list mg-t-30">
                        <div class="row">
                           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                              <div>
                                 <span onClick="location.href='boardList'">
                                    <img src="${pageContext.request.contextPath }/notika/images/sort_asc_disabled.png">
                                    <a href="#" style="margin-left: 3px;">이전글</a>
                                    <a href="#" style="margin-left: 40px;">이전글제목</a>
                                    <a style="margin-left: 300px;">이전글작성자</a>
                                    <a style="margin-left: 100px;">2019.05.10</a>
                                 </span>
                              </div>
                              <div>
                                 <span>
                                    <img src="${pageContext.request.contextPath }/notika/images/sort_desc_disabled.png">
                                    <a href="#" style="margin-left: 3px;">다음글</a>
                                    <a href="#" style="margin-left: 40px;">다음글제목</a>
                                    <a style="margin-left: 300px;">다음글작성자</a>
                                    <a style="margin-left: 100px;">2019.05.12</a>
                                 </span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               
            </div>
         </div>
      </div>
   </div>
</div>
