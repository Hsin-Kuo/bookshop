<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>	
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

body {
  background-color: #f0e8e6;
}

nav {
  background-color: rgba(255, 255, 255, 0.7);
}

#section_article .title, #section_article .title_img {
  max-width: 1090px;
  margin-left: auto;
  margin-right: auto;
}
#section_article .header {
  max-width: 675px;
  margin: 150px auto 50px auto;
}
#section_article .header p {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ad7744;
  color: #ad7744;
}
#section_article .main_img {
  width: 100%;
  margin-bottom: 100px;
}

aside .tag {
  color: #6e1920;
  margin-left: auto;
  background-color: #f0e8e6;
  border: 1px solid #6e1920;
  width: 240px;
  height: 300px;
  border-radius: 10px;
}
aside .dot {
  font-size: 50px;
  font-weight: bolder;
  line-height: 45px;
}
aside .tagcontent {
  font-size: 15px;
  margin: 5px 20px;
  letter-spacing: 2px;
}
aside .tagcategory {
  display: block;
  font-size: 20px;
  letter-spacing: 3px;
  font-weight: bold;
  color: #6e1920;
  border-bottom: 1px solid;
}
aside .date {
  display: inline-block;
  padding-right: 10px;
  margin-bottom: 0;
  font-weight: bold;
  vertical-align: top;
  line-height: 25px;
}
aside .author {
  margin: 0px;
}
aside .author:last-child {
  border-bottom: 1px solid;
  padding-bottom: 5px;
}
aside .hashtag {
  margin: 5px 20px;
}
aside .hashtag a {
  text-decoration: underline;
  margin-right: 10px;
}

#excerpt {
  max-width: 675px;
  background-color: #6e1920;
  color: white;
  padding: 50px 70px;
  letter-spacing: 1px;
  line-height: 25px;
}
#excerpt p:first-child {
  font-weight: bold;
}
#excerpt p:last-child {
  font-weight: lighter;
}

#content {
  max-width: 675px;
  margin-top: 60px;
  margin-bottom: 100px;
}
#content p {
  font-weight: bold;
}
#content hr {
  border: 3px solid #bf7c67;
  width: 20%;
  margin: 60px auto;
  opacity: 0.7;
}

