<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

		<title>Insert title here</title>
		<style>
		.table{
			width: 800px;
		}
		td{
		width: 200px;
		}
		.cartImg{
		width: 120px;
		}
		}
		.table th.click {
		  cursor: pointer;
		}
		
		.icon {
		  display: inline-block;
		}
		.icon.inverse {
		  transform: rotate(180deg)
		}
		
		</style>
		
	</head>
	<body>
	
	<div id="app">
	  <table class="table">
	    <thead>
	      <tr>
	        <th>品名  </th>       	
	        <th>  </th>   
	        <th class="click" @click="th='price', arrange=0">價格 
	          <!-- isReverse 為反轉 className -->
	          <span class="icon" :class="{'inverse': isReverse}" v-if="th==='price'">
	            <i class=" fas fa-angle-up text-success"></i>
	          </span>
	        </th>
	        <th class="click" @click="th='count', arrange=0">數量
						<span class="icon" :class="{'inverse': isReverse}" v-show="sortBy==='count'">
	            <i class=" fas fa-angle-up text-success" ></i>
	          </span>
	        </th> 
	      </tr>
	      <tr v-for="item in sortForm">
	        <td>{{ item.name }}</td>
	        <td><img class="cartImg" :src="'images/'+item.img"/></td>
	        <td>{{ item.price }}</td>
	        <td>{{ item.count }}</td>
	      </tr>
	      <tr>
	      <td></td>
	        <td></td>
	        <td>總價</td>
	        <td>{{ totalPrice }}</td>
	        </tr>
	    </thead>
	  </table>
	
	
	<a><button @click="readyToCheckOut=true">結帳</button></a>
	
	<form action="checkoutCheck" method="post" v-show="readyToCheckOut">
	    <h3>運送方式</h3>
	    <select id="shippingMethod" name="shippingMethod" v-model="shippingMethod" required>
	        <option value="homeDelivery">宅配</option>
	        <option value="7-11">7-11 店到店</option>
	    </select>
		<br>
	    <label for="address" v-show="shippingMethod=='homeDelivery'">地址：</label>
	    <input type="text" id="address" name="address" :required="shippingMethod=='homeDelivery'"  v-show="shippingMethod=='homeDelivery'"><br>
	    <label for="phoneNumber">電話：</label>
	    <input type="tel" id="phoneNumber" name="phoneNumber" required>
	
	    <h3>付款方式</h3>
	    <select id="paymentMethod" name="paymentMethod" required>
	        <option value="creditCard">信用卡</option>
	        <option value="cashOnDelivery">貨到付款</option>
	        <option value="bankTransfer">ATM轉帳</option>
	        <option value="linePay">Line Pay</option>
	    </select>
		<br>
		<input type="hidden" v-model="JSON.stringify(cart)" name="cart">
		<input type="hidden" v-model="totalPrice" name="total">
    <button type="submit">確認金額並付款</button>
	
	</form>
</div>
		
		<script>
		var app = new Vue({
			  el: '#app',
			  data: {
					sortBy: '',
					th: '',
					isReverse: false,
					arrange: 0,
					cart: [],
					shippingMethod: "7-11",
					readyToCheckOut: false
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
					return vm.cart.sort(function (a, b) {


			  return (a[vm.sortBy]-b[vm.sortBy]) * vm.arrange;
			})
				},
				totalPrice: function(){
					var total = 0;
					for(var item of this.cart){
						total += parseInt(item.price)*parseInt(item.count);
					}
					return total;
					
				}
				}
			});
		
		$(document).ready(function() {

		    // 載入資料
		    getCart();

		    function getCart(){
				$.ajax({
					type: "GET",
		            url: "checkCart", 
		            data: null,
		            success: function(data) {
		            	//alert("success");
		            	//alert("JSON = " + JSON.stringify(data));
		                // 更新商品容器的內容
		                app.cart = data;
		                //$('.cart-menu').addClass('show');
		                
		            },
		            error: function(error) {

		            	alert("addCart_error"+error);
		                console.log("Error:"+ error);
		            }
					
				});
			}

		});
		</script>
	</body>
</html>