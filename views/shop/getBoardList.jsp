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

<!-- BREADCRUMB -->
<nav class="py-5">
	<div class="container">
		<div class="row">
			<div class="col-12">

				<!-- Breadcrumb -->
				<ol class="breadcrumb mb-0 font-size-xs text-gray-400">
					<li class="breadcrumb-item"><a class="text-gray-400"
						href="index.html">Home</a></li>
					<li class="breadcrumb-item active">게시판</li>
				</ol>

			</div>
		</div>
	</div>
</nav>

<section class="col-12">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Heading -->
				<h3 class="mb-7 text-center">게시판</h3>
				<hr>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="form-group" style="float: right">
							<label style="color:grey;">작성일</label><strong>
							<fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate}" /></strong>
						</div>
						<div class="form-group">
							<label style="color:grey;">작성자</label> <strong> <c:out value="${board.m_email }"/></strong>
						</div>
						

						<div class="form-group">
							<label></label> <textarea  class="form-control" name="b_content" style=" min-height: 500px; font-size: 3em; background-color : black; color:white;"
								 readonly="readonly"><c:out value="${board.b_title }"/></textarea>
								<hr>
						</div>

							<sec:authorize access="isAuthenticated()">
								<sec:authentication property="principal.member.m_no" var = "pinfo"/>
								<c:if test="${pinfo eq board.m_no }">
									<button data-oper='modify' class="btn btn btn-outline-dark btn-underline mb-1"
										onclick="location.href='/shop/modifyBoardList?b_no=<c:out value="${board.b_no }" />'">수정하기</button>
								</c:if>
							</sec:authorize>
						<button data-oper='list' class="btn btn-info"
							onclick="location.href='/shop/boardList'">목록으로</button>

						<form id='operForm' action="/shop/modifyBoardList" method="get">
							<input type='hidden' id='b_no' name='b_no'
								value='<c:out value="${board.b_no}"/>'> <input
								type='hidden' name='pageNum'
								value='<c:out value="${cri.pageNum}" />'> <input
								type='hidden' name='amount'
								value='<c:out value="${cri.amount}" />'> <input
								type='hidden' name='keyword'
								value='<c:out value="${cri.keyword}" />'> <input
								type='hidden' name='type' value='<c:out value="${cri.type}" />'>
						</form>

					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">

				<!-- /.panel -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<sec:authorize access="isAuthenticated()">
						<i class="fa fa-comments fa-fw fa-2x"></i> 
						<input
							class="col-md-9 " name="r_content" type="text"
							placeholder="내용을 입력하세요">
						<input type ='hidden'name='r_order' value='0'>
						<input type='hidden' name='r_depth' value='0'>
						<button id='replyRegisterBtn' class='btn btn btn-outline-dark btn-underline mb-1 btn-xs pull-right'>댓글달기</button>
						<input class="col-md-1" type="hidden" name="m_no" value='<sec:authentication property="principal.member.m_no"/>' readonly="readonly">
						</sec:authorize>
					</div>
					<hr>
					<!-- /.panel-heading -->
					<div class="panel-body">

						<ul class="chat" style="list-style: none;">
							<!-- start reply -->
							<li class="left clearfix" data-r_no='27'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong> <strong
											class="primary-font">user00</strong> <small
											class="pull-right text-muted">2020-04-22 19:12</small>
									</div>
									<p>Good job!</p>
								</div>

							</li>
							<!-- end reply -->
						</ul>
						<!-- ./ end ul -->
					</div>
					<!-- /.panel .chat-panel -->

					<div class="panel-footer"></div>
				</div>
			</div>
			<!-- ./ end row -->
		</div>
		<!--  모달 시작 -->
		<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModal">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>댓글</label> <input class="form-control" name='r_content'
								value='새로운 댓글!'>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='m_email'
								value='작성자'>
						</div>
						<div class="form-group">
							<label>회원번호</label> <input class="form-control" name="m_no"
								value='회원번호'>
						</div>
						<div class="form-group">
							<label>작성일</label> <input class="form-control" name='r_regdate'
								value='작성일'>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
						<button id='modalRegisterBtn' type="button"
							class="btn btn-primary">생성</button>
						<button id='modalCloseBtn' type='button' class='btn btn-default'
							data-dismiss='modal'>닫기</button>
					</div>
				</div> -->
				<!--  /.modal-content -->
			<!-- </div> -->
			<!--  /.modal-dialog -->
		<!-- </div> -->
		<!--  모달 끝 -->

	</div>
