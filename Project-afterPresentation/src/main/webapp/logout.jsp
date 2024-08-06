<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="1;url=showAllProduct.jsp">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
</head>
<body>
<%
session.removeAttribute("memberId");
session.removeAttribute("cartJson");
session.removeAttribute("checkoutInfo");
session.removeAttribute("pswd");
session.removeAttribute("userName");
%>
登出中...

<script>


</script>

</body>
</html>