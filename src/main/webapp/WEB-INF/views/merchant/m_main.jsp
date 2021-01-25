<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value ="/resources/css/main.css" />" rel="stylesheet">
<link href="<c:url value ="/resources/css/index.css" />"rel="stylesheet">
<link href="<c:url value ="/resources/css/common.css" />"rel="stylesheet">
<link href="<c:url value ="/resources/css/layout.css" />"rel="stylesheet">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>

<title>MARKET HERO</title>

</head>

<body>
	<!--  메뉴 인클루드 -->
	<%@ include file="/WEB-INF/views/include/m_menu.jsp" %>
	<!--  신규주문 알림 -->
	<%@ include file="/WEB-INF/views/include/alarm.jsp" %>
	<!-- 본문 파트 -->
	<div id="contents" v-bind:class="{contents_desktop: isDesktop}"
		v-bind:style="{width: contentsWidth}">
		<!-- 대시보드 레이아웃 -->
		<div class="container-fluid">
			<div class="row">

				<!-- 대시보드 카드 -->
				<div class="dashboard_card col-12 col-sm-6">
					<div class="card">
						<div class="card-body">
							<!-- 대시보드 카드 타이틀 -->
							<div class="card-title">
								<div class="row no-gutters">
									<div class="d-none d-sm-inline-block col-sm-1">
										<font color="#e24000"><i class="fa fa-bell"></i></font>
									</div>
									<div class="col-12 col-sm-11">
										<h1>&nbsp;&nbsp;신규로 접수된 주문요청이 있습니다.</h1>
										<h2>&nbsp;&nbsp;&nbsp;아래의 정보로 신규 접수된 주문요청이 있습니다. 확인 해주세요!</h2>
									</div>
								</div>
							</div>
							<!-- 대시보드 카드 컨텐츠 -->
							<div class="card-contents">
								<table class="table">
									<tbody>
										<c:forEach items="${neworder}" var ="neword" end="3">
										<tr>
											<td class="company_name"><c:out value="${neword.created_at}"/></td>
											<c:choose>
												<c:when test="${neword.etc == 0}">
													<td class="product_name"><b><c:out value="${neword.p_name}"/></b></td>
												</c:when>
												<c:otherwise>
													<td class="product_name"><b><c:out value="${neword.p_name}"/></b>&nbsp;외&nbsp;<c:out value="${neword.etc}"/>개&nbsp;상품</td>
												</c:otherwise>
											</c:choose>
											<td class="company_owner"><c:out value="${neword.u_name}"/></td>
										</tr>
										</c:forEach>
<!-- 										<tr> -->
<!-- 											<td class="company_name">상점명</td> -->
<!-- 											<td class="product_name">상품명</td> -->
<!-- 											<td class="company_owner">주문자</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td class="company_name">상점명</td> -->
<!-- 											<td class="product_name">상품명</td> -->
<!-- 											<td class="company_owner">주문자</td> -->
<!-- 										</tr> -->
									</tbody>
								</table>
							</div>
							<!-- 대시보드 자세히보기 -->
							<div class="card-detail">
								<a href="#">자세히 보기<i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>

				<!-- 대시보드 카드 -->
				<div class="dashboard_card col-12 col-sm-6">
					<div class="card">
						<div class="card-body">
							<!-- 대시보드 카드 타이틀 -->
							<div class="card-title">
								<div class="row no-gutters">
									<div class="d-none d-sm-inline-block col-sm-1">
										<font color="#333333"><i class="fa fa-shopping-cart"></i></font>
									</div>
									<div class="col-12 col-sm-11">
										<h1>&nbsp;&nbsp;배송내역</h1>
										<h2>&nbsp;&nbsp;&nbsp;배송중인 상품에 대한 정보를 확인하세요</h2>
									</div>
								</div>
							</div>
							<!-- 대시보드 카드 컨텐츠 -->
							<div class="card-contents">
								<table class="table">
									<tbody>
										<c:forEach items="${orderlist}"  var = "orders" end="3">
										<tr>
											<td class="company_name"><c:out value="${orders.created_at}"/></td>
											<c:choose>
												<c:when test="${orders.etc == 0}">
													<td class="product_name"><b><c:out value="${orders.p_name}"/></b></td>
												</c:when>
												<c:otherwise>
													<td class="product_name"><b><c:out value="${orders.p_name}"/></b>&nbsp;외&nbsp;<c:out value="${orders.etc}"/>개&nbsp;상품</td>
												</c:otherwise>
											</c:choose>
												<c:choose>
													<c:when test="${orders.status == 1}">
														<td class="product_status product_catch">배송준비중</td>
													</c:when>
													<c:when test="${orders.status == 2}">
														<td class="product_status product_delivery">상품 배송 중</td>
													</c:when>
													<c:otherwise>
														<td class="product_status product_completion">배송완료</td>
													</c:otherwise>
												</c:choose>
										</tr>
										</c:forEach>
<!-- 										<tr> -->
<!-- 											<td class="company_name">상점명</td> -->
<!-- 											<td class="product_name">상품명</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td class="company_name">상점명</td> -->
<!-- 											<td class="product_name">상품명</td> -->
<!-- 											<td class="product_status product_delivery">상품 배송 중</td> -->
<!-- 										</tr> -->
									</tbody>
								</table>
							</div>
							<!-- 대시보드 자세히보기 -->
							<div class="card-detail">
								<a href="#">자세히 보기<i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>

				<!-- 대시보드 카드 -->
				<div class="dashboard_card col-12 col-sm-6">
					<div class="card">
						<div class="card-body">
							<!-- 대시보드 카드 타이틀 -->
							<div class="card-title">
								<div class="row no-gutters">
									<div class="d-none d-sm-inline-block col-sm-1">
										<font color="#333"><i class="fa fa-bar-chart"></i></font>
									</div>
									<div class="col-12 col-sm-11">
										<h1>&nbsp;&nbsp;&nbsp;${merchant.name} 님의 매출현황입니다.</h1>
										<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매출현황을 관리하고 가계운영 계획을
											세워보세요.</h2>
									</div>
								</div>
								<a href="#"><i class="card-title-more fa fa-angle-right"></i></a>
							</div>
							<!-- 대시보드 카드 컨텐츠 -->
							<div class="card-contents" align="center">
								<img
									src="<c:url value= "/resources/images/dashboard/sample_chart_01.png"/> "
									width="70%" />
							</div>
						</div>
					</div>
				</div>

				<!-- 대시보드 카드 -->
				<div class="dashboard_card col-12 col-sm-6">
					<div class="card">
						<div class="card-body">
							<!-- 대시보드 카드 타이틀 -->
							<div class="card-title">
								<div class="row no-gutters">
									<div class="d-none d-sm-inline-block col-sm-1">
										<font color="#333"><i class="fa fa-pie-chart"></i></font>
									</div>
									<div class="col-12 col-sm-11">
										<h1>&nbsp;&nbsp;${merchant.name} 님의 상품현황입니다.</h1>
										<h2>&nbsp;&nbsp;&nbsp;인기 상품과 재고 관리를 확인해서 효과적인 가계관리를 해보세요.</h2>
									</div>
								</div>
								<a href="#"><i class="card-title-more fa fa-angle-right"></i></a>
							</div>
							<!-- 대시보드 카드 컨텐츠 -->
							<div class="card-contents" align="center">
								<img
									src="<c:url value= "/resources/images/dashboard/sample_chart_02.png"/>"
									width="70%" />
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
</body>

</html>

