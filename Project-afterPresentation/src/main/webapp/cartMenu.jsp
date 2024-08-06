<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"></script>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
		<title>Insert title here</title>
	</head>
	<body>
	<div class="dropdown-menu dropdown-menu-right cart-menu" aria-labelledby="dropdownMenuReference" style="max-width: 400px; min-width: 400px; background-color: rgba(255,255,255,0.7)">
      <div class="">
        <table class="table">
          <thead>
            <tr>
              <th scope="col"></th>
              <th scope="col"></th>
              <th scope="col">商品名稱</th>
              
              <th scope="col">數量</th>
              <th scope="col">小計</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in cart">
              <th scope="row" style="width: 20px;">
                <a data-toggle="modal" data-target="#removeModal" href="#">
                <i class="fas fa-trash-alt" style="width: 20px;"></i>
                </a>
              </th>
              <td><img class="cartMenuImg" :src="'images/'+item.img" style="width: 80px"/></td>
              <td style="font-size: 13px;">{{item.name}}</td>
              <td style="width: 50px;">{{item.count}}</td>
              <td class="text-right" style="width: 50px;">{{item.price}}</td>
            </tr>
          </tbody>
        </table>
        <a href="cart.jsp" class="btn btn-primary btn-block"> 結帳去</a>
      </div>  
    </div>
		
		<script>
		
		</script>
	</body>
</html>