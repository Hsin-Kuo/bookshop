<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

		<title>Insert title here</title>
		<style>
		
.fa-lg {
	font-size: 1em;
}

.fa {
	position: relative;
	display: table-cell;
	width: 55px;
	height: 36px;
	text-align: center;
	top: 12px;
	font-size: 20px;
}

.main-menu:hover, nav.main-menu.expanded {
	width: 250px;
	overflow: hidden;
	opacity: 1;
}

.main-menu {
	background: #F7F7F7;
	position: absolute;
	top: 0;
	bottom: 0;
	height: 100%;
	left: 0;
	width: 55px;
	overflow: hidden;
	-webkit-transition: width .2s linear;
	transition: width .2s linear;
	-webkit-transform: translateZ(0) scale(1, 1);
	box-shadow: 1px 0 15px rgba(0, 0, 0, 0.07);
	opacity: 1;
}

.main-menu>ul {
	margin: 7px 0;
}

.main-menu li {
	position: relative;
	display: block;
	width: 250px;
}

.main-menu li>a {
	position: relative;
	width: 255px;
	display: table;
	border-collapse: collapse;
	border-spacing: 0;
	color: #8a8a8a;
	font-size: 13px;
	text-decoration: none;
	-webkit-transform: translateZ(0) scale(1, 1);
	-webkit-transition: all .14s linear;
	transition: all .14s linear;
	font-family: 'Strait', sans-serif;
	border-top: 1px solid #f2f2f2;
	text-shadow: 1px 1px 1px #fff;
}

.main-menu .nav-icon {
	position: relative;
	display: table-cell;
	width: 55px;
	height: 36px;
	text-align: center;
	vertical-align: middle;
	font-size: 18px;
}

.main-menu .nav-text {
	position: relative;
	display: table-cell;
	vertical-align: middle;
	width: 190px;
	font-family: 'Titillium Web', sans-serif;
}

/* Logo Hover Property */
a:hover, a:focus {
	text-decoration: none;
	border-left: 0px solid #F7F7F7;
}

.main-menu {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

.main-menu ul, .main-menu li {
	outline: 0;
	margin: 0;
	padding: 0;
	text-transform: uppercase;
}

/* Darker element side menu Start*/
.darkerli {
	background-color: #ededed;
	text-transform: capitalize;
}

.darkerlishadow {
	background-color: #ededed;
	text-transform: capitalize;
	-webkit-box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
	-moz-box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
	box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
}

.darkerlishadowdown {
	background-color: #ededed;
	text-transform: capitalize;
	-webkit-box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
	-moz-box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
	box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
}

/* Darker element side menu End*/
.main-menu li:hover>a, nav.main-menu li.active>a, .dropdown-menu>li>a:hover,
	.dropdown-menu>li>a:focus, .dropdown-menu>.active>a, .dropdown-menu>.active>a:hover,
	.dropdown-menu>.active>a:focus, .no-touch .dashboard-page nav.dashboard-menu ul li:hover a,
	.dashboard-page nav.dashboard-menu ul li.active a {
	color: #fff;
	background-color: #00bbbb;
	text-shadow: 0px 0px 0px;
}

.area {
	float: left;
	background: #e2e2e2;
	width: 100%;
	height: 100%;
}

.memberMain{
	margin-left: 100px;
	}
	
.icon .inverse {
		  transform: rotate(180deg);
		}
		
		</style>
	</head>
	<body>
	<nav class="main-menu">
			<ul>
				<li ><a href="adminPage.jsp"> <i class="fa fa-home fa-lg"></i> <span
						class="nav-text">首頁</span>
				</a></li>
				
				<li><a href="manageProduct.jsp"> <i class="fa fa-shopping-cart fa-lg"></i> <span
					class="nav-text">商品管理</span>
				</a></li>
					<li><a href="cart.jsp"> <i class="fa fa-newspaper fa-lg"></i> <span
					class="nav-text">文章管理</span>
				</a></li>

				<li ><a href="cart.jsp"> <i class="fa fa-user fa-lg"></i> <span
						class="nav-text">會員管理</span>
				</a></li>
				<li ><a href="cart.jsp"> <i class="fa fa-rectangle-list fa-lg"></i>
						<span class="nav-text">訂單管理</span>
				</a></li>

				<li><a href="cart.jsp"> <i class="fa fa-envelope fa-lg"></i>
						<span class="nav-text">客服消息</span>
				</a></li>

			</ul>
		</nav>
		
		<script src=""></script>
	</body>
</html>