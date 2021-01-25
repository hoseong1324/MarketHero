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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<title>MARKET HERO - 회원가입</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		// 취소
		$(".cencle").on("click", function() {
			location.href = "${pageContext.request.contextPath}/";
		})

		$("#submit").on("click", function() {
			if ($("#merchant_id").val() == "") {
				alert("상인번호를 입력해주세요.");
				$("#merchant_id").focus();
				return false;
			}
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
	function coreg() {

		$.ajax({
			url : "${pageContext.request.contextPath}/user/hometax",
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

	function fn_idChk() {
		$.ajax({
			url : "${pageContext.request.contextPath}/user/idChk",
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
	function search() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addre = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				var sangse = '';

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addre = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addre = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("chamgo").value = extraAddr;

				} else {
					document.getElementById("chamgo").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('woo').value = data.zonecode;
				document.getElementById("ju").value = addre;
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr").focus();

				var addr =
					'(' + document.getElementById('woo').value +') '+ document.getElementById("ju").value + ' ' + document.getElementById("chamgo").value + ' ' ;
					
				document.getElementById("addr").value = addr ;
			}
		}).open();
		
	}
// 	 data.zonecode + addre + extraAddr +

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
					<form action="${pageContext.request.contextPath}/user/register" method="post" id="regForm">
						<div class="form-group has-feedback">
							<label class="control-label" for="merchant_id">배송자 번호</label> 
							<input class="form-control" type="text" id="merchant_id" name="merchant_id" />
						</div>
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
						<!--  주소 검색 -->
						<label class="control-label" for="addr">주소</label>
						<div class="form-group has-feedback">
							<input class="form-control"type="text" name="woo"id="woo" placeholder="우편번호"/>
							<input class="form-control"type="button" onclick="search()" value="우편번호 찾기"/><br>
							<input class="form-control" type="text"name="ju" id="ju" placeholder="주소"/><br> 
								<input class="form-control"	type="text" id="chamgo" placeholder="참고항목"/><br>
						<label class="control-label" for ="addr">상세주소</label>
							<input class ="form-control"type="text" name="addr"id="addr" placeholder="상세주소"/><br>
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
					
				</div>
				<div id="index_copyright">ⓒ2020 MARKET HERO All Rights
						Reserved</div>
			</div>

		</div>

	</section>
</body>

</html>

