<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
        <title>交易记录</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:regular,700,600&amp;latin" type="text/css" />
        <!-- Essential styles -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css" type="text/css"> 

        <!-- Dlapak styles -->
        <link id="theme_style" type="text/css" href="assets/css/style1.css" rel="stylesheet" media="screen">

        <!-- Assets -->
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.theme.css">

        <!-- JS Library -->
        <script src="assets/js/jquery.js"></script>

    </head>
    <body>
        <div class="wrapper">
            <header  class="navbar navbar-default navbar-fixed-top navbar-top">
                <div class="container">
                    <div class="navbar-header">
                        <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="index" class="navbar-brand"><span class="logo"><i class="fa fa-recycle"></i> 二手交易平台</span></a>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><strong class="caret"></strong>&nbsp;个人中心</a>
                                <ul class="dropdown-menu">
                                    <li><a href="cart">购物车</a></li>
                                    <li><a href="#">交易记录</a></li>
                                    <li><a href="evaluation">评论管理</a></li>
                                    <li><a href="getMyPublished">我的发布</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><i class="fa fa-user"></i> <strong class="caret"></strong>&nbsp;</a>
                                <div class="dropdown-menu dropdown-login" style="padding:15px;min-width:250px">
                                	
                                	<form>                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-user"></i></span>
                                                <input id="username" value=${ username} type="text"  placeholder="用户名" disabled="disabled" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        <input type="button" class="btn btn-custom btn-block" value="注销" onclick="exit()">
                                  
                                    </form> 
                                
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </header>
            <section class="category-wrapper">
                <div class="container" >
                    

                    <div class="row">
                        
                        <div class="col-md-9 col-sm-9">
                            <!-- <div class="category-header no-margin-bottom">
                                <div class="row">
                                    <div class="col-md-4  cat-search-input">
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="search-results-box">
                                <div class="row">
                                    
                                </div>
                            </div> -->
                            <div class="list-results">
                                <div class="row">
                                    <div class="col-sm-12">
									<c:forEach items="${recordList}" var="g" varStatus="status">
										<div class="item-ads">
												<div class="row">

                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-img">
                                                        <img alt="" src="/upload/${g.url }">
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-xs-6">
                                                    <div class="item-title">
                                                        <a href="detail?gId=${g.gId }"><h4>${g.name }</h4></a>
                                                    </div>
                                                   
                                                </div>
                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-price">
                                                        <h3>${g.price}</h3>
                                                        	<span>${g.recordStatus }</span>
                                                    </div>
                                                   
                                                </div>
                                            </div>
                                         </div>
									</c:forEach>
                                            
                                       
                                    </div>
                                </div>
                            </div>
                           
                        </div>  
                    </div>
                </div>
            </section>
            
        </div>
        <!-- Essentials -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/owl-carousel/owl.carousel.js"></script>
        <script src="assets/plugins/counter/jquery.countTo.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
            
            function exit(){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'exit.action',
		        	  data: {},
		        	  success: function(data){
	                      
	                   }
	      		});
            	window.location="index";
            }
            function buy(val){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'buyGood.action',
		        	  data: {goodId:val},
		        	  success: function(data){
	                      
	                   }
	      		});
            	alert("购买成功");
            	window.location="cart";
            }
            function deleteCart(val){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'deleteCart.action',
		        	  data: {goodId:val},
		        	  success: function(data){
	                      
	                   }
	      		});
          	alert("删除成功");
          	window.location="cart";
            }
            function func(){
            	var vs = $("#orderType").val();
            	console.log(vs);
            	window.location="cartOrder?orderType="+vs; 
            }
        </script>
    </body>
</html> 