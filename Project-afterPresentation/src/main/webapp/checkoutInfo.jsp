<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="css/userEndCSS.css">
		
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<style>
		.table.checkout_table{
	width: 900px;
	display: inline-block;
}

.table.checkout_table td, th{
	width: 200px;
}
caption{
caption-side: initial;
text-align: center;
}
		</style>
		<title>Insert title here</title>
		
	</head>
	<body>
	
		<div id="app">
	  <table class="table checkout_table" >
	  	<caption>本次購物明細</caption>
	    <thead>
	      <tr>
	        <th>品名  </th>       	
	        <th>價格 
	        </th>
	        <th>數量
	        </th> 
	      </tr>
	      </thead>
	      <tbody>
	      <tr v-for="item in checkInfo.cart">
	        <td>{{ item.name }}</td>
	        <td>{{ item.price }}</td>
	        <td>{{ item.count }}</td>
	      </tr>
	      <tr>
	      <td></td>
	        <td>總價</td>
	        <td>{{ checkInfo.totalPrice }}</td>
	        </tr>
	    </tbody>
	  </table>
	  <p>運送方式： {{checkInfo.shippingMethod}}</p>
	  <p>付款方式： {{checkInfo.paymentMethod}}</p>
	  <a href="paymentImitate.jsp"><button id="justBuyIt">確認無誤，進行付款</button></a> <a href="javascript:history.go(-1)"><button>回到上一頁</button></a>
	  </div>
		<%Object checkInfo = session.getAttribute("checkoutInfo"); %>
		<script>
			var checkInfo = <%=checkInfo%>
			var app = new Vue({
				  el: '#app',
				  data: {
					  checkInfo: checkInfo
				  }
			});
		
		
		</script>
	</body>
</html>