<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<%@ include file="../includes/header.jsp"%>
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
   rel="stylesheet">


<!-- BREADCRUMB -->
<nav class="py-5" style="font-family: 'Do Hyeon', sans-serif;">
   <div class="container">
      <div class="row">
         <div class="col-12">

            <!-- Breadcrumb -->
            <ol class="breadcrumb mb-0 font-size-xs text-gray-400">
               <li class="breadcrumb-item"><a class="text-gray-400"
                  href="index.html">Home</a></li>
               <li class="breadcrumb-item active">장바구니</li>
            </ol>

         </div>
      </div>
   </div>
</nav>

<!-- CONTENT -->
<section class="pt-7 pb-12" style="margin-left:8%; font-family: 'Do Hyeon', sans-serif;">
   <div class="container">
      <div class="row">
         <div class="col-12 text-center">

            <!-- Heading -->
            <h3 class="mb-10">장바구니</h3>

         </div>
      </div>
      <div class="row">
         
         <div class="col-auto col-md-col-auto col-lg-10 offset-lg-1">

            <!-- Order -->
            <div class="row">
               <div class="col-12">

                     <!-- Info -->
                     <div class="row">
                        <div class="allCheck" style="text-align:center">
                           <input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">전체선택 / </label>
                        </div>
                        <div class="delBtn">
                            <button class="selectDelete_btn" type="button">선택삭제</button>
                        </div>
                        <!-- 상품 선택영역 -->
                        
                        <!-- 상품 테이블 시작 -->
                        <div class="col-12">
                              <br>
                                
                              <table style="width:100%; text-align:center;" class="table">

                                 <thead class="thead-dark">
                                  <tr>
                                    <th>상품 선택</th>
                                    <th>상품 이미지</th>
                                    <th>상품 정보</th>
                                    <th>상품 금액</th>
                                    <th>상품 수량</th>
                                    <th>배송비</th>
                                  </tr>
                                 </thead>

                                 <tbody style="border-bottom:1px solid #dcdcda;" id="pc_list">
                                 	
                                 </tbody>
                              </table>
                                 
                              
                              <div class="col-12" id= "priceResult">
                                 <%-- <div class="form-group" style="font-size:25px; text-align:center;">
                                    총 주문 상품 : <fmt:formatNumber pattern="###,###,###" value="${sum }"/>원 +
                                    총 배송비 : 2500원 =
                                    총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum + 2500 }"/>원
                                 </div> --%>
                             </div>
                        </div>
                        <hr>
                     </div>
                     <br />
                  <!-- 1개 끝 -->
               </div>
            </div>
            <div class="card-footer">
               <div class="row align-items-center">
                  <div class="col-12" style="width:100%">
                     <div class="form-row" style="text-align:center">
                        <div class="col-6">
                           <!-- Button -->
                           <a class="btn btn-sm btn-block btn-outline-dark"
                              href="/product/shop"> 계속 쇼핑 하기 </a>
                        </div>
                        <div class="col-6">
                           <!-- Button -->
                           <button id="payment" class="btn btn-sm btn-block btn-outline-dark" > 주문 하기 </button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
	<form action="/payment/checkout" id='actionForm' method='get'>
		<input type = hidden name=m_no value='<sec:authentication property="principal.member.m_no"/>'>
	</form>
</section>

<script type="text/javascript" src="/resources/js/ajax.js"></script>
<script>
/* 모두 선택 */

