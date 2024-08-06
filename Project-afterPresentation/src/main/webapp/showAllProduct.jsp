<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb"%>


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
<style>
* {
	font-family: 微軟正黑體;
	position: relative;
}


.bookContent {
	width: 960px;
	margin-left: auto;
	margin-right: auto;
	padding: 30px
}

body {
	padding: 20px;
  	background-color: #f0e8e6;
}

.book {
	display: inline-block;
	padding: 10px;
	text-align: center;
	width: 170px;
	border: 1px solid #bbb;
}

.book a {
	color: #555;
}

.book .img {
	width: 100%;
	overflow: hidden;
}

.book .img img {
	width: 100%;
	transform: scale(0.9, 0.9);
}

.book .img img:hover {
	transform: scale(1, 1);
	transition: 1s;
}

.book .red {
	font-weight: 900;
	color: #d93800;
}

.book .author, .book .price, .book .date, .book .publish, .book .intro {
	font-weight: normal;
	margin: 0;
	font-size: 14px;
	color: #555;
}

.book .author, .book .price, .book .publish, .book .date {
	margin-top: 5px;
}

.book .name {
	margin: 0;
	font-size: 18px;
	color: #222;
	height: 50px;
	vertical-align: middle;
}

.book.detail {
	display: block;
	width: 95%;
	text-align: left;
	padding: 10px;
}

.book.detail .img {
	width: initial;
	height: 250px;
	display: inline-block;
}

.book.detail .img img {
	width: initial;
	height: 100%;
}

.book.detail .infos {
	display: inline-block;
	width: calc(100% - 250px - 20px);
	vertical-align: top;
}

.book.detail .intro {
	margin-top: 10px;
}

.book.detail .intro a {
	color: #5060F0;
}

.big {
	width: 280px;
	height: 400px;
	vertical-align: top;
}

.big img {
	margin-top: 5px;
}

.detail.big {
	height: initial;
}
</style>

<title>Insert title here</title>
<%!int pageNum = 1;%>
</head>
<body>

	<div id="app">
	<jsp:include page="navbar.jsp" />
	<div class="main-content">
		
		<div class="bookContent">
			<label> <input type="radio" v-model="mode_detail"
				value="detail" />&emsp;&emsp;&emsp;<i class="fa-solid fa-list-ul"></i>
			</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label> <input type="radio" v-model="mode_detail"
				value="simple" />&emsp;&emsp;&emsp;<i class="fa-solid fa-table-cells"></i>
			</label>
			
			<label style="position: absolute; right: 8%;">每頁顯示 <select id="itemsPerPage" v-model="itemsPerPage">
				<option value="5">5</option>
				<option value="10">10</option>
				<option value="20">20</option>
			</select>
			筆
			</label>
			<br /> 
			<div class="book" v-for="book in books" :class="mode_detail">
				<div class="img">
					<a :href="'showProduct.jsp?productId=\''+book.productId+'\''"><img :src="'images/'+book.img" /></a>
				</div>
				<div class="infos">
					<h2 class="name">
						<a :href="'showProduct.jsp?productId=\''+book.productId+'\''">{{mode_detail==='detail'?book.name:book.name.substring(0,15)}}</a>
					</h2>
					<h4 class="author">
						作者： <a href="#">{{book.author}}</a>
					</h4>
					<h4 class="publish" v-if="mode_detail==='detail'">
						出版社： <a href="#">{{book.publisher}}</a>
					</h4>
					<h4 class="price">
						價錢： <span class="red">{{parseInt(book.valuedPrice/book.price*100)}}</span><span>折
						</span><span class="red">{{book.valuedPrice}}</span><span>元</span>
					</h4>
					<h4 class="date" v-if="mode_detail==='detail'">
						出版日期： <a href="#">{{book.date}}</a>
					</h4>
					<p class="intro" v-if="mode_detail==='detail'">
						{{book.introduction.substring(0,200)}}...... <span><a
							:href="'showProduct.jsp?productId=\''+book.productId+'\''">read
								more</a></span>
					</p>
				</div>
			</div>
		</div>
		<div style="display: flex; justify-content: center; flex-wrap: wrap;">
			<p>
				第<%=pageNum%>頁，共{{totalPage}} 頁
			</p>

			<button id="firstPage">第一頁</button>
			&emsp;
			<button id="prevPage">上一頁</button>
			&emsp;
			<button id="nextPage">下一頁</button>
			&emsp;
			<button id="lastPage">最後一頁</button>
			&emsp; <br>
			<span> 前往</span> <input type="text" name="pageNum" size="2"><span>
				頁</span> <a id="anyPage"><button>顯示</button></a>
		</div>
	</div>
