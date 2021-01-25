<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache">

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords" content="">

<meta name="description" content="">
<meta property="og:type" content="">
<meta property="og:title" content="MARKET HERO">
<meta property="og:description" content="">
<meta property="og:image" content="">
<meta property="og:url" content="">

<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="canonical" href="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
<link href="<c:url value ="/resources/css/index.css" />"
	rel="stylesheet">
<link href="<c:url value ="/resources/css/common.css" />"
	rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>

<title>MARKET HERO - 회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "${pageContext.request.contextPath}/";
		})

		$("#submit").on("click", function() {
// 			if ($("#id").val() == "") {
// 				alert("상인번호를 입력해주세요.");
// 				$("#id").focus();
// 				return false;
// 			}
			if ($("#email").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#email").focus();
				return false;
			}
			if ($("#pw").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#pw").focus();
				return false;
			}
			if ($("#name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			}
			if ($("#tel").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#tel").focus();
				return false;
			}
			if ($("#bank").val() == "") {
				alert("은행 명을 입력해주세요.");
				$("#bank").focus();
				return false;
			}
			if ($("#ac_name").val() == "") {
				alert("수취인을 입력해주세요.");
				$("#ac_name").focus();
				return false;
			}
			if ($("#ac_num").val() == "") {
				alert("계좌번호를 입력해주세요.");
				$("#ac_num").focus();
				return false;
			}
			if ($("#co_reg_num").val() == "") {
				alert("사업자번호를 입력해주세요.");
				$("#co_reg_num").focus();
				return false;
			}
			var idChkVal = $("#idChk").val();
			if (idChkVal == "N") {
				alert("중복확인 버튼을 눌러주세요.");
			} else if (idChkVal == "Y") {
				$("#regForm").submit();
			}
		});
	})
	
	function fn_idChk() {
		$.ajax({
			url : "${pageContext.request.contextPath}/merchant/idChk",
			type : "post",
			dataType : "json",
			data : {
				"email" : $("#email").val()
			},
			success : function(data) {
				if (data == 1) {
					alert("중복된 아이디입니다.");
				} else if (data == 0) {
					$("#idChk").attr("value", "Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})
	}
	function coreg() {

		$.ajax({
			url : "${pageContext.request.contextPath}/merchant/hometax",
			type : "post",
			data : {
				"co_reg_num" : $("#co_reg_num").val()
			},
			success : function(data) {
				alert(data);
				if (data == "등록되어 있지 않은 사업자등록번호 입니다. "){
					alert("사업자 번호를 확인해주세요.")
					$("#co_reg_num").focus();
					document.querySelector('#co_reg_num').value = '';
					return false;
					}
				
			}
		})
		
	}
</script>
<body>
	<section id="container">
		<div class="row no-gutters">
			<!-- 배경(모바일에서는 비표시) -->
			<div id="index_background" class="d-none d-sm-inline-block col-sm-6"
				v-bind:style="{height: bgHeight}"></div>
			<!-- 회원가입 폼 -->
			<div class="row no-gutters" style="padding: 50px;">
				<div class="d-sm-none d-md-inline-block col-md-4">
					<img src="<c:url value ="/resources/images/index/CI.png"/>"
						width=100% />
				</div>
				<div id="index_login" class="col-sm-12 col-md-8">
					<h1>환영합니다!</h1>
					<h2>이제 마켓히어로에서 편하게 주문하세요!</h2>
					<form action="${pageContext.request.contextPath}/merchant/register"
						method="post" id="regForm">

<!-- 						<div class="form-group has-feedback"> -->
<!-- 							<label class="control-label" for="id">상인번호</label> <input -->
<!-- 								class="form-control" type="text" id="id" name="id" /> -->
<!-- 						</div> -->
						<div class="form-group has-feedback">
							<label class="control-label" for="email">아이디</label> <input
								class="form-control" type="text" id="email" name="email" />
							<button class="idChk" type="button" id="idChk"
								onclick="fn_idChk();" value="N">중복확인</button>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="pw">패스워드</label> <input
								class="form-control" type="password" id="pw" name="pw" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="name">이름</label> <input
								class="form-control" type="text" id="name" name="name" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="tel">전화번호</label> <input
								class="form-control" type="text" id="tel" name="tel" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="bank">은행</label> <input
								class="form-control" type="text" id="bank" name="bank" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="ac_name">예금주</label> <input
								class="form-control" type="text" id="ac_name" name="ac_name" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="ac_num">계좌번호</label> <input
								class="form-control" type="text" id="ac_num" name="ac_num" />
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="co_reg_num">사업자번호</label> <input
								class="form-control" type="text" id="co_reg_num"
								name="co_reg_num" />
								<input class="form-control" type="button" onclick="coreg()"value="사업자번호 조회하기">
						</div>
					</form>
					<div class="form-group has-feedback">
						<button class="btn btn-success" type="button" id="submit">회원가입</button>
						<button class="cencle btn btn-danger" type="button">취소</button>
					</div>
						<div id="index_copyright">ⓒ2020 MARKET HERO All Rights Reserved
			</div>
				</div>
			</div>
		
		</div>

	</section>
</body>

</html>

