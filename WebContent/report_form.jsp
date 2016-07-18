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
				<dt>读者的建议，就是我们前进的动力！</dt>
				<dd>
					1.你的性别？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					2.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何？？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<dd>
					1.如果选择了找淘宝网售后去投诉，对方的服务质量和态度如何 ？
				  <label class="radio"><input type="radio" checked>男</label>
				  <label class="radio"><input type="radio">女</label>	
				</dd>
				<br>
				<dd>
					<button class=" btn btn-large btn-block  btn btn-success" type="button" style="width:20%"> 提交</button>
				</dd>
			</dl>
  	</div>
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
    
