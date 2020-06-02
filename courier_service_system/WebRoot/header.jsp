<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Courier Service System</title>
	
    <!-- css -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="css/nivo-lightbox.css" rel="stylesheet" />
	<link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
	<link href="css/owl.carousel.css" rel="stylesheet" media="screen" />
    <link href="css/owl.theme.css" rel="stylesheet" media="screen" />
	<link href="css/flexslider.css" rel="stylesheet" />
	<link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
	<link href="color/default.css" rel="stylesheet">
	<script src="js/jquery.min.js"></script>

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">

    <!-- page loader -->
    <div id="page-loader">
      <div class="loader">
        <div class="spinner">
          <div class="spinner-container con1">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
          </div>
          <div class="spinner-container con2">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
          </div>
          <div class="spinner-container con3">
            <div class="circle1"></div>
            <div class="circle2"></div>
            <div class="circle3"></div>
            <div class="circle4"></div>
          </div>
        </div>
      </div>
    </div>
    <!-- /page loader -->

	<!-- Section: home video -->
    <section id="intro" class="home-video text-light">
		<div class="home-video-wrapper">

		<div class="homevideo-container">
           <div id="P1" class="bg-player" style="display:block; margin: auto; background: rgba(0,0,0,0.5)" data-property="{videoURL:'http://youtu.be/mroiVdC7H10',containment:'.homevideo-container',  showControls: false, autoPlay:true, mute:true, startAt:0, opacity:1}"></div>
		</div>
		<div class="overlay">
			<div class="text-center video-caption">
				<div class="wow bounceInDown" data-wow-offset="0" data-wow-delay="0.8s">
					<h1 class="big-heading font-light"><span id="js-rotating">Worlds No.1 Courier Service System</span></h1>
				</div>
				<div class="wow bounceInUp" data-wow-offset="0" data-wow-delay="1s">
					<div class="margintop-30">
						<!--<a href="#about" class="btn btn-skin" id="btn-scroll">Start here</a>
					--></div>
				</div>
			</div>
		</div>
		</div>
    </section>
	<!-- /Section: intro -->
	
	
    <!-- Navigation -->
    <div id="navigation">
        <nav class="navbar navbar-custom" role="navigation">
                              <div class="container">
                                    <div class="row">
                                          <div class="col-md-2 mob-logo">
                                                <div class="row">
                                                      <div class="site-logo"><!--
                                                            <a href="index.jsp"><img src="img/logo-dark.png" alt="" /></a>
                                                      -->
                                                      
                                                      <font size='4' color="purple"><b>Courier Service</b></font>
                                                      </div>
                                                </div>
                                          </div>
                                          

                                          <div class="col-md-10 mob-menu">
                                                <div class="row">
                                                      <!-- Brand and toggle get grouped for better mobile display -->
                                          <div class="navbar-header">
                                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                                                <i class="fa fa-bars"></i>
                                                </button>
                                          </div>
                                                      <!-- Collect the nav links, forms, and other content for toggling -->
                                                      <div class="collapse navbar-collapse" id="menu">
                                                            <ul class="nav navbar-nav navbar-right">
                                                                 <c:choose>
									
			
			<c:when test="${sessionScope.role=='ADMIN'}">
				<jsp:include page="./adminmenu.jsp" />
			</c:when>
			
			<c:when test="${sessionScope.role=='BOY'}">
				<jsp:include page="./boymenu.jsp" />
			</c:when>
			
				<c:when test="${sessionScope.role=='CUSTOMER'}">
				<jsp:include page="./customermenu.jsp" />
			</c:when>
			
			
			
			<c:when test="${sessionScope.role eq null}">
				<jsp:include page="./menu.jsp" />
			</c:when>
							
							
							</c:choose>
                                                            </ul>
                                                      </div>
                                                      <!-- /.Navbar-collapse -->
                                                </div>
                                          </div>
                                    </div>
                              </div>
                              <!-- /.container -->
                        </nav>
    </div> 