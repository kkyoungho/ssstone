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
   
<!-- HEADER -->
<header class="py-13 jarallax" data-jarallax data-speed=".8"
   style="background-image: url(/resources/img/covers/cover-31.jpg);">
   <div class="container" style="font-family: 'Do Hyeon', sans-serif;">
      <div class="row">
         <div class="col-12">

            <!-- Heading -->
            <h3 class="text-center text-white">남녀노소 모두가 원하는 악세사리!!! 지금 득템하세요~~!!♥</h3>

            <!-- Breadcrumb -->
            <ol
               class="breadcrumb justify-content-center mb-0 text-center text-white font-size-xs">
               <li class="breadcrumb-item"><a class="text-reset" href="#">Home</a>
               </li>
               <li class="breadcrumb-item active"><a class="text-reset"
                  href="../product/shop">Tool kits</a></li>
            </ol>

         </div>
      </div>
   </div>
</header>

<!-- FILTERS -->
<section class="py-7 border-bottom" style="font-family: 'Do Hyeon', sans-serif;">
   <div class="container">
      <div class="row align-items-center">
         <div class="col-12 col-md">

            <!-- Categories -->
            <nav class="nav nav-overflow mb-6 mb-md-0">
               <a class="nav-link active" data-toggle="tab" href="/product/shop" onclick="self.location='/product/shop'">All</a> 
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=귀걸이&p_category2=" 
               onclick="self.location='/product/shop?p_category1=귀걸이&p_category2='">귀걸이</a>
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=목걸이&p_category2=" 
               onclick="self.location='/product/shop?p_category1=목걸이&p_category2='">목걸이</a>
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=팔찌&p_category2=" 
               onclick="self.location='/product/shop?p_category1=팔찌&p_category2='">팔찌</a>
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=시계&p_category2=" 
               onclick="self.location='/product/shop?p_category1=시계&p_category2='">시계</a>
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=반지&p_category2=" 
               onclick="self.location='/product/shop?p_category1=반지&p_category2='">반지</a>
               <a class="nav-link" data-toggle="tab" href="/product/shop?p_category1=헤어&p_category2=" 
               onclick="self.location='/product/shop?p_category1=헤어&p_category2='">헤어용품</a>
               <a class="nav-link" data-toggle="tab" href="/shop/comingsoon"
                  title="준비중" onclick="self.location='/shop/comingsoon'">Commingsoon</a>
            </nav>

         </div>
         <div class="col-12 col-md-auto text-center"></div>
      </div>
   </div>
</section>

