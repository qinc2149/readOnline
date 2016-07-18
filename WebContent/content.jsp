<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="styles/content.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jquery-1.11.2.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/buttonLite.js"></script>
<script src="js/bshareC0.js"></script>
<title>在线读书系统</title>
</head>
<body>
<div class="container">
	<div class="row-fluid">
		<div class="page-header">
  			<h1 style="text-shadow: 2px 2px 2px #E0FFFF;">Ignorance is not <small> innocence but sin</small></h1>
		</div>
	</div>
	<div class="row-fluid" style="margin-top:-20px;">
		<div class="navbar navbar-inverse">
  			<div class="navbar-inner ">
   				<a class="brand" href="#">Title</a>
   				<jsp:include page="nav.jsp" />
 			 </div>
		</div>
	</div>  
	<div class="row-fluid" style="margin-top:-16px;">
		<div class="span12 ">
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="images/head02.jpg" alt="">
						<div class="carousel-caption">
						   <p>夫读书将以何为哉？辨其大义，以修己治人之体也，察其微言，以善精义入神之用也。</p>
						</div>
					</div>
				<div class="item">
					<img src="images/head01.jpg" alt="">
					<div class="carousel-caption">
						<p>书籍对于人类原有很重大的意义，但，书籍不仅对那些不会读书的人是毫无用处，就是对那些机械地读完了书还不会从死的文字中引申活的思想的人也是无用的。 </p>
					</div>
				</div>
				<div class="item">
					<img src="images/head03.jpg" alt="">
					<div class="carousel-caption">
						<p>一种纯粹靠读书学来的真理，与我们的关系，就像假肢、假牙、蜡鼻子甚或人工植皮。而由独立思考获得的真理就如我们天生的四肢：只有它们才属于我们。</p>
					</div>
				</div>
			</div>
 		<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>		
		</div>
	</div>		
	<div class="row-fluid" id="content">
			<dl>
				<dt>${article.title }</dt>
				<dd>${article.content }</dd>
			</dl>
		<div class="bshare-custom icon-medium-plus" id="share">
			<a title="分享到QQ空间" class="bshare-qzone"></a>
			<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
			<a title="分享到人人网" class="bshare-renren"></a>
			<a title="分享到腾讯微博" class="bshare-qqmb"></a>
			<a title="分享到网易微博" class="bshare-neteasemb"></a>
			<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
			<span class="BSHARE_COUNT bshare-share-count">0</span>
		</div>
  	</div>
<!--高速版，加载速度快，使用前需测试页面的兼容性-->
	<div class="row-fluid" id="SOHUCS"></div>
		<script>
		(function(){
		var appid = 'cyryxv1eh';
		conf = 'prod_e7ae89148dde3d1e3e07e991b95db550';
		var doc = document;
		s = doc.createElement('script');
		h = doc.getElementsByTagName('head')[0] || doc.head || doc.documentElement;
		s.type = 'text/javascript';
		s.charset = 'utf-8';
		s.src = 'js/changyan.js?conf='+ conf +'&appid=' + appid;
		h.insertBefore(s,h.firstChild);
		window.SCS_NO_IFRAME = true;
		})()
		</script> 
<!-- footer -->
	<div class="row-fluid" style="margin-top:15px;">
 		<ul class="thumbnails">
  			<li class="span12">
    			<div class="thumbnail">
    				<p class="text-center" style=" margin-top:6px;">版权所有@ ADC.2015-0428</p>
   				</div>
  			</li>
		</ul>
  	</div>
</div>
</body>
</html>
    
