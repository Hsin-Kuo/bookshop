<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

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
		<nav class="navbar navbar-expand-lg fixed-top" data-0="background-color: rgba(255,255,255,0.8)" data-50="background-color: rgba(255,255,255,0.5)">
  <div class="container-fluid">   <a class="navbar-brand" href="#"> <span>有貓匿 Cat Inside</span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link">引言 Intro</a></li>
        <li class="nav-item"><a class="nav-link">網路書房 Shop
            <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">故事 Story</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="#">product A</a></li>
                <li><a class="dropdown-item" href="#">product B</a></li>
                <li><a class="dropdown-item" href="#">product C</a></li>
              </ul>
            </li></a></li>
        <li class="nav-item"> <a class="aboutMember nav-link">登入 Login</a></li>
        <li class="nav-item"> <a class="aboutMember nav-link"> <i class="fa-solid fa-cart-shopping"></i>
        
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