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
	<%@ include file="/WEB-INF/views/include/u_menu.jsp"%>
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
						<a href="/markethero/user/main">대시보드</a> <b> <i
							class="fa fa-angle-right"></i></b> <a href="/markethero/user/order">주문하기</a>
						<b> <i class="fa fa-angle-right"></i></b> <b><a
							href="/markethero/cart/">장바구니</a></b>
					</div>
					<div class="layout-full layout-table-title">
						<div class="row no-gutters">
							<div class="col-12 col-sm-2">
								<h1>
									<i class="fa fa-shopping-cart"></i>장바구니
								</h1>
							</div>
							<div class="col-6 col-sm-5">
								<form>
									<div class="form-row align-items-center">
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
											onclick="modal_show('')">상품 주문하기</button>
										<br>

										<!-- The Modal -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">
													<!-- Modal Header -->
													<form
														action="${pageContext.request.contextPath}/cart/orders"
														method="post">
														<div class="modal-header">
															<h4 class="modal-title">상품 주문</h4>
															<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>
														<!-- Modal body -->

														<div class="modal-body">
															<div class="form-group">
																<label for="u_id">배송자 이름:</label> <input type="text"
																	class="form-control" id="u_id"
																	placeholder="${user.m_name}" name="u_m_name"
																	value="${user.m_name}" readonly>

															</div>
															<div class="form-group">
																<label for="u_name">요청자 :</label> <input type="text"
																	class="form-control" id="u_name"
																	placeholder="${user.name}" name="u_name"
																	value="${user.name}" readonly>
																	<input type="hidden"name="user_id"value="${user.id}"/>
															</div>
															<div class="form-group">

																<label for="u_p_name">상품 :</label>
																<c:set var = "sumtotal" value = "0"/>
																<c:forEach items="${cart}" var="cart">
																	<input type="text" class="form-control" id="p_name"
																		value="<c:out value='${cart.p_name}'/> x <c:out value='${cart.quantity}'/> = <c:out value='${cart.total}'/> "
																		placeholder=""	name="p_name" readonly>
																		<c:set var= "sumtotal" value="${sumtotal + cart.total}"/>
																		
																		
																		<input type="hidden" name="product_id" value="<c:out value='${cart.p_id}'/>">
																		<input type="hidden" name="quantity" value="<c:out value='${cart.quantity}'/>">
																		<input type="hidden" name="list[0].quantity" value="<c:out value='${cart.quantity}'/>">
																</c:forEach>
															</div>
															<div class="form-group">
																
																 <select name="pay_method"style="height:40px;width:110px;font-size:15px;">
																 <option value="">결제방법</option>
																 <option value="현금">현금</option>
																 <option value="카드">카드</option>
																 <option value="계좌이체">계좌이체</option>
																 </select>
																 <select name="rcv_method"style="height:40px;width:110px;font-size:15px;">
																 <option value="수령방식">수령방식</option>
																 <option value="직접수령">직접수령</option>
																 <option value="배송">배송</option>								
																 </select>
																	<input type="hidden" name="order_type"value="1">
															</div>
															<div class="form-group">

																<label for="price">총 금액 :</label>
												
																	<input type="text" class="form-control" id="u_request"
																		placeholder="<c:out value='${sumtotal}'/>" name="u_request"readonly>
			
															</div>

														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">주문하기</button>
															<button type="button" class="btn btn-danger"
																id="close_modal">취소</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- The Modal -->
									</div>

									<div class="col-auto my-1"></div>
								</div>

							</div>

						</div>
					</div>
					<div class="layout-full layout-table-tab">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active" href="#">전체항목</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">#</a></li>
							<li class="nav-item"><a class="nav-link" href="#">#</a></li>
							<li class="nav-item"><a class="nav-link" href="#">#</a></li>
						</ul>
					</div>

					<div class="layout-full layout-table-body">
						<c:forEach items="${cart}" var="cart">
							<div class="o_menu">
								<form action="${pageContext.request.contextPath}/cart/delete"
									method="post">
									<input type="hidden" value="${cart.id}" name="id" />
									
									<input type="submit"
										style="background-color: lightgreen; border: 5px;"
										value="장바구니에서 삭제" class="sub">


									<div class="o_name">
										<h2>
											<c:out value="${cart.p_name}" />
										</h2>
									</div>
									<hr>
									<img style="width: 100%; height: 65%;"
										src="<c:url value= "/resources/images/uploadFile/${cart.file_name}"/>" />
									<hr>
									<h4 style="text-align: center;">
										주문 개수 : <c:out value="${cart.quantity}"/> <br>
										가격 :
										<c:out value="${cart.price}" />
									</h4>
								</form>
							</div>
						</c:forEach>
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
			$(".sub").click(function() {
				alert("장바구니에서 물건을 삭제하였습니다");
			})

		});
	</script>

</body>

</html>