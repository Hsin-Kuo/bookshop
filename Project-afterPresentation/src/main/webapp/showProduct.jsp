<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

		<title>Insert title here</title>
		<style>
		* {
  position: relative;
}

.container_main {
  width: 960px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 100px
}

.imgFrame, .briefInfo {
  display: inline-block;
  vertical-align: top;
}

.imgFrame {
  width: 348px;
  display: inline-block;
}

.imgFrame img{
  width: 60%;
  left: 20%;
}

.briefInfo {
  width: 390px;
  display: inline-block;
}
.briefInfo .title {
  font-size: 18px;
  font-weight: 700;
}
.briefInfo .hl_red {
  color: red;
  font-weight: 900;
}
.briefInfo .delete_line {
  text-decoration-line: line-through;
}

.briefInfo div, hr {
  margin-bottom: 10px;
}

.infoNav {
  font-size: 18px;
  border: 1px solid #000;
}

.arrow{
	position: absolute;
  top: 50%;
  transform: translateY(-50%);
  font-size: 80px;
  color: #666;
  cursor: pointer;
  user-select: none;
}
#arrowRight{
right: 0;
}

#introduction, #aboutAuthor, #info{
	font-size: 1.2em;
	font-weight: 600;
	color: #ad7744;
	margin: 5px 0px;
}
.infoNav{
	padding: 5px 10px;
	display: inline-block;
}
.infoNav a{
	padding: 0px 20px;
	text-decoration: none;
} 


		</style>
	</head>
	<body>
		
<div id="app">

<jsp:include page="navbar.jsp"/>

  <div class="container container_main" style="width: 960px;  margin-left: auto; margin-right: auto;" >
    <div class="productBriefInfo_top">
      <div class="imgFrame"><img :src="'images/'+img[curNum]" data-bs-toggle="modal" data-bs-target="#exampleModal"/>
      <p v-show="curNum!=0" id="arrowLeft" class="arrow" @click="curNum--">〈</p>
      <p v-show="curNum!=imgNum" id="arrowRight" class="arrow" @click="curNum++">〉</p>
      <i class="fa-solid fa-circle-plus" style="position: absolute;
  bottom: 0%; right: 10%;
  font-size: 20px;
  color: #bbb;
  cursor: pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal"></i>
      </div>
      <div class="briefInfo">
        <div class="title">{{bookdata.name}}</div>
        <hr/>
        <div class="author">作者： {{bookdata.author}}</div>
        <div class="publisher">出版社：{{bookdata.publisher}}</div>
        <div class="publishDate">出版日期：{{bookdata.publishDate}}</div>
        <div class="price">定價：<span :class="bookdata.valuedPrice != ''?'delete_line':''">{{bookdata.price}}</span></div>
        <div class="valuedPrice" v-if="bookdata.valuedPrice != ''">優惠價：<span class="hl_red">{{parseInt(bookdata.valuedPrice/bookdata.price*100)}}</span><span>折 </span><span class="hl_red">{{bookdata.valuedPrice}}</span><span>元</span></div>
        <div class="bookCate">書籍類型：{{bookdata.bookCate == 'book'?'實體書':'電子書'}}</div>
        <hr/>
        <div class="purchase">
        	<a><button>收藏</button></a>
        	<button id="addCart">加入購物車</button>
            <button id="buyNow">直接購買</button></div>
      </div>
    </div>
    
    <div class="detailInfo"  style="margin-top: 30px;">
      <div class="infoNav"><a href="#introduction">內容簡介</a>|<a href="#aboutAuthor">作者介紹</a>|<a href="#info">詳細資料</a></div>
      <div><p id="introduction">內容簡介</p>
        <p>{{bookdata.introduction}}</p>
      </div>
      <div><p id="aboutAuthor">作者介紹</p>
        <p>{{bookdata.aboutAuthor}}</p>
      </div>
      <div><p id="info">詳細資料</p>
        <p>{{bookdata.info}}</p>
      </div>
    </div>
  </div>
  		<!--互動視窗-->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div >
							<img :src="'images/'+img[curNum]" style="width: 100%;"/>
							<p v-show="curNum!=0" id="arrowLeft" class="arrow" @click="curNum--">〈</p>
							<p v-show="curNum!=imgNum" id="arrowRight" class="arrow" @click="curNum++">〉</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		
</div>
<%
	String memberId = (String) session.getAttribute("memberId");
	%>
		<script>
		var memberId = '<%=memberId%>'
		var vm = new Vue({
			
			el: "#app",
				data: {
					bookdata: [],
					cart: [],
					img: [],
					imgNum: 0,
					curNum:0, 
					memberId: memberId
				}
			});
		var productId=<%= request.getParameter("productId") %>;
		
		
		$(document).ready(function() {

		    $(document).on('click', function (e) {
	            if (!$(e.target).closest('.cart-menu, #addCart').length) {
	                $('.cart-menu').removeClass('show');
	            }
	        });
		    $(document).on('click', '#cart', function() {
		    	opencart();
		    	$('.cart-menu').addClass('show');
		    });
		    
		    $("#addCart").click(function(){
					addToCart(productId);
		    });
		    $("#buyNow").click(function(){
				addToCart(productId);
				window.location.href = "cart.jsp"
	    	});
	    
		    
		    $("#cart").click(function(){
		    	openCart();
		    	$('.cart-menu').addClass('show');
	    	});


		    // 初始載入頁面
		    fetchProduct();
		    openCart();

		    // AJAX 請求獲取商品數據
		    function fetchProduct() {
		        $.ajax({
		            type: "GET",
		            url: "showProduct",  // 替換為實際的 Servlet URL
		            data: { productId: productId},
		            success: function(data) {
		                // 更新商品容器的內容
		                vm.bookdata = data;
		                vm.img = data.img.split(',');
		                vm.imgNum = vm.img.length-2;
		                //alert("JSON = " + JSON.stringify(data));
		            },
		            error: function(error) {

		            	alert("error"+error);
		                //console.log("Error:", error);
		            }
		        });
		    }

		});
	    function addToCart(id){
			$.ajax({
				type: "GET",
	            url: "addToCart", 
	            data: { productId: id},
	            success: function(data, textStatus, xhr) {

	                // 更新商品容器的內容
	                vm.cart = data;
	                $('.cart-menu').addClass('show');
	                //alert("JSON = " + JSON.stringify(data));
	            },
	            error: function(error) {
	            	//$('.cart-menu').addClass('show');
	            	alert("addCart_error"+error);
	                console.log("Error:"+ JSON.stringify(error));
	            }
				
			});
			
			
		}
	    function openCart() {
	    	$.ajax({
				type: "GET",
	            url: "checkCart", 
	            data: null,
	            success: function(data) {

	                // 更新商品容器的內容
	                vm.cart = data;
	                //$('.cart-menu').addClass('show');
	                //alert("JSON = " + JSON.stringify(data));
	            },
	            error: function(error) {
	            	//$('.cart-menu').addClass('show');
	            	//alert("openCart_error"+error);
	                console.log("Error:"+ JSON.stringify(error));
	            }
				
			});
	    }
		
		
		
		</script>
	</body>
</html>