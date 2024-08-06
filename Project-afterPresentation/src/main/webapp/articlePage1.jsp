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

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.13/vue.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/skrollr/0.6.30/skrollr.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>

</head>
<style>

* {
  box-sizing: border-box;
}
#section_article a {
  text-decoration: none;
  color: #ad7744;
  font-weight: bold;
}

body {
  background-color: #f0e8e6;
}

#section_article .title, #section_article .title_img {
  max-width: 1090px;
  margin-left: auto;
  margin-right: auto;
}
#section_article .header {
  max-width: 675px;
  margin: 150px auto 50px auto;
}
#section_article .header p {
  display: inline-block;
  padding: 5px;
  border: 1px solid #ad7744;
  color: #ad7744;
}
#section_article .main_img {
  width: 100%;
  margin-bottom: 100px;
}

aside .tag {
  color: #6e1920;
  margin-left: auto;
  background-color: #f0e8e6;
  border: 1px solid #6e1920;
  width: 240px;
  height: 300px;
  border-radius: 10px;
}
aside .dot {
  font-size: 50px;
  font-weight: bolder;
  line-height: 45px;
}
aside .tagcontent {
  font-size: 15px;
  margin: 5px 20px;
  letter-spacing: 2px;
}
aside .tagcategory {
  display: block;
  font-size: 20px;
  letter-spacing: 3px;
  font-weight: bold;
  color: #6e1920;
  border-bottom: 1px solid;
}
aside .date {
  display: inline-block;
  padding-right: 10px;
  margin-bottom: 0;
  font-weight: bold;
  vertical-align: top;
  line-height: 25px;
}
aside .author {
  margin: 0px;
}
aside .author:last-child {
  border-bottom: 1px solid;
  padding-bottom: 5px;
}
aside .hashtag {
  margin: 5px 20px;
}
aside .hashtag a {
  text-decoration: underline;
  margin-right: 10px;
}

#excerpt {
  max-width: 675px;
  background-color: #6e1920;
  color: white;
  padding: 50px 70px;
  letter-spacing: 1px;
  line-height: 25px;
}
#excerpt p:first-child {
  font-weight: bold;
}
#excerpt p:last-child {
  font-weight: lighter;
}

#content {
  max-width: 675px;
  margin-top: 60px;
  margin-bottom: 100px;
}
#content p {
  font-weight: bold;
}
#content hr {
  border: 3px solid #bf7c67;
  width: 20%;
  margin: 60px auto;
  opacity: 0.7;
}


</style>
<body>
<div id="app">
<div class="main-content">
	<jsp:include page="navbar.jsp" />