</section>
<script type="text/javascript" src="/resources/js/ajax.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm");
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	$(document).ajaxSend(function(e,xhr,options){
		xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	});

	$("button[data-oper='modify']").on("click",function(e) {
		operForm.attr("action","/shop/modifyBoardList").submit();
	});
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#b_no").remove();
		operForm.attr("action", "/shop/boardList")
		operForm.submit();
	});
	var b_noValue = '<c:out value="${board.b_no}"/>';
	var replyUL = $(".chat");
	showList(1);
	<sec:authorize access="isAuthenticated()">
		user_no = '<sec:authentication property="principal.member.m_no"/>';
	</sec:authorize>
	
	function showList(page) {replyService.getList(
		{
			b_no : b_noValue,
			page : page || 1
		},function(replyCnt, list) {
			console.log("replyCnt: "+ replyCnt);
			console.log("list: " + list);
			console.log(list);
			if (page == -1) {
				pageNum = Math
						.ceil(replyCnt / 10.0);
				showList(pageNum);
				return;
			}
			var str = "";
			if (list == null
					|| list.length == 0) {
				replyUL.html("");
				return;
			}
			for (var i = 0, len = list.length || 0; i < len; i++) {
				str += "<li class='left clearfix' >";
				if(list[i].r_depth != 0 )//대댓글일때
				{
					str += "<i class='fe fe-corner-down-right'> </i>";
					str += " <div style='margin-left:5%; background-color=gray;' > <div class='header'><strong class='primary-font'>"
					+ "작성자 : "
					+ list[i].m_email
					+ "</strong>"
					+ "&nbsp;";
			str += " <small class='pull-right text-muted'>"
					+ replyService
							.displayTime(list[i].r_regdate)
					+ "</small></div>";
					str += " <p>" + "내용 : "
					+ list[i].r_content;
					<sec:authorize access="isAuthenticated()">
					if(user_no == list[i].m_no )
					{
						str += "<span data-r_no='"+list[i].r_no+"'><small id ='modify' class='text-muted' > 수정</small></span>";
					
					}
					</sec:authorize>
					str += "</p></div><div id='modifyreply' ></div><hr></li>";
				}
				else		//댓글일때
				{
					str += " <div > <div class='header'><strong class='primary-font'>"
					+ "작성자 : "
					+ list[i].m_email
					+ "</strong>"
					+ "&nbsp;";
					/* <sec:authorize access="isAuthenticated()"> */
					str += "<i data-r_no='"+list[i].r_no+"' data-r_depth='"+list[i].r_depth +"' class='rereply fa fa-plus'><small>답글 달기</small></i>";
					/* </sec:authorize> */
			str += " <small class='pull-right text-muted'>"
					+ replyService
							.displayTime(list[i].r_regdate)
					+ "</small></div>";
					str += " <p>" + "내용 : "
					+ list[i].r_content;
					<sec:authorize access="isAuthenticated()">
					if(user_no == list[i].m_no )
					{
					str += "<span data-r_no='"+list[i].r_no+"'><small id ='modify' class='text-muted' > 수정</small></span>";
					}
					</sec:authorize>
					
					str += "</p></div><div id='modifyreply' ></div><hr></li>";
				}
						
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
		}); //end function
	} // end showList

	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		var prev = startNum != 1;
		var next = false;
		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt / 10.0);
		}
		if (endNum * 10 < replyCnt) {
			next = true;
		}
		var str = "<ul class='pagination pull-right'>";
		if (prev) {
			str += "<li class='page-item'><a class='page-link' href='"
					+ (startNum - 1)
					+ "'>Previous</a></li>";
		}
		
		
		for (var i = startNum; i <= endNum; i++) {
			var active = pageNum == i ? "active" : "";
			str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
					+ i + "</a></li>";
		}
		if (next) {
			str += "<li class='page-item'><a class='page-link' href='"
					+ (endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		console.log(str);
		replyPageFooter.html(str);
	}
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum: " + targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
	});
	// -- 여기까지가 댓글 페이지의 화면 처리 --

	
	//댓글 시작
	var R_content = $("input[name='r_content']");
	var M_no = $("input[name='m_no']");
	var replyModifyBtn = $("#replyModifyBtn");
	var RemoveBtn = $("#RemoveBtn");
	var RegisterBtn = $("#RegisterBtn");
	$("#replyRegisterBtn").on("click", function(e) { //등록하기 버튼 누르면
		var r_order = $(this).parent().children("input[name='r_order']").val();
		var r_depth = $(this).parent().children("input[name='r_depth']").val();
		var reply = {
			r_content : R_content.val(),
			r_order : r_order,
			r_depth : r_depth,
			m_no : user_no,
			b_no : b_noValue
		};
		replyService.add(reply, function(result) {
			R_content.val("");
			//   showList(1);
			showList(-1);
		});
	});
	$(".chat").on("click","span",function(e) {				//수정 버튼 누르면
		
		e.preventDefault();
		r_no = $(this).data("r_no");
		var modifyInput = $(this).parent().parent().parent().children("#modifyreply");
		var r_no = $(this).data("r_no");
		var str = "";
		
		replyService.get(r_no, function(reply) {
			str += "<input value= '"+ reply.r_content +"' id='modreply_content' class='col-md-9' > ";
			str +=" <input type=hidden class='col-md-1' name='m_no' value='"+reply.m_no+"' > ";
			str += " <button class='replyModifyBtn btn btn-outline-dark btn-underline mb-1 btn-xxs' data-r_no='"+r_no+"'  >댓글수정</button><a class='RemoveBtn fe fe-x fa-fw fa-xxs pull-right' data-r_no='"+r_no+"'></a>";		//댓글 수정 버튼
			modifyInput.html(str);
			$(".replyModifyBtn").on("click", function(e) {				//댓글 수정 버튼 누르면
				var r_content1= $("#modreply_content");
				var r_content = {
					r_no : $(this).data("r_no"),
					r_content : r_content1.val()
				};
				replyService.update(r_content, function(result) {
					showList(pageNum);
				});
			});
			$(".RemoveBtn").on("click", function(e) {
				var removeResult = confirm("댓글을 지우겠습니까?");
				if(removeResult){
					r_no = $(this).data("r_no");
					m_no = $("input[name='m_no']").val();
					replyService.remove(r_no, function(result) {
						showList(pageNum);
					});
				}
			});
		});
	});
	//댓글 끝
	
	//대댓글
	$(".chat").on("click",".rereply",function(e) {
		r_no = $(this).data("r_no");
		r_depth = $(this).data("r_depth")+1;
		var modifyInput = $(this).parent().parent().parent().children("#modifyreply");
		var r_no = $(this).data("r_no");
		var str = "";
		str += "<input type ='hidden'name='r_order' value='0'>"+
				"<input type='hidden' name='r_depth' value='"+r_depth+"'>";
		str += "<input id='modreply_content' name='r_content' class='col-md-9' > ";
		str +=" <input class='col-md-1' type='hidden' name='m_no'  > ";
		str += " <button class='addreply btn btn-outline-dark btn-underline mb-1 btn-xxs' data-r_no='"+r_no+"' >댓글 달기</button>"+
				"<a class='RemoveBtn fe fe-x fa-fw fa-xxs pull-right' data-r_no='"+r_no+"'></a>";		 //댓글 수정 버튼
		modifyInput.html(str);
				
		$(".addreply").on("click", function(e) { //등록하기 버튼 누르면
			var R_content = $(this).parent().children("input[name='r_content']").val();
			var M_no = $(this).parent().children("input[name='m_no']").val();
			var r_order = $(this).parent().children("input[name='r_order']").val();
			var r_no = $(this).data("r_no");
			var r_parent = M_no;
			var reply = {
				r_no : r_no,
				r_content : R_content,
				r_order : r_order,
				m_no : user_no,
				b_no : b_noValue,
				r_parent : r_parent
			};
			replyService.add(reply, function(result) {
				showList(-1);
			});
		});
	});
});
</script>

<script type="text/javascript">
	/*   console.log("============");
	 console.log("JS TEST");

	 var b_noValue='<c:out value="${board.b_no}"/>';

	 //for replyService add test
	 replyService.add({
	 r_content:"JS Test", m_email:"ddd@ddd.com", m_no:88, b_no:b_noValue}, function(result){
	 alert("RESULT: " + result);
	 }
	 );    
	 */
	//reply List Test
	/* replyService.getList({b_no:b_noValue, page:1}, function(list){
	 for(var i=0, len=list.length||0; i<len; i++){
	 console.log(list[i]);
	 }
	 });  */

	/*  replyService.remove(45, function(count) {
	 console.log(count);
	
	 if(count === "success") {
	 alert("REMOVED");
	 }
	 }, function(err){
	 alert('ERROR...');
	 }); */

	/*   replyService.update({
	 r_no : 19,
	 b_no : b_noValue,
	 r_content : "Modified Reply...."
	 }, function(result){
	 alert("수정 완료...");
	
	 }); */

	/*  replyService.get(27, function(data){
	 console.log(data);
	 }); */
</script>

<%@ include file="../includes/footer.jsp"%>