<!-- 상품 페이지 -->
<section class="py-12" style="font-family: 'Do Hyeon', sans-serif;">
   <div class="container">
      <div class="row">
       <c:set var="i" value="0" />
          <c:set var="j" value="4" />
          <ul style="padding:0px 1px 0px 1px;">
           <c:choose>
           <c:when test="${productList != null && fn:length(productList) > 0 }">
         <c:forEach items="${productList }" var="product">
          <c:if test="${i%j==0 }">
            <li style="display:flex;">
          </c:if>
            <div class="col-12 col-md-3 col-lg" style="justify-content:space-between">
               <!-- Card -->
               <div class="move card mb-7" data-toggle="card-collapse" href='<c:out value="${product.p_no }"/>' >
                  <!-- Image -->
                  <div style="width: 250px;"> 	
	                  <a href="product.html" class="card-img-top" > <img
	                     src='/display?fileName=<c:out value="${product.p_filepath }"/>/<c:out value="${product.p_uuid }"/>_<c:out value="${product.p_filename }"/>' 
	                     alt="..."
	                     width="250px" height="250px" href='<c:out value="${member.m_no }"/>'>
	                  </a>
	                  <!-- Collapse -->
	                  <div class="card-collapse-parent">
	                     <!-- Body -->
	                     <div class="card-body px-0 bg-white text-center">
	                        <!-- Heading -->
	                        <div class="mb-1 font-weight-bold">
	                           <a class="text-body" href='<c:out value="${member.m_no }"/>'> <c:out value="${product.p_name }"/> </a>
	                        </div>
	                        <!-- Price -->
	                        <div class="mb-1 font-weight-bold text-muted"><fmt:formatNumber value="${product.p_price }" pattern="#,###" />원</div>
	                     </div>
	                  </div>
	               </div>
               </div>
            </div>
            <c:if test="${i%j==j-1 }">
               </li>
            </c:if>
            <c:set var="i" value="${i+1 }"/>
            
         </c:forEach>
         
      </c:when>
      </c:choose>
      </ul>
      </div>
      <!-- 상품 끝 -->
      <!-- 검색 처리 시작 -->
      <div class="row" style="display: ">
         <div class="col-lg-12">
            <form action="/product/shop" id="searchForm" method="get">
               <select name='type'>
                  <option value=""
                     <c:out value="${pageMaker.cri.type == null?'selected':'' }" />>--</option>
                  <option value="T"
                     <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}" />>카테고리</option>
                  <option value="C"
                     <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}" />>재질</option>
                  <option value="N"
                     <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}" />>이름</option>
                  <option value="">--</option>
                  <option value="TC"
                     <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}" />>카테고리
                     or 재질</option>
                  <option value="TCN"
                     <c:out value="${pageMaker.cri.type eq 'TCN'?'selected':''}" />>전체 검색</option>
               </select> <input type='text' name='keyword'
                  value='<c:out value="${pageMaker.cri.keyword }" />' /> <input
                  type='hidden' name='pageNum'
                  value='<c:out value="${pageMaker.productcriteria.pageNum}"/>' /> <input
                  type='hidden' name='amount'
                  value='<c:out value="${pageMaker.productcriteria.amount}" />' />
               <button type="button" class="btn btn-outline-info">검색</button>
            </form>
         </div>
      </div>
      <!-- 검색 처리 끝 -->

      <!--  end Pagination -->
      <!-- 페이징 처리 -->
      <div class="row">
         <div class="col-12">

            <!-- Progress -->
            <div class="row justify-content-center mt-7">
               <div class="col-12 text-center">

                  <!-- Pagination -->
                  <nav class="d-flex justify-content-center mt-9">
                     <ul class="pagination pagination-sm text-gray-400">
                        <c:if test="${pageMaker.prev }">   <!-- 이전 -->
                           <li class="page-item">
                              <a class="page-link page-link-arrow"
                              href="${pageMaker.startPage -1 }"><i class="fa fa-caret-left"></a></li>
                        </c:if>
                        <c:forEach var="num" begin="${pageMaker.startPage }"
                           end="${pageMaker.endPage }">
                           
                           <li class="page-item  ${pageMaker.cri.pageNum == num ? "active" : ""} "><a
                              class="page-link page-link-arrow" href="${num }">${num }</a></li>
                        </c:forEach>
                        <c:if test="${pageMaker.next }"><!-- 다음 -->
                           <li class="page-item">
                           <a
                              class="page-link page-link-arrow"
                              href="${pageMaker.endPage +1 }"><i class="fa fa-caret-right"></i></a></li>
                        </c:if>
                     </ul>
                  </nav>
               </div>
            </div>
         </div>
      </div>
      <!-- 페이징 처리 끝 -->

      <form action="/product/shop" id='actionForm' method='get'>
         <input type='hidden' name='pageNum'
            value='${pageMaker.productcriteria.pageNum }'> <input
            type='hidden' name='amount'
            value='${pageMaker.productcriteria.amount }'>
         <!-- 검색후 검색조건과 키워드 유지 -->
         <input type='hidden' name='type'
            value='<c:out value="${pageMaker.cri.type }" />'> <input
            type='hidden' name='keyword'
            value='<c:out value="${pageMaker.cri.keyword }" />'>
      </form>
   </div>
</section>



<script>
   $(document).ready(function() {
      var result = '<c:out value="${result}"/>';
      history.replaceState({}, null, null);
      
      var actionForm = $("#actionForm");
      
      $(".page-item a").on("click",function(e) {
         e.preventDefault();
         console.log('click');
         actionForm.find("input[name='pageNum']")
               .val($(this).attr("href"));
         actionForm.submit();
      });
      
      var searchForm = $("#searchForm");
      $("#searchForm button").on("click",   function(e) {
         if (!searchForm.find("option:selected").val()) {alert("검색종류를 선택하세요");
            return false;
         }
         if (!searchForm.find("input[name='keyword']").val()) {
            alert("키워드를 입력하세요");
            return false;
         }
         searchForm.find("input[name='pageNum']").val("1");
         e.preventDefault();
         searchForm.submit();
      });
      
      $(".move").on("click",function(e) {
         e.preventDefault();
         actionForm.append("<input type='hidden' name='p_no' value='"+ $(this).attr("href")+ "'>");
         actionForm.attr("action","/product/product");
         actionForm.submit();
      });
   });
</script>
<%@ include file="../includes/footer.jsp"%>'