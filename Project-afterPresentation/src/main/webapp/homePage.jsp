<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, JDBC.ConnDb"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap 4 JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/skrollr/0.6.30/skrollr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>

</head>
<style>
* {
	padding: 0;
	position: relative;
	font-family: Noto Sans TC, 微軟正黑體;
}

body, html {
	margin: 0;
	padding: 0;
}

#intro {
	height: 100vh;
	text-align: center;
}

#intro .head {
	top: 35vh;
}

#intro .head h3 {
	margin: auto;
	width: 80%;
	filter: drop-shadow(16px 16px 10px #cccccc);
}

#intro .head hr {
	border: 3px solid #bf7c67;
	width: 10%;
	margin: 30px auto;
	opacity: 0.7;
}

#intro .head p {
	margin: auto;
	max-width: 500px;
	width: 80%;
}

#intro .container-fluid {
	position: absolute;
}

#intro .col-2, #intro .col-12, #intro .col-4 {
	font-size: 0;
	height: 100vh;
	overflow: hidden;
	background-color: transparent;
}

#intro .mask {
	z-index: -1;
	height: 100%;
	background-repeat: cover;
	background-attachment: fixed;
	overflow: hidden;
}

#intro .mask1 {
	background-image:
		url(https://images.unsplash.com/photo-1531816680622-c5f85ede7c12?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmlibGUlMjBwYWdlc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80);
}

#intro .inner {
	position: absolute;
	z-index: 100;
}

#intro .inner1 {
	background-color: rgba(255, 255, 255, 0.4);
	left: 40px;
	top: 330px;
	width: 180px;
	height: 270px;
	box-shadow: #f0e8e6 0 0 0 1017px;
}

#intro .mask2 {
	background-image:
		url(https://pic.52112.com/2021/07/05/22/05225240_f06ed57ae2_small.jpg);
	background-position: 80% 0%;
	top: 0px;
}

#intro .inner2 {
	left: 0px;
	top: 180px;
	width: 30%;
	height: 80vh;
	box-shadow: #f0e8e6 0 0 0 2017px;
	transition: 0.1s;
}

#intro .mask3 {
	background-image:
		url(https://pic.52112.com/2021/07/05/22/05225240_f06ed57ae2_small.jpg);
	background-position: 100% 0%;
}

#intro .inner3 {
	left: 10%;
	top: 60px;
	width: 70%;
	height: 27vh;
	border-radius: 30% 0%;
	box-shadow: #f0e8e6 0 0 0 10050px;
}

#section_quote .container-fluid {
	background-color: #ad7744;
}

#section_quote .quote_pic {
	margin: auto;
}

#section_quote .img {
	margin: auto;
	background-image:
		url(https://static.vecteezy.com/system/resources/previews/006/044/569/original/continuous-line-drawing-of-woman-face-one-line-woman-portrait-free-vector.jpg);
	height: 200px;
	width: 90%;
	background-position: center;
	background-size: 95%;
	mix-blend-mode: multiply;
}

#section_quote .quote {
	margin: 150px 0px;
	padding: 0px 40px 0px 0px;
	color: #ddd;
	font-weight: 50;
	font-size: 25px;
}

#section_quote .quote h2 {
	font-weight: 100;
}

#section_quote .quote .credit {
	margin: 0;
	text-align: right;
}

@media screen and (max-width: 767px) {
	#section_quote .img {
		margin-top: 30px;
		max-height: 150px;
		width: 60%;
	}
	#section_quote .quote {
		margin: 50px 0px;
		font-weight: 50;
		font-size: 20px;
		padding: 0;
	}
	#section_quote .quote h2 {
		font-size: 25px;
	}
}

@media screen and (max-width: 575px) {
	#section_quote .img {
		margin-top: 20px;
		max-height: 150px;
		width: 90%;
	}
	#section_quote .quote {
		margin: 0px 0px 10px 0pc;
		font-weight: 50;
		font-size: 15px;
	}
	#section_quote .quote h2 {
		font-size: 15px;
	}
}

#section_story {
	background-image:
		url(https://t4.ftcdn.net/jpg/03/30/40/37/360_F_330403700_s5sFGxv9oVqCCtYqeQAYPlGzVYifPjT7.jpg);
	background-attachment: fixed;
	height: 1500px;
}

