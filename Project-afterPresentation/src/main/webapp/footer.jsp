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


		<title>Insert title here</title>
	<style>
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
	</head>
	
	<body>
	<footer class="footer">
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