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
		<meta http-equiv="Refresh" content="3;url=paymentComplete">
		<link rel="stylesheet" href="css/userEndCSS.css">
		
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<style>
			body {
			  display: flex;
			  justify-content: center;
			  align-items: center;
			}
			.box {
				margin-top: 200px;
			  height: 100px;
			  width: 100px;
			  border-radius: 50%;
			  border: 3px solid;
			  border-color: orange transparent;
			  animation: spin 1s infinite ease-out;
			}
			p{
			margin-top: 200px;
			margin-left: 50px;
			}
			
			@keyframes spin {
			  0% {
			    transform: rotate(0deg);
			  }
			  100% {
			    transform: rotate(360deg);
			  }
			}		
					
		</style>
		<title>Insert title here</title>
		
	</head>
	<body>		

		<div class="box"></div>
		<br>
  		<p>根據付款方式串接相應金流</p>
  		

		
		
		
		<script src=""></script>
	</body>
</html>