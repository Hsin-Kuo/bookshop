<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="">

		<title>Insert title here</title>
		
	</head>
	<body>
	<%
		if(request.getParameter("error")!=null){
		String status = (String) request.getParameter("error");
		if(status.equals("wrong_pswd")){
			out.print("<h3>您輸入的帳號或密碼有誤，請重新登入!</h3>");
		}
		}
	%>
		<form action="checkLogin" style="text-align: center">
     	<fieldset>
	     	<legend>登入</legend>
	     	<label>帳號:</label>
	     	<input type="text" name="id" required>
	     	<br><br>
	     	<label>密碼:</label>
	     	<input type="password" name="pswd" required>
	     	<br><br>
	     	<div>
	     	<input type="submit" value="登入" class="btnlogin">
	     	<a href="joinMember.jsp"><button type="button" class="btnlogin">註冊帳號</button></a>
	     	<a href="javascript:history.go(-1)"><button type="button" class="btnlogin">返回</button></a>
     	</div>
     	</fieldset>
     	</form>
		
		<script src=""></script>
	</body>
</html>