<jsp:include page="footer.jsp" />
</div>
	<%
	String memberId = (String) session.getAttribute("memberId");
	%>
	<script type="text/javascript">
		var memberId = '<%=memberId%>'
		$(document).ready(function() {
		    
			
		    // 換頁按鈕的點擊事件
		    $("#firstPage").click(function() {
		    	vm.currentPage=1;
		        fetchProducts();
		    });
		    $("#prevPage").click(function() {
		        if (vm.currentPage > 1) {
		        	vm.currentPage--;
		            fetchProducts();
		        }
		    });

		    $("#nextPage").click(function() {
		    	if (vm.currentPage < vm.totalPage){
		    		vm.currentPage++;
		        fetchProducts();}
		    });
		    
		    $("#lastPage").click(function() {
		    	vm.currentPage= vm.totalPage;
		        fetchProducts();
		    });
		    
		    $("#anyPage").click(function() {
		    	var pageNum = $("#pageNum").val();
		    	if(pageNum<=vm.totalPage){
		    		vm.currentPage=pageNum; 
		    	}else{
		    		vm.currentPage=vm.totalPage;
		    	}
		    	fetchProducts();
		        
		    });
		    $("#itemsPerPage").on('change', function() {
		    	fetchProducts();
		    });	   
		    
		    
		    //似乎兩個才能生效
		    $(document).on('click', '#cart', function() {
		    	opencart();
		    	$('.cart-menu').addClass('show');
		    });	    
		    $("#cart").click(function(){
		    	openCart();
		    	$('.cart-menu').addClass('show');
	    	});
		    
		    $(document).on('click', function (e) {
	            if (!$(e.target).closest('.cart-menu, #addCart').length) {
	                $('.cart-menu').removeClass('show');
	            }
	        });

		    // 初始載入頁面
		    fetchProducts();
		    openCart();

		    // AJAX 請求獲取商品數據
		    function fetchProducts() {
		        $.ajax({
		            type: "GET",
		            url: "productPageChange",
		            data: { page: vm.currentPage,
		            	itemsPerPage: vm.itemsPerPage},
		            success: function(data) {
		                // 更新商品容器的內容
		                vm.books = data.bookdatas;
		                vm.totalPage = data.totalPage;
		                //alert("JSON = " + JSON.stringify(data));
		            },
		            error: function(error) {

		            	alert("error"+error);
		                console.log("Error:", error);
		            }
		        });
		    }

		});
	    function openCart() {
	    	$.ajax({
				type: "GET",
	            url: "checkCart", 
	            data: null,
	            success: function(data) {

	                // 更新商品容器的內容
	                vm.cart = data;
	               // $('.cart-menu').addClass('show');
	                //alert("JSON = " + JSON.stringify(data));
	            },
	            error: function(error) {
	            	//$('.cart-menu').addClass('show');
	            	//alert("openCart_error"+error);
	                console.log("Error:"+ JSON.stringify(error));
	            }
				
			});
	    }
	    

		
		
		var vm = new Vue({
			
			el: "#app",
				data: {
					books: [],
					mode_detail: "detail",
					cart: [],
					memberId: memberId,
					totalPage: 0,
					currentPage: 1,
					itemsPerPage: 5
					
				}
			});
		</script>
</body>
</html>