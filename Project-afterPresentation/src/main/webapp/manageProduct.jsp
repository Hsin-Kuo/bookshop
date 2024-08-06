<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page import="JDBC.ConnDb, vo.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="">

		<title>Insert title here</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/userEndCSS.css">
		<style>
			#addNewProduct{
			border: solid 2px #bbb;
			border-radius: 100%;
			position: fixed;
			right: 5%;
			text-align: center;
			width: 50px;
			height: 50px;
			text-decoration: none;
			}
			
			#addNewProduct p{
			font-size: 30px;
			color: #bbb;
			font-weight: bold;
			}
		
		</style>
	</head>
	<body>
		<%
			ArrayList<Product> products=new ArrayList<>();
			String sql="SELECT * FROM product WHERE isDelete = 0";
			Statement stm= new ConnDb().getCon().createStatement();
			ResultSet res=stm.executeQuery(sql);
			while(res.next()) {
				Product product=new Product();
				product.setProductId(res.getString("productId"));
				product.setProductName(res.getString("productName"));
				product.setAuthor(res.getString("author"));
				product.setPublisher(res.getString("publisher"));
				product.setPublicationDate(res.getString("publicationDate"));
				product.setPrice(res.getString("price"));
				product.setValuedPrice(res.getString("valuedPrice"));
				product.setBookCate(res.getString("bookCate"));
				product.setIntroduction(res.getString("introduction"));
				product.setAboutAuthor(res.getString("aboutAuthor"));
				product.setInfo(res.getString("info"));
				product.setImages(res.getString("img").substring(0, res.getString("img").indexOf(',')));
				products.add(product);
				
			}
			pageContext.setAttribute("products", products);
			res.close();
			stm.close();
		%>
		<div id="app">
		<jsp:include page="adminNavbar.jsp"/>
		
		<table class="table" style="margin-left: 10%">
		<tr>
		<th>是否上架</th>
		<th>商品編號</th>
		
		<th></th>
		<th>品名</th>
		</tr>
		<c:forEach var="product" items="${products}" >
		<tr>
			<td><input type="checkbox" id="isLaunch" checked></td>
			<td>${product.productId}</td>   
			<td><img src="images/${product.images}"  height="200"></td>
			<td>${product.productName}</td>         
	       
	        
        </tr>
	    </c:forEach>
		</table>
		<a href="addingNewProduct.jsp" id="addNewProduct">
		<p>+</p>
		新增商品
		</a>
		</div>
		<script></script>
	</body>
</html>