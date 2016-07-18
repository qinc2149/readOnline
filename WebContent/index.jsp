<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="styles/index.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script src="bootstrap/js/jquery-1.11.2.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	
</script>
<title>在线阅读</title>
</head>
<body>
<!--流式布局-->
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
<!-- center -->
	<div class="row-fluid">
		<div class="span3" id="left">
			<dl>
				<dt><i class="icon-list"></i>&nbsp;&nbsp;美文推荐<a href="article/toArticles.do?coluName=美文推荐" style="font-size:12px; float:right;margin-right:10px;">更多>></a></dt>
				<dd>
					<ul>
					<c:forEach var='articleList' items='${articleLists}' >	
						<c:if test="${articleList.key=='美文推荐'}">
							<c:forEach var='article' items='${articleList.value }' begin='0' end='14'>	
								<li><em><fmt:formatDate value="${article.create_date }" pattern="yyyy-MM-dd"/></em><a href="article/findArtById.do?id=${article.art_id }">${fn:substring(article.title,0,12)}</a></li>
							</c:forEach>
						</c:if>
					</c:forEach>		
					</ul>
					
				</dd>
			</dl>
    	</div>
		<div class="span6" id="center">
			<div id="center_top">
				<dl> 
					<dt><i class="icon-flag"></i>&nbsp;&nbsp;今日热点<a href="article/toArticles.do?coluName=今日热点" style="font-size:12px; float:right;margin-right:10px;">更多>></a></dt>
					<dd>
					<c:forEach var='articleList' items='${articleLists}' >	
							<c:if test="${articleList.key=='今日热点'}">
								<c:forEach var='article' items='${articleList.value }' begin='0' end='1'>	
									<div class="media" id="center_top_media">
										  <a class="pull-left" href="#">
											 <img class="media-object" src="images/jrrd01.jpg">
										  </a>
										  <div class="media-body" style="font-size:13px;">
											 <h4 class="media-heading" style="font-size:14px;">${fn:substring(article.title,0,11)}...</h4>
											 <a href="article/findArtById.do?id=${article.art_id }">${fn:substring(article.content,0,80)}...</a>
										  </div>
									</div>
								</c:forEach>
							</c:if>
					</c:forEach>
					</dd>
				</dl>
			</div>
			<div id="center_buttom">
				<ul id="myTab" class="nav nav-tabs">
				   <li class="active"><a href="#tab01" data-toggle="tab"> 最新资讯 </a></li>
				   <li><a href="#tab02" data-toggle="tab">文化新闻</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
				   <div class="tab-pane fade in active" id="tab01">
					  	<ul>
						<c:forEach var='articleList' items='${articleLists}' >	
							<c:if test="${articleList.key=='最新资讯'}">
								<c:forEach var='article' items='${articleList.value }' begin='0' end='5'>	
									<li><em><fmt:formatDate value="${article.create_date }" pattern="yyyy-MM-dd"/></em><a href="article/findArtById.do?id=${article.art_id }">${fn:substring(article.title,0,27)}</a></li>
								</c:forEach>
							</c:if>
						</c:forEach>	
						</ul>
				   </div>
				   <div class="tab-pane fade" id="tab02">
					  	<ul>
						<c:forEach var='articleList' items='${articleLists}' >	
							<c:if test="${articleList.key=='文化新闻'}">
								<c:forEach var='article' items='${articleList.value }' begin='0' end='5'>	
									<li><em><fmt:formatDate value="${article.create_date }" pattern="yyyy-MM-dd"/></em><a href="article/findArtById.do?id=${article.art_id }">${fn:substring(article.title,0,27)}</a></li>
								</c:forEach>
							</c:if>
						</c:forEach>
						</ul>
				   </div>
				</div>
			</div>
    	</div>
		<div class="span3" id="right">
			<div id="right_top">
				<dl>
					<dt><i class="icon-star"></i>&nbsp;&nbsp;奇闻趣事<a href="article/toArticles.do?coluName=奇闻趣事" style="font-size:12px; float:right;margin-right:10px;">更多>></a></dt>
					<dd>
						<ol>
						<c:forEach var='articleList' items='${articleLists}' >	
							<c:if test="${articleList.key=='奇闻趣事'}">
								<c:forEach var='article' items='${articleList.value }' begin='0' end='9'>	
									<li><em><fmt:formatDate value="${article.create_date }" pattern="yyyy-MM-dd"/></em><a href="article/findArtById.do?id=${article.art_id }">${fn:substring(article.title,0,11)}</a></li>
								</c:forEach>
							</c:if>
						</c:forEach>	
	
						</ol>
					</dd>
				</dl>
			</div>
			<div id="right_buttom">
				<dl>
					<dt><i class="icon-heart"></i>&nbsp;&nbsp;友情链接</dt>
					<dd>
						<select name="url" onChange="fun(this.value)">
						<option value="#" >-------------合作伙伴-----------</option>
						<option value="http://www.gsau.edu.cn" >甘肃农业大学</option>
						<option value="http://www.baidu.com" >百度</option>
						</select>
					</dd>
						<dd>
						<select name="url" onChange="fun(this.value)">
						<option value="#" >------------热门书站------------</option>
						<option value="http://www.gsau.edu.cn" >甘肃农业大学</option>
						<option value="http://www.baidu.com" >百度</option>
						</select>
					</dd>
				</dl>
			</div>
    	</div>
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
