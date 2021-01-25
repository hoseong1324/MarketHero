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
				<div class="layout-table container-fluid">
					<div class="layout-full layout-page-navigation">
						<a href="/markethero/merchant/main">대시보드</a><b><i
							class="fa fa-angle-right"></i>
						</b><b><a href="/markethero/merchant/product">상품관리</a></b>
					</div>
					<div class="layout-full layout-table-title">
						<div class="row no-gutters">
							<div class="col-12 col-sm-2">
								<h1>
									<i class="fa fa-shopping-cart"></i>상품관리
								</h1>
							</div>
							<div class="col-6 col-sm-5">
								<form>
									<div class="form-row align-items-center">
										<div class="col-auto my-1">
											<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>

										</div>
										<div class="col-auto my-1">
											<input type="text" class="form-control"
												id="inlineFormInputName" placeholder="주문검색">
										</div>
										<div class="col-auto my-1">
											<button type="submit" class="btn btn-warning">
												<i class="layout-btn-search fa fa-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
							<div class="layout-table-func col-6 col-sm-5">

								<div class="form-row align-items-right">
									<div class="col-auto my-1">
										<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
										<select class="custom-select mr-sm-2"
											id="inlineFormCustomSelect">
											<option selected>검색종류</option>
											<option value="search_product_type">주문종류</option>
											<option value="search_product_no">주문번호</option>
											<option value="search_request_name">주문자</option>
										</select>
									</div>

									<div class="col-auto my-1">

										<!--  모달 -->

										<button type="button" class="btn btn-success"
											onclick="modal_show('')">신규 상품 등록하기</button>
										<br>

										<!-- The Modal -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">
													<!-- Modal Header -->
													<form
														action="${pageContext.request.contextPath}/product/register"
														method="post" enctype="multipart/form-data">
														<div class="modal-header">
															<h4 class="modal-title">신규 상품 등록</h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>
														<!-- Modal body -->

														<div class="modal-body">
															<div class="form-group">
																<label for="m_name">배송자 :</label> <input type="text"
																	class="form-control" id="m_name"
																	placeholder="${merchant.name}" value="${merchant.name}"name="m_name" readonly>
															</div>
															<div class="form-group">
																<label for="name">배송자 번호 :</label> <input type="text"
																	class="form-control" id="merchant_id"
																	placeholder="${merchant.id}" value="${merchant.id}" name="merchant_id"
																	value="${merchant.id}" readonly>
															</div>



															<div class="form-group">
																<label for="p_name">상품 이름 :</label>
																<input type="text" class="form-control" id="p_name"
																	placeholder="상품이름" name="p_name">
															</div>
																<div class="form-group">
																<label for="price">상품 이미지 :</label> <input type="file"
																	class="form-control" name="uploadFile"/>
															</div>
															<div class="form-group">
																<label for="price">가격 입력 :</label> <input type="text"
																	class="form-control" id="price" placeholder="가격 입력"
																	name="price">
															</div>


														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">등록하기</button>
															<button type="button" class="btn btn-danger"
																id="close_modal">취소</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- The Modal -->
									</div>

								</div>

							</div>
						</div>
						<div class="layout-full layout-table-tab">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									href="/markethero/merchant/product">현재 상품</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/markethero/merchant/u_product">요청 상품</a></li>

							</ul>
						</div>
						<div class="layout-full layout-table-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>

										<th scope="col">상품번호</th>
										<th scope="col">상품이름</th>
										<th scope="col">가격</th>
										<th scope="col">등록일시</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${product}" var="product">
										<tr>
											<td><c:out value="${product.id}" /></td>
											<td><c:out value="${product.p_name}" /></td>
											<td><c:out value="${product.price}" /></td>
											<td><c:out value="${product.created_at}" /></td>

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
				<script>
					function modal_show(num) {
						$("#myModal").modal("show");

					}
					$(document).click(function() {
						$("#close_modal").click(function() {
							$("#myModal").modal("hide");
						})
					});
				</script>
</body>

</html>