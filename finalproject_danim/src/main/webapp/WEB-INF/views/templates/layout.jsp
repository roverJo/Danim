<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html lang="en">
<head>
<title>DANIM</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<!-- 다님 로고 삽입 -->
<link rel="icon" href="resources/img/logo.png">
<link rel="shortcut icon" href="resources/img/logo.png" />

<!--*************** CSS ***************-->
<link rel="stylesheet" href="${initParam.root}resources/css/danim.css">
<link rel="stylesheet" href="${initParam.root}resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${initParam.root}resources/css/owl.carousel.css">
<link rel="stylesheet" href="${initParam.root}resources/css/camera.css">
<link rel="stylesheet" href="${initParam.root}resources/css/style.css">
<!--*************** CSS ***************-->


<!--*************** JS ***************-->
<script type="text/javascript" src="${initParam.root}resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript" src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>

<script src="${initParam.root}resources/js/jquery.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js"></script>
<script src="${initParam.root}resources/js/jquery-migrate-1.1.1.js"></script>
<script src="${initParam.root}resources/js/script.js"></script>
<script src="${initParam.root}resources/js/superfish.js"></script>
<script src="${initParam.root}resources/js/tmStickUp.js"></script>
<script src="${initParam.root}resources/js/jquery.ui.totop.js"></script>
<script src="${initParam.root}resources/js/camera.js"></script>
<script src="${initParam.root}resources/js/owl.carousel.js"></script> 
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="${initParam.root}resources/js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!--*************** JS ***************-->

<script>
$(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  

  $('#camera_wrap').camera({
    loader: false,
    pagination: false ,
    minHeight: '400',
    thumbnails: false,
/*     height: '38.07291666666667%', */
    height: '10%',
    caption: false,
    navigation: true,
    fx: 'mosaic'
  });

  $("#owl").owlCarousel({
    items : 3, //10 items above 1000px browser width
    itemsDesktop : [995,1], //5 items between 1000px and 901px
    itemsDesktopSmall : [767, 1], // betweem 900px and 601px
    itemsTablet: [700, 1], //2 items between 600 and 0
    itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
    navigation : true,
    pagination :  false
  }); 
 }); 
</script>
</head>

<body class="page1" id="top">
<!--==============================
              header
=================================-->
<header>
  <div class="container_12">
    <div class="grid_12">
      <h1 class="logo">
        <a href="home.do">
          DANIM
        </a>
      </h1>
    </div>
    <div class="clear"></div>
  </div>
  <div id="header_top"><tiles:insertAttribute name="header_top" /></div>
  <div id="header_bottom" class="container_12">
    <div class="grid_12">
      <tiles:insertAttribute name="header_bottom" />
	  <div class="clear"></div>
	</div>
  	<div class="clear"></div>
  </div>
</header>
 
<!--=====================
          Content
======================-->
<section id="content">
<div id="main">
  <tiles:insertAttribute name="main" />
  <div class="clear"></div>
  <div class="addHeight"></div>
</div>
</section>
<!--==============================
              footer
=================================-->
<footer id="footer">
    <div id="footer" class="container_12">
      <tiles:insertAttribute name="footer" />
    </div>
    <div class="clear"></div>
</footer>
<a href="#" id="toTop" class="fa fa-angle-up" style="right: 0;"></a>
</body>
</html>