$(document).ready(function() {
	var actionForm = $("#actionForm");
	var pc_list = $("#pc_list");
	var priceResult = $("#priceResult");
	<sec:authorize access="isAuthenticated()">
		m_no1 = '<sec:authentication property="principal.member.m_no"/>';
	</sec:authorize>
	showList(m_no1);
	function showList(m_no1) { cartservice.getshoppingcart(
		{m_no : m_no1},function(cart) {
			console.log(cart);
			var str = "";
			if (cart == null
					|| cart.length == 0) {
				pc_list.html("");
				return;
			}
			var sum = 0;
			for (var i = 0, len = cart.length || 0; i < len; i++) 
			{
				var eachsumPrice = cart[i].p_price * cart[i].s_amount;
				sum += eachsumPrice;
				var center = 8 * cart.length;
				str+= "<tr>"
	               	+ "<th class='checkBox'>"
	               	+ "<input type='checkbox' name='chBox' class='chBox' data-cartNum="+ cart[i].s_no +" style='height:65px; />"
	           	 	+ "</th>"
	           	 	
	              	+ "<th style='width:70px'>"
	               	+ "<a href='#' data-fancybox> <img" 
	                + " src='/display?fileName=" + cart[i].p_filepath + "/" + cart[i].p_uuid + "_" + cart[i].p_filename + "'"
	                + "alt='...' class='card-img-top' style='width:50px;'>"
	                + "</a>"
	           		+ "</th>"
	           		
	           		+ "<th style='line-height:70px'>"
	          		+ cart[i].p_name
	          		+ "</th>"
	          		
	          		+ "<th style='line-height:70px'>"
	          		+ eachsumPrice  + "원"
	          		+ "</th>"
	          		
	          		+ "<th style='line-height:70px'>"
	     			+ cart[i].s_amount + "개"
	         		+  "</th>"
	         		
	          		+ "<th style='line-height:70px'>"
	              	+ "무료"
					+ "<div class='col-6 col-rg-3' style='margin-left:80%;'>"
					+"<div class='delete'>"
					+ "<a type='button' class='delete_btn' data-cartNum='"+ cart[i].s_no +"'><i class='fe fe-x'></i></a>"
					+ "</div>" 
					+ "</div>"
	             	+ "</th>";
	             	if(i==0)
             		{
             			str += "<th style = 'line-height:"+center+"; ' rowspan='"+ cart.length + "'>2500원";
             			str += "</th>";
             		}
	          		str += "</tr>"
					+ "}"; 
			}
			pc_list.html(str);
		});
	}
	$("#allCheck").click(function(){
	   var chk = $("#allCheck").prop("checked");
	   
	   if(chk) {
	      $(".chBox").prop("checked", true);
	   } else {
	      $(".chBox").prop("checked", false);
	   }
	});
	
	/* 모두 선택 체크를 하면 개별박스에도 체크가됨 */
	$(".chBox").click(function(){
	   $("#allCheck").prop("checked", false);
	});
	
	
	/* 삭제 */
	/* 체크박스 */
	$(".selectDelete_btn").click(function(){
	   var confirm_val = confirm("선택한 품목을 삭제하시겠습니까?");
	   var csrfHeaderName = "${_csrf.headerName}";
	   var csrfTokenValue = "${_csrf.token}";
	
	   if(confirm_val) {
	      var checkArr = new Array();
	      
	      $("input[class='chBox']:checked").each(function(){
	         checkArr.push($(this).attr("data-cartNum"));
	      });
	      for(var i = 0 ; i<checkArr.length; i++)
	   	  {
		      $.ajax({
		         url : "/payment/deleteCart",
		         type : "post",
		         data : {s_no : checkArr[i]},
		         beforeSend:function(xhr){
		        	 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		         },
		         success : function(result){
		        	 showList(m_no1);
		         }
		      });
	   	  }
	   }
	});
	/* 한개 지우기 */
	$("#pc_list").on("click",".delete_btn", function(){
		var confirm_val = confirm("상품을 삭제 하시겠습니까?");
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	
		if(confirm_val){
			var checkArr = new Array();
			checkArr.push($(this).attr("data-cartNum"));
			alert($(this).attr("data-cartNum"));
			$.ajax({
				url : "/payment/deleteCart",
				type : "post",
				beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				data : { s_no : checkArr[0]},
				success : function(result){
					showList(m_no1);
				}
			});
		}
	});
	$("#payment").on("click", function(e){
		actionForm.submit();
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>