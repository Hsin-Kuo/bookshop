<%@ page contentType="text/html;charset=utf-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css"
		crossorigin="anonymous">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>

		<title>Insert title here</title>
		
	</head>
	<body>
	<div id="app">
	<form action="addNewMember" method="post">
		<label>信箱(帳號)</label>
		<input type="email" name="email" required/><br/>
		<label>密碼</label>
		<input type="password" name="pswd" v-model="Pswd" required/><br/>
		<label>請再輸入一次密碼</label>
		<input type="password" v-model="confirmPswd" required/><span v-if="Pswd !== confirmPswd">兩次密碼不一致</span><br/>
		<label>姓</label>
		<input type="text" name="familyName" required/>
		<label>名</label>
		<input type="text" name="name" required/><br/>
		<label>生日</label>
		<input type="date" name="birth" required/><br/>
		<label>手機</label>
		<input type="tel" name="mobile" pattern="09[0-9]{8}" required/><br/>
		<label>地址(選填)</label>
		<input type="text" name="address"/><br/>
		<label>是否願意接收我們的電子報</label>
		<input type="checkbox" name="getNews"/><br/>
		
		<input type="submit" value="註冊" class="btnlogin" v-if="Pswd === confirmPswd">
	     <input type="reset" value="重填" class="btnlogin">
	</form>
		</div>
		<script>
		var vm = new Vue({
			el: '#app',
			data: {
				Pswd: "123",
				confirmPswd: "456"

			}
			});
		
		</script>
	</body>
</html>