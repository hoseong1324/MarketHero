<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<script>
	$(function() {
		var url = window.location.pathname, urlRegExp = new RegExp(url.replace(
				/\/$/, '')
				+ "$");
		$('a.mm').each(function() {
			if (urlRegExp.test(this.href.replace(/\/$/, ''))) {
				$(this).addClass('menu_active');
			}
		});
	});
</script>

<!-- 메뉴 파트 -->
<div id="menu" v-bind:class="{menu_active: isDesktop}"
	v-bind:style="{height: menuHeight}">
	<!-- 유저정보 파트 -->
	<div id="menu_user">
		<a href="/markethero/"> <img
			src="<c:url value= "/resources/images/menu/menu_ci.png"/>"></a>
		<h1>${user.name}님</h1>
		<h2>안녕하세요!</h2>
		<div id="menu_user_btns">
			<button type="button" class="btn btn-default navbar-btn"
				onClick="location.href='#'">회원정보</button>
			<%-- <button type="button"
				class="btn btn-default navbar-btn menu_user_btn_logout"
				onClick="location.href='${pageContext.request.contextPath}/user/logout'">로그아웃</button> --%>
					<button type="button"
					class="btn btn-default navbar-btn menu_user_btn_logout"
					onClick="test();">로그아웃</button>
		</div>
	</div>
	<!-- 메뉴 목록 -->
	<ul>
		<li class="menu"><a class="mm" href="/markethero/user/order">
				<i class="menu_icon fa fa-shopping-cart"></i>주문하기<i
				class="menu_arrow fa fa-angle-right"></i>
		</a></li>
		<li class="menu"><a class="mm" href="/markethero/user/ordera">
				<i class="menu_icon fa fa-cubes"></i>주문내역<i
				class="menu_arrow fa fa-angle-right"></i>
		</a></li>
	</ul>
</div>

<script>
	function test(){
		alert("로그아웃 되었습니다. ");
		location.href="${pageContext.request.contextPath}/user/logout";
	}
	</script>