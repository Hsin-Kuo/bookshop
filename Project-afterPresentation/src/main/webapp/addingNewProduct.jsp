<%@ page contentType="text/html;charset=UTF-8"%>	
<%@ page import="java.io.*,java.util.*,java.sql.*" %>


<!DOCTYPE html>
<html lang="zh-tw">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
		crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css"
		crossorigin="anonymous">
	<link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/css/fileinput.min.css" media="all"
		rel="stylesheet" type="text/css" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/js/plugins/buffer.min.js"
		type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/js/plugins/filetype.min.js"
		type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/js/plugins/piexif.min.js"
		type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/js/plugins/sortable.min.js"
		type="text/javascript"></script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.2/js/fileinput.min.js"></script>
	<script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/locales/zh-TW.js"></script>


	<!--
<script src="js/fileinput.min.js"></script>
<link rel="stylesheet"	href="css/fileinput.min.css">
<script src="js/zh-TW.js"></script>


 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>

	<!-- 
 -->
	<style>
		*{
			position: relative;
		}
		.uploadImage {
			width: 200px;
			display: inline-block;
			border: 1px solid lightgray;
			padding: 5px;	
			margin-right: 5px;
			
		}
		.imgArea{
			border: 1px solid lightgray;
			display: inline-block;
			padding: 10px;
		}
		
		.imgArea::before{
			content: "(拖曳以改變順序)";
			display: block;
			color: darkgray;
		}
		.imgFrame{
			width: 188px;
			height: 275px;
			display: flex;
			align-items: center;
			overflow: hidden;
			border: 1px solid lightgray;
		}
	</style>
	<title>Insert title here</title>

</head>

<body>
	<div id="app">
		<h2>新增商品</h2>
		<h4>{{productId}} - {{productName}}</h4>
		<form action="addNewProduct" method="post">
			<label>書號/商品編號</label>
			<input type="text" v-model="productId" name="productId" required/><br/>
			<label>書名</label>
			<input type="text" v-model="productName" name="productName" required/><br/>
			<label>作者</label>
			<input type="text" name="author" required/>
			<br>
			<div class="imgArea" v-if="jsonResponse.length>0">
				<div v-for="(json, index) in jsonResponse" class="uploadImage" draggable="true" @dragstart="dragStart($event, index)" @dragover="allowDrop" 
			    @drop="drop($event, index)" @dragend="dragEnd"
			    v-bind:key="index">
					<div class="imgFrame" v-html="json.img"></div>
					<p v-model="json.order">{{index+1}}</p>
					<input type="text" :name="'img'+(index+1)" :value="json.imgName">
				</div>
			</div>
			<br>
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
				上傳圖片
			</button>
		
			<br>
			<br>
			<label>出版社</label>
			<input type="text" name="publisher" required/><br/>
			<label>出版日期</label>
			<input type="date" name="publicationDate" required/><br/>
			<label>定價</label>
			<input type="number" name="price" v-model="price" required/><br/>
			<label for="valuedPrice">優惠價</label>
			<input type="number" v-model="discount" name="valuedPrice" min="0" :max="price"/>
			<span > 約 {{parseInt(discount/price*100)}}折</span>
			<br>
			<label>書籍類型</label>
			<input type="radio" value="paperBook" name="bookCate" required/>
			<label for="paperBook">實體書</label>
			<input type="radio" value="eBook" name="bookCate" required/>
			<label for="eBook">電子書</label><br/>
			<label>內容簡介</label>
			<textarea name="introduction"></textarea><br/>
			<label>作者介紹</label>
			<textarea name="aboutAuthor"></textarea><br/>
			<label>詳細資料</label>
			<textarea name="info"></textarea><br/>
			<input type="submit" value="新增"/>
  
		</form>

<!-- 互動上傳視窗 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">上傳圖片</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="file" name="fileUploader" id="txt_file" multiple class="file-loading" />
					</div>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
						@click="refresh">
						完成
					</button>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var test = [];
		var imgName = [];

		var vm = new Vue({
			el: '#app',
			data: {
				jsonResponse: [
				],
				productId: "",
				productName: "",
				discounts: "",
				discount: 0,
				price: null
			},
			methods: {
				refresh: function () {
					for (let i = 0; i < test.length; i++) {
						this.jsonResponse.push({img: test[i],imgName: imgName[i], order: i});
					}

				},
				allowDrop(e) {//取消默認行為
					e.preventDefault();
				},
				dragStart(e, index) {//拖曳開始
					let tar = e.target;
					e.dataTransfer.setData('img', index);
					if (tar.tagName.toLowerCase() == 'li') {
						// console.log('drag start')
						// console.log('drag Index: ' + index)
					}
				},
				drop(e, index) {//放置
					this.allowDrop(e);
					let arr = this.jsonResponse.concat([]),
						dragIndex = e.dataTransfer.getData('img');
					let temp = arr.splice(dragIndex, 1);
					arr.splice(index, 0, temp[0]);
					this.jsonResponse = arr;

					//↓改正lists資料的sort
					for (let i = 0; i < this.jsonResponse.length; i++) {
						this.jsonResponse[i].order = i + 1;
					}
				},
				dragEnd() {//放置結束
					console.log("dragEnd");
				},
			}
		});

		$(function () {
			//0.初始化fileinput
			var oFileInput = new FileInput();
			oFileInput.Init("txt_file", "/api/OrderApi/ImportOrder");
		});

		//初始化fileinput
		var FileInput = function () {
			var oFile = new Object();
			//初始化fileinput控件（第一次初始化）
			oFile.Init = function (ctrlName, uploadUrl) {
				var control = $('#' + ctrlName);
				//初始化上传控件的样式

				control
					.fileinput({
						language: 'zh-TW', //设置语言
						uploadUrl: 'imageProcess3', //上传的地址
						allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
						showUpload: true, //是否显示上传按钮
						showCaption: false,//是否显示标题
						browseClass: "btn btn-primary", //按钮样式     

						//dropZoneEnabled: false,//是否显示拖拽区域
						//minImageWidth: 50, //图片的最小宽度
						//minImageHeight: 50,//图片的最小高度
						//maxImageWidth: 1000,//图片的最大宽度
						//maxImageHeight: 1000,//图片的最大高度
						//maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
						//minFileCount: 0,

						maxFileCount: 10, //表示允许同时上传的最大文件个数
						enctype: 'multipart/form-data',
						validateInitialCount: true,
						previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
						msgFilesTooMany: "选择上传的文件数量{n} 超过允许的最大数值{m}！",
						uploadExtraData: function () {
							var extraData = {
								//傳送商品id到後端
								productID: $('#inputID').val()
							};
							return extraData;
						}

					});

				$("#txt_file").on("fileuploaded",
					function (event, data) {
						$("#myModal").modal("hide");
						//alert( JSON.stringify(data));
						//var data = data.response.lstOrderImport;
						test = data.response.initialPreview;
						imgName = data.response.fileNames;
						//alert("JSON = " + JSON.stringify(test));
						//alert("JSON = " + JSON.stringify(data));


						var oTable = new TableInit();

						oTable.Init(data);

						$("#div_startimport").show();


					});

			}

			return oFile;

		};
	</script>
</body>

</html>