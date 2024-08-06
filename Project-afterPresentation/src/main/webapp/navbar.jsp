<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">


		<title>Insert title here</title>
		<style>
		.navbar-brand {
		  color: #6e1920;
		}
		
		* {
		  box-sizing: border-box;
		}
		* a {
		  text-decoration: none;
		  color: #ad7744;
		  font-weight: bold;
		}
		
		nav {
		  background-color: rgba(255, 255, 255, 0.7);
		  width: 960px;
		}
		</style>
	</head>
	<body>
	<div id="nav" style="background-color: rgba(255, 255, 255, 0.8);">
<nav class="navbar navbar-expand-lg fixed-top" style="background-color: rgba(255, 255, 255, 0.8); width: 960px;  margin-left: auto; margin-right: auto; border-radius: 0 0 25px 25px;" data-0="background-color: rgba(255,255,255,0.8)" data-50="background-color: rgba(255,255,255,0.5)">
		  <div class="container-fluid">   <a class="navbar-brand" href="homePage.jsp" style="color: #6e1920;"> 
		  <img src="images/logoP_L.png" width="30" height="24" class="d-inline-block align-text-top">
		  <span>有貓匿 Cat Inside</span></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		    <div class="collapse navbar-collapse" id="navbarNavDropdown">
		      <ul class="navbar-nav ms-auto">
		        <li class="nav-item"><a class="nav-link" href="homePage.jsp">首頁 Intro</a></li>
		        <li class="nav-item"><a class="nav-link" href="showAllProduct.jsp">網路書房 Shop
		            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">故事 Story</a>
		              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
		                <li><a class="dropdown-item" href="articlePage1.jsp">精選書摘</a></li>
		                <li><a class="dropdown-item" href="#">product B</a></li>
		                <li><a class="dropdown-item" href="#">product C</a></li>
		              </ul>
		            </li></a></li>
		            <li class="nav-item" v-show="memberId!='null'"> <a class="aboutMember nav-link" href="memberPage.jsp">會員中心</a></li>
		        <li class="nav-item"> <a class="aboutMember nav-link" :href="memberId=='null'?'login.jsp':'logout.jsp'">{{memberId=='null'?'登入 Login':'登出'}}</a></li>
		        <li class="nav-item" > <a class="aboutMember nav-link"> <i class="fa-solid fa-cart-shopping" id="cart"></i>
		        <jsp:include page="cartMenu.jsp"/>
		        </a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		</div>
				<script>
		</script>
	</body>
</html>