<section id="section_article">
  <div class="container-fluid justify-content-center">
    <div class="row title justify-content-center">
      <div class="col-md-11">
        <div class="header">
          <p class="tag">精選書摘</p>
          <h1 class="title">解構薇薇安．邁爾的童年餘波：傳奇保母攝影家自拍照之祕，與被忽略的囤積症</h1>
        </div>
      </div>
    </div>
    <div class="row title_img">
      <div class="col-md-12"><img class="main_img" src="https://www.twreporter.org/images/20230920044551-7db78602f44d721d9e8c6d958b6a3c22-desktop.jpg" alt=""/></div>
    </div>
    <div class="row justify-content-center">
      <aside class="col-3">
        <div class="tag">
          <div class="dot">．</div><a class="tagcategory tagcontent" href="">採訪</a>
          <div class="tagcontent">
            <p class="date">2023/09/24</p>
          </div>
          <div class="tagcontent">
            <p class="author">採訪、撰文／張詩芸</p>
            <p class="author">責任編輯／薇薇安</p>
          </div>
          <div class="hashtag"><a href="">#精神疾病</a><a href="">#育兒 </a><a href="">#家庭</a><a href="">#母職</a></div>
        </div>
      </aside>
      <div class="col-6" id="excerpt">
        <p>【導言】</p>
        <p>
           2007年，薇薇安．邁爾（Vivian Maier）的作品在芝加哥租用的倉庫中被人發掘，其拍攝技巧絕佳的影像和神祕的生平讓全世界為之著迷，令人想一探究竟。薇薇安死後聲名鵲起，世人更為她拍攝一部獲奧斯卡金像獎提名的紀錄片<a href="#">《尋秘街拍客》（Finding Vivian Maier）</a>。然而，她在死前深深埋藏自己的過往，就連與她同住的雇主家庭都知之甚少。薇薇安在何處出生、長大？她的父母或手足是誰？是否喜歡與人交遊？她為何攝影？為何不與他人分享照片？</p>
      </div>
      <div class="col-3"></div>
    </div>
    <div class="row justify-content-center">
      <div class="col-3"></div>
      <div class="col-6" id="content">
        <p></p>創傷不盡然是由單一事件造成的，如果長期受到不當的對待，那麼整個童年都可說是創傷。造成的因素有家庭破裂、離婚、棄養、情感或生理忽視、父母濫用藥物或暴力等。而薇薇安經歷的不只是其中之一，更不是只有其中幾項；以上全都讓她吃足了苦頭。
        <p> </p>幾乎是獨自扶養薇薇安長大的女人，本身就因童年遭拒和隨後的精神疾病而受到情感傷害，甚至無法好好照顧自己。在<a href="#">〈自戀、養育、複雜的創傷：自戀型家長為孩子造成的情緒後果〉（Narcissism, Parenting, Complex Trauma: The Emotional Consequences Created for Children by Narcissistic Parents）</a>這篇研究論文中，唐娜．馬霍尼博士（Donna Mahoney）探討了瑪莉這類型母親的影響。她解釋，這類型的母親「往往會重複以往自己家長的疏忽，藉此修復自尊心」（雖然這似乎有違直覺）。這類家長會物化孩子，要孩子遵循自己的觀點，以滿足他們對自我增強的渴望。她大膽推測薇薇安在模仿母親時可能會受到很多誇獎，但在表現出任何正當的自我特質或獨立性時，卻可能受到冷酷的批判。這種混雜的資訊會讓孩子感到困惑、被貶低且不被關愛，而抑制他們發展自我意識。有些母親（比如薇薇安的母親）最終會完全否定撫養孩子的義務。瑪莉反覆無常、不當又自戀的行為有據可查，顯然導致她的孩子嚴重的情緒和身分認同的問題。
        <p></p>生理和性方面的虐待也會造成創傷，而薇薇安的行為顯示出她也可能受過這類型不當的對待。幾乎認識她的人都覺得她以前曾受過某種虐待，原因在於她對男性的強烈恐懼、不時出現類似對過往創傷的反應、她對觸摸感到厭惡、她蓋得密不透風的中性外表，以及她對所照顧孩子的奇怪警告。薇薇安會提醒年輕女孩不要坐在男人的大腿上，甚至說所有的性和暴力犯罪都是男人犯下的。馬洪尼博士連同其他幾位心理健康專家針對這個問題提出解釋，確定薇薇安的行為符合生理虐待和性侵的徵兆。如果這類暴行真的發生過，那麼幾乎何時何地都有可能，因為薇薇安的大半童年都沒有紀錄可循。她有個暴力的父親、和損友混在一起的麻煩哥哥，母親也不會保護她。她在法國更曾經和姨婆有暴力傾向的情人同住．而薇薇安不堪的童年最明顯的證據，就是她有據可查的囤積症。
        <hr/>
      </div>
      <div class="col-3"> </div>
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
				cart: [],
				memberId: memberId,
			},
			methods: {
				checkCart() {
					    axios.get('checkCart')
					      .then(response => {
					        this.cart = response;
					        $('.cart-menu').addClass('show');
					        //alert("JSON = " + JSON.stringify(response.data));
					      })
					      .catch(error => {
					        console.error('Error:', error);
					      });
				  }
			}
		});
		

		

	</script>
</body>
</html>