.tag {
	display: none;
	color: #872032;
	z-index: 20;
	overflow: hidden;
	position: fixed;
	background-color: #f0e8e6;
	border: 1px solid #000;
	width: 280px;
	height: 350px;
	border-radius: 10px;
	box-shadow: 3px 5px 6px 3px rgba(0, 0, 0, 0.2);
}

.dot {
	font-size: 50px;
	font-weight: bolder;
	line-height: 40px;
}

.saying {
	font-size: 15px;
	margin: 0px 25px;
	letter-spacing: 2px;
}

.tagname {
	font-weight: bolder;
	text-align: right;
	margin: 15px 25px;
}

.avatar {
	opacity: 0.7;
	position: absolute;
	width: 100%;
	bottom: 0px;
	height: 140px;
	background-repeat: no-repeat;
	background-position: top;
	background-size: cover;
	mix-blend-mode: multiply;
}

.tag1 {
	right: 20%;
}

.tag2 {
	left: 15%;
	top: -10%;
}

.tag3 {
	right: 10%;
	top: 400px;
}

#tag4 {
	left: 5%;
	top: 380px;
}

@media screen and (max-width: 767px) {
	.tag1 {
		right: 5%;
	}
	.tag2 {
		left: 0;
		top: 0%;
	}
}

@media screen and (max-width: 575px) {
	.tag {
		height: 200px;
	}
	.tag2 {
		top: 180px;
	}
	.tag3 {
		top: 360px;
	}
	#tag4 {
		top: 560px;
	}
	.avatar {
		opacity: 0.3;
	}
}

.avatar1 {
	background-image:
		url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9LcMY1ZFAWgwepwrE068oZ5p8i5IR-tFCnt6OOsp4hLBCIUc-NNRCQiRlXtZa__izYUY&usqp=CAU);
}

.avatar3 {
	background-image:
		url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUgz8Y-2jwfsaQWK794j177c0Ho00I_U4IaIZdwm_n3x8bkURKIZUmTT-mTkk9m3xaGiw&usqp=CAU);
}

.avatar2 {
	left: 30%;
	background-image:
		url(https://t4.ftcdn.net/jpg/02/13/56/67/360_F_213566707_epn4nCiweVQvOAZj2LGUzwQKU1C6k60E.jpg);
}

.avatar4 {
	background-image: url(https://img95.699pic.com/xsj/17/gw/ce.jpg!/fh/300);
}

.avatar4 .row {
	position: fixed;
	z-index: 400;
	height: 300px;
	width: 100px;
	border: 1px solid #000;
}

.cat_inside {
	z-index: 50;
	display: none;
	position: fixed;
	border: 1px solid #6e1920;
	width: 50%;
	left: 50%;
	padding: 20px;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.9);
	box-shadow: 3px 10px 8px 5px rgba(0, 0, 0, 0.2);
}

@media screen and (max-width: 575px) {
	.cat_inside {
		width: 80%;
		padding: 15px;
	}
	.cat_inside p {
		font-size: 13px;
	}
}

#section_article {
	padding: 40px 30px;
	background-color: #f0e8e6;
}

#section_article hr {
	border: 1px solid #6e1920;
}

#section_article .card {
	opacity: 0.8;
	background-color: rgba(255, 255, 255, 0.2);
	height: 720px;
	transition: 1s;
}

#section_article .card button {
	left: 100%;
	padding: 3px 15px;
	transform: translateX(-100%);
	color: #872032;
	transition: 1s;
}

#section_article .card button::after {
	display: block;
	content: "";
	border-top: 2px solid #872032;
	transition: 0.3s;
}

#section_article .card img {
	width: 100%;
	transition: 1s;
}

#section_article .card .img_wrap {
	height: 400px;
	overflow: hidden;
	text-align: center;
}

#section_article .card h3 {
	padding: 0 20px;
}

#section_article .card p {
	padding: 20px;
}

#section_article .card p::after {
	background-color: #fff;
}

#section_article .card .multiline-ellipsis {
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 5;
	height: 140px;
	overflow: hidden;
}

#section_article .card:hover {
	opacity: 1;
	transition: 1s;
	background-color: #fff;
}

#section_article .card:hover button {
	color: #fff;
	background-color: #872032;
	transition: 1s;
}

#section_article .card:hover button::after {
	opacity: 0;
}

#section_article .card:hover img {
	transform: scale(1.1);
	transition: 1s;
}

