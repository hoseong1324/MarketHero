<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
  <meta http-equiv="Cache-Control" content="no-cache">

  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="keywords" content="">

  <meta name="description" content="">
  <meta property="og:type" content="">
  <meta property="og:title" content="MARKET HERO">
  <meta property="og:description" content="">
  <meta property="og:image" content="">
  <meta property="og:url" content="">

  <link rel="canonical" href="">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="<c:url value ="/resources/css/common.css" />" rel="stylesheet">
<link href="<c:url value ="/resources/css/layout.css" />" rel="stylesheet">
<link href="<c:url value ="/resources/css/main.css" />"	rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
  <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script src="<c:url value="/resources/js/main.js"/>"></script>

  <title>MARKET HERO</title>
</head>

<body>
 <!--  메뉴 인클루드 -->
	<%@ include file="/WEB-INF/views/include/m_menu.jsp" %>
  <!-- 본문 파트 -->
  <div id="contents" v-bind:class="{contents_desktop: isDesktop}" v-bind:style="{width: contentsWidth}">
    <!-- 대시보드 레이아웃 -->
    <div class="container-fluid">
      <div class="row">

        

        <!-- 대시보드 카드 -->
        <div class="dashboard_card col-12 col-sm-6">
         
              </div>
           

      
    <!-- 테이블 레이아웃 -->
    <div class="layout-table container-fluid">
      <div class="layout-full layout-page-navigation">
        <a href="/markethero/merchant/main">대시보드</a><b><i class="fa fa-angle-right"></i></b><b><a href="/markethero/merchant/order">주문관리</a></b>
      </div>
      <div class="layout-full layout-table-title">
        <div class="row no-gutters">
          <div class="col-12 col-sm-2">
            <h1><i class="fa fa-shopping-cart"></i>주문관리</h1>
          </div>
          <div class="col-6 col-sm-5">
<!--             <form> -->
<!--               <div class="form-row align-items-center"> -->
<!--                 <div class="col-auto my-1"> -->
<!--                   <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label> -->
<!--                   <select class="custom-select mr-sm-2" id="inlineFormCustomSelect"> -->
<!--                     <option selected>검색종류</option> -->
<!--                     <option value="search_product_type">주문종류</option> -->
<!--                     <option value="search_product_no">주문번호</option> -->
<!--                     <option value="search_request_name">주문자</option> -->
<!--                   </select> -->
<!--                 </div> -->
<!--                 <div class="col-auto my-1"> -->
<!--                   <input type="text" class="form-control" id="inlineFormInputName" placeholder="주문검색"> -->
<!--                 </div> -->
<!--                 <div class="col-auto my-1"> -->
<!--                   <button type="submit" class="btn btn-warning"><i class="layout-btn-search fa fa-search"></i></button> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </form> -->
          </div>
          <div class="layout-table-func col-6 col-sm-5">
            <form>
              <div class="form-row align-items-right">
<!--                 <div class="col-auto my-1"> -->
<!--                   <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label> -->
<!--                   <select class="custom-select mr-sm-2" id="inlineFormCustomSelect"> -->
<!--                     <option selected>검색종류</option> -->
<!--                     <option value="search_product_type">주문종류</option> -->
<!--                     <option value="search_product_no">주문번호</option> -->
<!--                     <option value="search_request_name">주문자</option> -->
<!--                   </select> -->
<!--                 </div> -->
<!--                 <div class="col-auto my-1"> -->
<!--                   <button type="submit" class="btn btn-warning">주문내역가져오기</button> -->
<!--                 </div> -->
<!--                 <div class="col-auto my-1"> -->
<!--                   <button type="submit" class="btn btn-warning">신규주문하기</button> -->
<!--                 </div> -->
              </div>
            </form>
          </div>

        </div>
      </div>
      <div class="layout-full layout-table-tab">
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" href="#">전체항목</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">배송중</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">거래완료</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">발주요청</a>
          </li>
        </ul>
      </div>
      <div class="layout-full layout-table-body">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">주문종류</th>
              <th scope="col">주문번호</th>
              <th scope="col">주문내역</th>
              <th scope="col">주문자</th>
              <th scope="col">주문일자</th>
              <th scope="col">배송/납품일자</th>
              <th scope="col">주문상태</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items = "${list}" var = "list">
            <tr>
              <td><input type="checkbox"></td>
              <td>일반주문</td>
<%--               <td><a href="main.html"><c:out value = "${list.id}" /></a></td> --%>
			  <td><a href="<c:url value="detail">
                				<c:param name='O.id' value="${list.id}"/>
            			   </c:url>">${list.id}</a> </td>
              <c:if test = "${list.count eq 0}">
              <td><c:out value="${list.product_name}" /></td>
              </c:if>
              <c:if test = "${list.count > 0}">
              <td><c:out value="${list.product_name} 외(${list.count})" /></td>
              </c:if>
              <td><c:out value="${list.user_name}" /></td>
              <td><c:out value = "${list.created_at}" /></td>
              <td>-</td>
              <c:if test = "${list.status eq 0}">
              		<td><span class="badge badge-danger">주문확인중</span></td>
              </c:if>
              <c:if test = "${list.status eq 1}">
              		<td><span class="badge badge-success">배송준비중</span></td>
              </c:if>
              <c:if test = "${list.status eq 2}">
              		<td><span class="badge badge-info">배송중</span></td>
              </c:if>
              <c:if test = "${list.status eq 3}">
              		<td><span class="badge badge-primary">배송완료</span></td>
              </c:if>
              
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
      <div class="layout-full layout-table-navigation">
        <nav aria-label="Page navigation">
          <ul class="pagination justify-content-center">
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</body>

</html>