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
<link href="<c:url value ="/resources/css/common.css" />"
	rel="stylesheet">
<link href="<c:url value ="/resources/css/layout.css" />"
	rel="stylesheet">
<link href="<c:url value ="/resources/css/main.css" />" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/js/main.js"/>"></script>

<title>MARKET HERO</title>
<style >
table{
width : 100%;
}



</style>
</head>

<body>
	<!--  메뉴 인클루드 -->
	<%@ include file="/WEB-INF/views/include/m_menu.jsp"%>
	<!-- 본문 파트 -->
	<div id="contents" v-bind:class="{contents_desktop: isDesktop}"
		v-bind:style="{width: contentsWidth}">
		<!-- 대시보드 레이아웃 -->
		<div class="container-fluid">
			<div class="row">



				<!-- 대시보드 카드 -->
				<div class="dashboard_card col-12 col-sm-6"></div>



				<!-- 테이블 레이아웃 -->
				<div class="layout-full layout-page-navigation">
					<a href="main">대시보드</a><b><i class="fa fa-angle-right"></i></b><a
						href="#">주문관리</a><i class="fa fa-angle-right"></i></i></b><b><a
						href="#">주문상세내역</a></b>
				</div>
				<div class="layout-full layout-table-title">
					<div class="row no-gutters">
						<div class="col-12 col-sm-7">
							<h1>
								<i class="fa fa-arrow-left"></i>주문상세내역
							</h1>
						</div>



						<div class="layout-table-func col-6 col-sm-5">
							<form>
								<div class="form-row align-items-right">
<!-- 									<div class="col-auto my-1"> -->
<!-- 										<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label> -->
<!-- 										<select class="custom-select mr-sm-2" -->
<!-- 											id="inlineFormCustomSelect"> -->
<!-- 											<option selected>주문상태변경</option> -->
<!-- 											<option value="search_product_type">주문종류</option> -->
<!-- 											<option value="search_product_no">주문번호</option> -->
<!-- 											<option value="search_request_name">주문자</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="col-auto my-1"> -->
<!-- 										<button type="submit" class="btn btn-warning">주문취소하기</button> -->
<!-- 									</div> -->
								</div>
							</form>
						</div>

<!-- 						<div class="ss" style="background-color: #ffffff"> -->
						<div class="layout-full layout-table-body">
							<table class="table table-bordered table-hover">
								
								<tbody>
								<c:forEach items="${tlist}" var="tlist">
									<td colspan="10">주문번호 : <c:out value="${tlist.oid} "/></td>
									<tr>
									<td><b>주문자명</b><br><c:out value="${tlist.name}" /></td>
									<td><b>연락처</b><br><c:out value="${tlist.tel}"/></td>
									<td><b>주문종류</b><br>일반주문</td>
									<td><b>주문경로</b><br>온라인주문</td>
									<c:if test = "${tlist.status eq 0}">
					              		<td rowspan="2" style="text-align:center"><b>주문상태</b><br><button type="button" class="btn btn-danger btn-lg">주문확인중</button></td>
					             	</c:if>
						             <c:if test = "${tlist.status eq 1}">
						             	<td rowspan="2" style="text-align:center"><b>주문상태</b><br><button type="button" class="btn btn-success btn-lg">배송준비중</button></td>
						             </c:if>
						             <c:if test = "${tlist.status eq 2}">
						             	<td rowspan="2" style="text-align:center"><b>주문상태</b><br><button type="button" class="btn btn-info btn-lg">배송중</button></td>
						             </c:if>
						             <c:if test = "${tlist.status eq 3}">
						             	<td rowspan="2" style="text-align:center"><b>주문상태</b><br><button type="button" class="btn btn-primary btn-lg">배송완료</button></td>
						             </c:if>
									</tr>
									<tr>
									<td colspan="2"><b>배송지 주소</b><br><c:out value="${tlist.addr}" /></td>
									<td><b>결제방법</b><br>계좌이체</td>
									<td><b>배송방법</b><br>직접수령</td>
									</tr>
								</c:forEach>
								
								
								</tbody>
								
							</table>
						</div>

						<div class="layout-full layout-table-body">
							<h3>
								<i class="fa fa-shopping-cart"></i> 주문상품목록
							</h3>
						</div>
						
						<div class="layout-full layout-table-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th scope="col">상품번호</th>
										<th scope="col">상품명</th>
										<th scope="col">주문수량</th>
										<th scope="col">단가</th>
										<th scope="col">주문가격</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="list">
										<tr>
											<td><c:out value="${list.id}" /></td>
											<td><c:out value="${list.p_name}" /></td>
											<td><c:out value="${list.quantity}" /></td>
											<td><c:out value="${list.price}" /></td>
											<td><c:out value="${list.total}" /></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div class="layout-full layout-table-navigation">
							<nav aria-label="Page navigation">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
</body>

</html>