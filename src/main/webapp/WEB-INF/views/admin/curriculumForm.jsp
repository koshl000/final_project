<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
   var date = new Date();
   var year = date.getFullYear();
   $(function(){
      $(".semester").find('option').remove();
      $(".semester").append("<option value='"+year+"년 1학기"+"'>"+year+"년 1학기"+"</option>")
                 .append("<option value='"+year+"년 2학기"+"'>"+year+"년 2학기"+"</option>");
      $(".academicYear").find('option').remove();
      for (var idx = 1; idx < 5; idx++) {
         $(".academicYear").append("<option value='"+idx+"'>"+idx+"학년"+"</option>");
      }
      $(".courseType").find('option').remove();
      $(".courseType").append("<option value='"+"교양"+"'>"+"교양"+"</option>")
                  .append("<option value='"+"전공"+"'>"+"전공"+"</option>");
      
   })
</script>

<form>
   <div class="container">
      <div class="row">
         <div>
            <span>학기선택</span><select class="semester"></select>
            <span>대상학년</span><select class="academicYear"></select><br>
            <span>교과목명</span><input type="text"/>
            <span>이수구분</span><select class="courseType"></select><br>
            <span>학점</span><input type="number"/><br>
            <span>교과목 개요</span><textArea></textArea><br>
            <span>수업진행방법</span><textArea></textArea><br>
            <span>교재/참고자료</span><textArea></textArea><br>
            <button>목록</button><button>설정저장</button>
         </div>
      </div>
   </div>
</form>