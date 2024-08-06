<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/userEndCSS.css">
<style>
#app {
	width: 960px;
	position: relative;
	height: 600px;
	margin-left: auto;
	margin-right: auto;
	top: 150px;
}

.fa-lg {
	font-size: 1em;
}

.fa {
	position: relative;
	display: table-cell;
	width: 55px;
	height: 36px;
	text-align: center;
	top: 12px;
	font-size: 20px;
}

.main-menu:hover, nav.main-menu.expanded {
	width: 250px;
	overflow: hidden;
	opacity: 1;
}

.main-menu {
	background: #F7F7F7;
	position: absolute;
	top: 0;
	bottom: 0;
	height: 100%;
	left: 0;
	width: 55px;
	overflow: hidden;
	-webkit-transition: width .2s linear;
	transition: width .2s linear;
	-webkit-transform: translateZ(0) scale(1, 1);
	box-shadow: 1px 0 15px rgba(0, 0, 0, 0.07);
	opacity: 1;
}

.main-menu>ul {
	margin: 7px 0;
}

.main-menu li {
	position: relative;
	display: block;
	width: 250px;
}

.main-menu li>a {
	position: relative;
	width: 255px;
	display: table;
	border-collapse: collapse;
	border-spacing: 0;
	color: #8a8a8a;
	font-size: 13px;
	text-decoration: none;
	-webkit-transform: translateZ(0) scale(1, 1);
	-webkit-transition: all .14s linear;
	transition: all .14s linear;
	font-family: 'Strait', sans-serif;
	border-top: 1px solid #f2f2f2;
	text-shadow: 1px 1px 1px #fff;
}

.main-menu .nav-icon {
	position: relative;
	display: table-cell;
	width: 55px;
	height: 36px;
	text-align: center;
	vertical-align: middle;
	font-size: 18px;
}

.main-menu .nav-text {
	position: relative;
	display: table-cell;
	vertical-align: middle;
	width: 190px;
	font-family: 'Titillium Web', sans-serif;
}

/* Logo Hover Property */
a:hover, a:focus {
	text-decoration: none;
	border-left: 0px solid #F7F7F7;
}

.main-menu {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-o-user-select: none;
	user-select: none;
}

.main-menu ul, .main-menu li {
	outline: 0;
	margin: 0;
	padding: 0;
	text-transform: uppercase;
}

/* Darker element side menu Start*/
.darkerli {
	background-color: #ededed;
	text-transform: capitalize;
}

.darkerlishadow {
	background-color: #ededed;
	text-transform: capitalize;
	-webkit-box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
	-moz-box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
	box-shadow: inset 0px 5px 5px -4px rgba(50, 50, 50, 0.55);
}

.darkerlishadowdown {
	background-color: #ededed;
	text-transform: capitalize;
	-webkit-box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
	-moz-box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
	box-shadow: inset 0px -4px 5px -4px rgba(50, 50, 50, 0.55);
}

/* Darker element side menu End*/
.main-menu li:hover>a, nav.main-menu li.active>a, .dropdown-menu>li>a:hover,
	.dropdown-menu>li>a:focus, .dropdown-menu>.active>a, .dropdown-menu>.active>a:hover,
	.dropdown-menu>.active>a:focus, .no-touch .dashboard-page nav.dashboard-menu ul li:hover a,
	.dashboard-page nav.dashboard-menu ul li.active a {
	color: #fff;
	background-color: #00bbbb;
	text-shadow: 0px 0px 0px;
}

.area {
	float: left;
	background: #e2e2e2;
	width: 100%;
	height: 100%;
}

.memberMain{
	margin-left: 100px;
	}
	
.icon .inverse {
		  transform: rotate(180deg);
		}
</style>
</head>
<body>
	<div id="app">
		<jsp:include page="adminNavbar.jsp"/>

		
		
	</div>
	<%
	String memberId = (String) session.getAttribute("memberId");
	%>
	<script type="text/javascript">
		var memberId = "<%=memberId%>";
		$(document).ready(function() {

			$("#test").click(function() {
				$('.main-menu').css('overflow: initial');
				
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

			$(document).on('click', function(e) {
				if (!$(e.target).closest('.cart-menu').length) {
					$('.cart-menu').removeClass('show');
				}
			});

			// 初始載入頁面
			openCart();

			function openCart() {
				$.ajax({
					type : "GET",
					url : "checkCart",
					data : null,
					success : function(data) {

						// 更新商品容器的內容
						vm.cart = data;
						// $('.cart-menu').addClass('show');
						//alert("JSON = " + JSON.stringify(data));
					},
					error : function(error) {
						//$('.cart-menu').addClass('show');
						//alert("openCart_error"+error);
						console.log("Error:" + JSON.stringify(error));
					}

				});
			}
			
		});

		var vm = new Vue({

			el : "#app",
			data : {
				cart : [],
				memberId : memberId,
				subpage: 'memberMain',
				orders: [],
				orderId: "",
				orderdetail: [],
				sortBy: '',
				th: '',
				isReverse: false,
				arrange: 0,
			},
			methods: {
			  getHistory() {
				    axios.get('orderHistory')
				      .then(response => {
				        this.orders = response.data;
				        //alert("JSON = " + JSON.stringify(response.data));
				        this.subpage = 'history';
				      })
				      .catch(error => {
				        console.error('Error:', error);
				      });
			  },
			  getDetail(id) {
				  // 定義要傳送的資料
				  const requestData = {
				    orderId: id
				  };

				  // 使用 axios.post 傳送 POST 請求
				  axios.post('orderDetail', requestData)
				    .then(response => {
				      // 在這裡處理後端回傳的資料
				      this.orderdetail = response.data;
				    //alert("JSON = " + JSON.stringify(response.data));
				      this.orderId = id;
				    })
				    .catch(error => {
				      console.error('Error:', error);
				    });
				}
			},
			computed: {
				sortForm: function(){
					var vm = this;
					vm.arrange=1;
					if(vm.th!=vm.sortBy||vm.isReverse){
						vm.arrange=1;
						vm.isReverse=false;
						// vm.th=vm.sortBy;
						// vm.sortBy=vm.th;
					}else{
						vm.arrange=-1;
						vm.isReverse=true;
					}
					vm.sortBy=vm.th;
					return vm.orders.sort(function (a, b) {
	
	
					  return (a[vm.sortBy]-b[vm.sortBy]) * vm.arrange;
					})
			}
			}
		});
	</script>
</body>
</html>