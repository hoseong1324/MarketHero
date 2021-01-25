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

<link rel="canonical" href="">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
<link href="<c:url value ="/resources/css/index.css" />"
	rel="stylesheet">
<link href="<c:url value ="/resources/css/common.css" />"
	rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/index.js"/>"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>

<title>MARKET HERO</title>
</head>

<body>
	<div class="row no-gutters">
		<!-- 배경(모바일에서는 비표시) -->
		<div id="index_background" class="d-none d-sm-inline-block col-sm-6"
			v-bind:style="{height: bgHeight}"></div>
		<!-- 로그인 폼 -->
		<div id="index_stage" class="d-table col-sm-6 col-12"
			v-bind:style="{height: stageHeight}">
			<div class="d-table-cell align-middle">
				<div id="index_form" class="row justify-content-center no-gutters">
					<div class="col-10 col-sm-8">
						<form method="post" >
							<div class="row no-gutters">
								<div class="d-sm-none d-md-inline-block col-md-4">
									<img src="<c:url value ="/resources/images/index/CI.png"/>"
										width=100%/>
								</div>
								<div id="index_login" class="col-sm-12 col-md-8">
									<h1>환영합니다!</h1>
									<h2>이제 마켓히어로에서 편하게 주문하세요!</h2>
									<!-- 로그인 폼 : 아이디 -->
									<h3>아이디(ID)</h3>
									<div class="input-group index_login_input">
										<input type="text" name="email" class="form-control">
									</div>
									<!-- 로그인 폼 : 비밀번호 -->
									<h3>비밀번호(Password)</h3>
									<div class="input-group index_login_input">
										<input type="password" name="pw" class="form-control">
									</div>
								</div>
							</div>
							<div class="row no-gutters">
								<div class="col-12 index_login_btns">
									<div>
									<input type="button" class="btn btn-default navbar-btn" onclick="location.href='user/register'"  value="구매자 가입" />
									<input type="button" class="btn btn-default navbar-btn" onclick="location.href='merchant/register'"  value="배송자 가입" />
									 </div><hr>
									 <div>
									 <input type="submit"class="btn btn-default navbar-btn" value="구매자 로그인" onclick="javascript: form.action='user/login';" />
									 <input type="submit"class="btn btn-default navbar-btn" value="배송자 로그인" onclick="javascript: form.action='merchant/login';"/>
									</div>
<!-- 									<h4> -->
<!-- 										비밀번호를 잊어버리셨다면 <a href="./">여기</a>를 눌러주세요. -->
<!-- 									</h4> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="index_copyright">ⓒ2020 MARKET HERO All Rights Reserved
			</div>
		</div>
	</div>
</body>
<c:if test="${user != null}">
	<script>
		alert("${user.name}님 환영 합니다.");
		location.href = "/markethero/user/order";
	</script>

</c:if>
<c:if test="${merchant != null}">
<script>
	alert("${merchant.name}님 환영합니다.");
	location.href = "/markethero/dashboard/merchant";
</script>
</c:if>
<c:if test="${msg == false}">
	<script>
		alert("로그인 실패! 아이디와 비밀번호 확인해주세요.");
	</script>
</c:if>
</html>

