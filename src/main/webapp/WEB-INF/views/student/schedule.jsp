<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                              <h2>알림목록</h2>
                              <p> <span class="bread-ntd"></span></p>
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
                        <div class="table-responsive">
                            <div id="data-table-basic_wrapper" class="dataTables_wrapper">
                            <div class="dataTables_length" id="data-table-basic_length">
                            <label>Show <select name="data-table-basic_length" aria-controls="data-table-basic" class="">
                            <option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select>
                             entries</label>
                           <table id="data-table-basic" class="table table-striped dataTable" role="grid" aria-describedby="data-table-basic_info">
                                <thead>
                                    <tr role="row">
                                    <th class="sorting_asc" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 80px;">알림구분</th>
                                    <th class="sorting" tabindex="0" aria-controls="data-table-basic" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 100px;">알림내용</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <tr role="row" class="odd">
                                        <td class="sorting_1">공지사항</td>
                                        <td>새글이 등록되었습니다</td>
                                    </tr>
                                  	<tr role="row" class="even">
                                       <td class="sorting_1">게시판</td>
                                        <td>1새글이 등록되었습니다</td>
                                    </tr>
                                    </tbody>
                            </table>
                            <div class="dataTables_info" id="data-table-basic_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div><div class="dataTables_paginate paging_simple_numbers" id="data-table-basic_paginate"><a class="paginate_button previous disabled" aria-controls="data-table-basic" data-dt-idx="0" tabindex="0" id="data-table-basic_previous">Previous</a><span><a class="paginate_button current" aria-controls="data-table-basic" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="4" tabindex="0">4</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="5" tabindex="0">5</a><a class="paginate_button " aria-controls="data-table-basic" data-dt-idx="6" tabindex="0">6</a></span><a class="paginate_button next" aria-controls="data-table-basic" data-dt-idx="7" tabindex="0" id="data-table-basic_next">Next</a></div></div>
			               
<!-- 			                <div class="bsc-tbl"> -->
<!-- 			                   <table class="table table-sc-ex"> -->
<!-- 			                       <thead> -->
<!-- 			                           <tr> -->
<!-- 			                               <th>#</th> -->
<!-- 			                               <th>First Name</th> -->
<!-- 			                               <th>Last Name</th> -->
<!-- 			                               <th>Username</th> -->
<!-- 			                               <th>Nickname</th> -->
<!-- 			                           </tr> -->
<!-- 			                       </thead> -->
<!-- 			                       <tbody> -->
<!-- 			                           <tr> -->
<!-- 			                               <td>1</td> -->
<!-- 			                               <td>Alexandra</td> -->
<!-- 			                               <td>Christopher</td> -->
<!-- 			                               <td>@makinton</td> -->
<!-- 			                               <td>Ducky</td> -->
<!-- 			                           </tr> -->
<!-- 			                       </tbody> -->
<!-- 			                   </table> -->
<!-- 			               </div> -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    