footer {
  background-image: url(https://pic.52112.com/2021/07/05/22/05225240_f06ed57ae2_small.jpg);
  text-align: center;
}
footer .container {
  padding: 30px;
}
footer hr {
  border: 3px solid #bf7c67;
  width: 10%;
  margin: 30px auto;
  opacity: 0.7;
}
footer button {
  background-color: rgba(255, 255, 255, 0.8);
  padding: 7px 25px;
  border-radius: 5px;
  border: 1px solid rgba(135, 32, 50, 0.3);
  color: #872032;
  transition: 0.3s;
  font-size: 17px;
}
footer button:hover {
  background-color: rgba(255, 255, 255, 0.7);
  border: 1px solid rgba(135, 32, 50, 0.8);
  transition: 0.3s;
}
footer li {
  line-height: 12px;
}
		
		</style>
		<title>Insert title here</title>
		
	</head>
	<body>
		
<nav class="navbar navbar-expand-lg fixed-top" data-0="background-color: rgba(255,255,255,0.8)" data-50="background-color: rgba(255,255,255,0.5)">
  <div class="container-fluid">   <a class="navbar-brand" href="#"> <span>有貓匿 Cat Inside</span></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link">引言 Intro</a></li>
        <li class="nav-item"><a class="nav-link">關於我們 About
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">故事 Story</a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="#">product A</a></li>
                <li><a class="dropdown-item" href="#">product B</a></li>
                <li><a class="dropdown-item" href="#">product C</a></li>
              </ul>
            </li></a></li>
        <li class="nav-item"> <a class="nav-link">聯絡 Contact</a></li>
      </ul>
    </div>
  </div>
</nav>
<section id="section_article">
  <div class="container-fluid justify-content-center">
    <div class="row title justify-content-center">
      <div class="col-md-11">
        <div class="header">
          <p class="tag">精選書摘</p>
          <h1 class="title">解構薇薇安．邁爾的童年餘波：傳奇保母攝影家自拍照之祕，與被忽略的囤積症</h1>
        </div>
      </div>
    </div>
    <div class="row title_img">
      <div class="col-md-12"><img class="main_img" src="https://www.twreporter.org/images/20230920044551-7db78602f44d721d9e8c6d958b6a3c22-desktop.jpg" alt=""/></div>
    </div>
    <div class="row justify-content-center">
      <aside class="col-3">
        <div class="tag">
          <div class="dot">．</div><a class="tagcategory tagcontent" href="">採訪</a>
          <div class="tagcontent">
            <p class="date">2023/09/24</p>
          </div>
          <div class="tagcontent">
            <p class="author">採訪、撰文／張詩芸</p>
            <p class="author">責任編輯／薇薇安</p>
          </div>
          <div class="hashtag"><a href="">#精神疾病</a><a href="">#育兒 </a><a href="">#家庭</a><a href="">#母職</a></div>
        </div>
      </aside>
      <div class="col-6" id="excerpt">
        <p>【導言】</p>
        <p>
           2007年，薇薇安．邁爾（Vivian Maier）的作品在芝加哥租用的倉庫中被人發掘，其拍攝技巧絕佳的影像和神祕的生平讓全世界為之著迷，令人想一探究竟。薇薇安死後聲名鵲起，世人更為她拍攝一部獲奧斯卡金像獎提名的紀錄片<a href="#">《尋秘街拍客》（Finding Vivian Maier）</a>。然而，她在死前深深埋藏自己的過往，就連與她同住的雇主家庭都知之甚少。薇薇安在何處出生、長大？她的父母或手足是誰？是否喜歡與人交遊？她為何攝影？為何不與他人分享照片？</p>
      </div>
      <div class="col-3"></div>
    </div>
    <div class="row justify-content-center">
      <div class="col-3"></div>
      <div class="col-6" id="content">
        <%
		
		String text = new String(request.getParameter("text").getBytes("ISO8859-1"), "UTF-8");

		%>
		<%=text %>
      </div>
      <div class="col-3"> </div>
    </div>
  </div>
</section>
<footer>
  <div class="container">
    <h2>想了解更多？</h2>
    <input class="form-control" placeholder="Email"/>
    <hr/>
    <button>訂閱貓匿</button>
  </div>
  <div class="container-fluid bg-white bg-opacity-75">
    <div class="py-5">
      <div class="row justify-content-center">
        <div class="col-3 text-start">
          <h5 class="border-bottom">關於我們</h5>
          <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link text-muted" href="#">聯絡我們</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">加入我們</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">葡萄紙文化</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">常見問題</a></li>
          </ul>
        </div>
        <div class="col-3 text-start">
          <h5 class="border-bottom">相關資訊</h5>
          <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link text-muted" href="#">捐款訊息</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">服務條款</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">隱私條款</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#">退款政策</a></li>
          </ul>
        </div>
        <div class="col-3 text-start">
          <h5 class="border-bottom">關注我們</h5>
          <ul class="nav d-flex">
            <li class="nav-item"><a class="nav-link link-dark" href="#"><i class="bi-facebook"></i></a></li>
            <li class="nav-item"><a class="nav-link link-dark" href="#"><i class="bi-instagram"></i></a></li>
            <li class="nav-item"><a class="nav-link link-dark" href="#"><i class="bi-youtube"></i></a></li>
          </ul>
        </div>
      </div>
      <div class="d-flex flex-column flex-sm-row border-top justify-content-center py-3 my-3">
        <p>&copy; 2023 葡萄紙文化. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>
		
		
		<script src=""></script>
	</body>
</html>