#section_donate {
	height: 200px;
	background-color: #6e1920;
	color: white;
	padding: 0px 15px;
}

#section_donate .cont {
	max-width: 1024px;
	margin-right: auto;
	margin-left: auto;
	top: 50%;
	transform: translateY(-50%);
}

#section_donate h6 {
	font-weight: 100;
	font-size: 14px;
}

#section_donate button {
	top: 50%;
	transform: translateY(-50%);
	background-color: #fff;
	color: #6e1920;
}

#section_about .grape {
	width: 110%;
	left: -10%;
	padding: 70px 0px;
}

#section_about .col-sm-9 {
	padding: 30px 0px;
	text-align: center;
}

#section_about .col-sm-9 h3 {
	padding: 20px;
	font-weight: bold;
	font-size: 30px;
	letter-spacing: 5px;
}

#section_about .col-sm-9 img {
	height: 50px;
}

#section_about .col-sm-9 .faith {
	height: 50px;
	overflow: hidden;
}

#section_about .col-sm-9 .faith img {
	height: 70px;
	top: -7px;
}

#section_about .col-sm-9 p {
	text-align: left;
	padding-top: 7px;
	padding-bottom: 20px;
	letter-spacing: 1.5px;
	line-height: 25px;
}

footer {
	background-image:
		url(https://pic.52112.com/2021/07/05/22/05225240_f06ed57ae2_small.jpg);
	text-align: center;
}

footer .container {
	padding: 30px;
}

footer hr {
	border: 3px solid #bf7c67;
	width: 10%;
	margin: 30px auto;
	opacity: 0.7;
}

footer button {
	background-color: rgba(255, 255, 255, 0.8);
	padding: 7px 25px;
	border-radius: 5px;
	border: 1px solid rgba(135, 32, 50, 0.3);
	color: #872032;
	transition: 0.3s;
	font-size: 17px;
}

footer button:hover {
	background-color: rgba(255, 255, 255, 0.7);
	border: 1px solid rgba(135, 32, 50, 0.8);
	transition: 0.3s;
}

footer li {
	line-height: 12px;
}
</style>
<body>
<div id="app">
<div class="main-content">
	<div class="cat_inside" data-anchor-target="#section_quote"
		data--200-top-bottom="transform: translate(-50%, 300px); opacity: 0; display: block;"
		data--400-top-bottom="transform: translate(-50%, 250px); opacity: 1; display: block;"
		data--600-top-bottom="transform: translate(-50%, 250px); opacity: 1; display: block;"
		data--1200-top-bottom="transform: translate(-50%, -300px); opacity: 0; display: none;">
		<h1>有貓匿?</h1>
		<hr />
		<p>房間裡的大象大到看不清楚，但如果知道屋裡藏著一隻貓，那些習以為常的現象，就開始有了不同的故事。</p>
		<p>人是信仰知識的載體，在神學與見證之間，是活生生的人和他們面對的處境。</p>
		<p>「有貓匿」期待以不同主題的深度訪談，呈現基督徒們的生活經驗，描繪他們需要適應或對抗的挑戰，並解鎖更多種信仰實踐的智慧。</p>
	</div>
	<div class="tag tag1" data-anchor-target="#section_quote"
		data-center-bottom="transform: translate(90px, 0px) rotate(0deg); opacity: 0; display: block;"
		data--50-top-bottom="transform: translate(0px, 60px) rotate(-20deg); opacity: 1; display: block;"
		data--550-top-bottom="transform: translate(0px, 60px) rotate(-20deg); opacity: 1; display: block;"
		data--1050-top-bottom="transform: translate(0px, -200px) rotate(-20deg); opacity: 0; display: none;">
		<div class="dot">．</div>
		<p class="saying">「我朋友說，韭菜不會退奶，讓你退奶的是那些親戚。」</p>
		<p class="tagname">——小魚</p>
		<div class="avatar avatar1"></div>
	</div>
	<div class="tag tag2" data-anchor-target="#section_quote"
		data-center-bottom="transform: translate(-10%, -20px) rotate(-30deg); opacity: 0; display: block;"
		data--50-top-bottom="transform: translate(5%, 250px) rotate(-10deg); opacity: 1; display: block;"
		data--550-top-bottom="transform: translate(5%, 250px) rotate(-10deg); opacity: 1; display: block;"
		data--1050-top-bottom="transform: translate(5%, -200px) rotate(-10deg); opacity: 0; display: none;">
		<div class="dot">．</div>
		<p class="saying">「我現在終於知道，為什麼很多媽媽會帶著自己的小孩去尋死。」</p>
		<p class="tagname">——馥月</p>
		<div class="avatar avatar2"></div>
	</div>
	<div class="tag tag3" data-anchor-target="#section_quote"
		data-250-top-bottom="transform: translate(00px, -20px) rotate(40deg); opacity: 0; display: block;"
		data--50-top-bottom="transform: translate(90px, -100px) rotate(10deg); opacity: 1; display: block;"
		data--550-top-bottom="transform: translate(90px, -100px) rotate(10deg); opacity: 1; display: block;"
		data--1050-top-bottom="transform: translate(90px, -400px) rotate(10deg); opacity: 0; display: none;">
		<div class="dot">．</div>
		<p class="saying">選擇中斷職涯的家樂也無法避免「男主外、女主內」的社會期待，他曾經被教會弟兄在社群媒體羞辱，諷刺他「吃娘家」</p>
		<p class="tagname">——家樂</p>
		<div class="avatar avatar3"></div>
	</div>
	<div class="tag" id="tag4" data-anchor-target="#section_quote"
		data-50-top-bottom="transform: translate(40px, -20px) rotate(-20deg); opacity: 0; display: block;"
		data--100-top-bottom="transform: translate(0px, 30px) rotate(-30deg); opacity: 1; display: block;"
		data--550-top-bottom="transform: translate(0px, 30px) rotate(-30deg); opacity: 1; display: block;"
		data--1050-top-bottom="transform: translate(0px, -400px) rotate(-30deg); opacity: 0; display: none;">
		<div class="dot">．</div>
		<p class="saying">「我打一開始就沒有把『能幹媽媽』成為標準，因為我知道我做盡一切的結果，就是抱怨苦毒。」</p>
		<p class="tagname">——霓凰</p>
		<div class="avatar avatar4"></div>
	</div>

<jsp:include page="navbar.jsp" />
	<header id="intro">
		<div class="container-fluid head">
			<h3 class="display-2 fw-normal">Something Behind</h3>
			<hr />
			<p>For the sake of the vast female community and motherhood, we
				are committed to exploring the subtle states and psychological
				activities among them.</p>
		</div>
		<div class="container-fluid g-0">
			<div class="row g-0">
				<div class="col-2 d-none d-md-block">
					<div class="mask1 mask">
						<div class="inner1 inner"></div>
					</div>
				</div>
				<div class="col-12 col-md-7">
					<div class="mask2 mask">
						<div class="inner2 inner"
							data-0="transform: translate(20%, 0px); height: 200px; width: 60%"
							data-200="transform: translate(30%, 200px); height: 300px; width: 80%"
							data-400="transform: translate(0%, 500px); height: 400px; width: 100%"
							data-700="transform: translate(0%, 900px); height: 200px; width: 100%"></div>
					</div>
				</div>
				<div class="col-3 d-none d-md-block">
					<div class="mask3 mask">
						<div class="inner3 inner"
							data-0="transform: scale(1) translateY(0px)"
							data-200="transform: scale(0.3) translateY(300px)"
							data-400="transform: scale(0.1) translateY(600px)"></div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<section id="section_quote">
		<div class="container-fluid">
			<div class="row">
				<div class="quote_pic col-12 col-md-5">
					<div class="img" data-bottom-top="transform: translateX(-90px)"
						data-center="transform: translateX(0px)"></div>
				</div>
				<div class="col-12 col-md-7">
					<div class="quote"
						data-bottom-top="transform: translateY(-60px); opacity: 0"
						data-center="transform: translateY(0px); opacity: 1">
						<h2>書中的所有細節都是曾經在歷史上發生過的，換句話說，它不是科幻小說。</h2>
						<p class="quote credit">——愛特伍</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section_story">
		<div class="container-fluid tags"></div>
	</section>
	<section id="section_article">
		<div class="container p-5">
			<div class="row">
				<div class="col-sm-12">
					<h1 data-bottom-top="transform: translateY(40px) ; opacity: 0;"
						data-center="transform: translateY(0px); opacity: 1">貓匿文</h1>
					<hr />
				</div>
			</div>
			<div class="row row-cols-xl-3 row-cols-lg-2 row-cols-1 g-3">
				<div class="col">
					<div class="card">
						<div class="img_wrap">
							<img src="https://www.twreporter.org/images/20230920044551-7db78602f44d721d9e8c6d958b6a3c22-desktop.jpg" />
						</div>
						<div class="card-body">
							<h3 class="card-title">解構薇薇安．邁爾的童年餘波</h3>
							<p class="card-text multiline-ellipsis">
								2007年，薇薇安．邁爾（Vivian Maier）的作品在芝加哥租用的倉庫中被人發掘，其拍攝技巧絕佳的影像和神祕的生平讓全世界為之著迷，令人想一探究竟。薇薇安死後聲名鵲起，世人更為她拍攝一部獲奧斯卡金像獎提名的紀錄片《尋秘街拍客》（Finding Vivian Maier）。</p>
							<a href="articlePage1.jsp"><button class="btn">閱讀更多</button></a>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="img_wrap">
							<img src="" />
						</div>
						<div class="card-body">
							<h3 class="card-title">第二篇文章</h3>
							<p class="card-text multiline-ellipsis"></p>
							<button class="btn">閱讀更多</button>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card">
						<div class="img_wrap">
							<img src="" />
						</div>
						<div class="card-body">
							<h3 class="card-title">第三篇文章</h3>
							<p class="card-text multiline-ellipsis"></p>
							<button class="btn">閱讀更多</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section id="section_donate">
		<div class="cont">
			<div class="row">
				<div class="col-md-10">
					<h3>用行動支持有貓匿</h3>
					<h6>深度調查採訪必須投入優秀人力、足夠時間與大量資源。歡迎您成為「《有貓匿》贊助夥伴」，一起為打造更好的社會及信仰環境努力。</h6>
				</div>
				<div class="col-md-2">
					<button class="btn rounded-pill">贊助我們 ></button>
				</div>
			</div>
		</div>
	</section>
	<section id="section_about">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-sm-3 col-6">
					<img class="grape"
						src="https://cdn.store-assets.com/s/1034316/f/9568261.png" alt="" />
				</div>
				<div class="col-sm-9 about">
					<h3>關於葡萄紙文化</h3>
					<hr />
					<div class="row">
						<div class="col-sm-4">
							<img
								src="https://cdn.iconscout.com/icon/free/png-256/free-grapes-185-819264.png"
								alt="" />
							<h4>葡萄</h4>
							<h6 class="px-3">
								聖經經文：「我是葡萄樹，你們是枝子。常在我裡面的，我也常在他裡面，這人就多結果子；因為離了我，你們就不能做什麼。」<br>
								<br>另一方面「葡萄」也是紀念曾在淡江大學存在多年的「葡萄團契」。
							</h6>
						</div>
						<div class="col-sm-4">
							<img
								src="https://t3.ftcdn.net/jpg/04/64/01/56/360_F_464015658_3rW8SnWYDRQRIt9v5SphgAf0Ap7JpP4r.jpg" />
							<h4>紙</h4>
							<p class="px-3">「紙」則是強調文字工作的重要與傳承。</p>
						</div>
						<div class="col-sm-4">
							<div class="faith">
								<img
									src="https://st4.depositphotos.com/11574170/41283/v/450/depositphotos_412836760-stock-illustration-bird-vector-thin-line-icon.jpg"
									alt="" />
							</div>
							<h4>信仰</h4>
							<p class="px-3">在信仰與現實的衝突交界之處，透過出版、課程與活動，與信仰群體同行並提供處境化的信仰與神學資源，發展靈活動態的門徒實踐畫像。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>
	<jsp:include page="footer.jsp" />
	</div>
	<%String memberId = (String) session.getAttribute("memberId");%>
	<script>
	var memberId = '<%=memberId%>'
		var vm = new Vue({
			
			el: "#app",
				data: {
					memberId: ""
				}
			});
	
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
    
	    $("#cart").click(function(){
	    	openCart();
	    	$('.cart-menu').addClass('show');
    	});
	    openCart();


	});

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
		
		var s = skrollr.init();
		$(window).scroll(function(evt){
		  if($(window).scrollTop()>0)
		    $(".navbar").removeClass("navbar-top");
		  else
		    $(".navbar").addClass("navbar-top");
		  
		})



		

	</script>
</body>
</html>