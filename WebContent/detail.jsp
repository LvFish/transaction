<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
        <title>商品详情</title>
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:regular,700,600&amp;latin" type="text/css" />
        <!-- Essential styles -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css" type="text/css"> 

        <!-- Dlapak styles -->
        <link id="theme_style" type="text/css" href="assets/css/style1.css" rel="stylesheet" media="screen">

        <!-- Assets -->
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.carousel.css">
        <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.theme.css">
        <link rel="stylesheet" href="assets/plugins/flexslider/flexslider.css" type="text/css" media="screen" />

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
                                    <li><a href="record">交易记录</a></li>
                                    <li><a href="evaluation">评论管理</a></li>
                                    <li><a href="getMyPublished">我的发布</a></li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><i class="fa fa-user"></i> <strong class="caret"></strong>&nbsp;</a>
                                <div class="dropdown-menu dropdown-login" style="padding:15px;min-width:250px">
                                	<%
                                		if(request.getSession().getAttribute("permission")==null){
                                	%>
                                    <form>                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-user"></i></span>
                                                <input id="username" type="text" placeholder="用户名" required="required" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="addon fa fa-lock"></i></span>
                                                <input id="password" type="password" placeholder="密码" required="required" class="form-control input-login">                                            
                                            </div>
                                        </div>
                      
                                        <input type="button" class="btn btn-custom btn-block" value="登陆" onclick="login()">
                                        <a href="#" class="btn-block text-center">Forgot password?</a>
                                  
                                    </form>                                    
                                	<%
                                		}else{
                                	%>
                                	<form>                       
                                        <div class="form-group">
                                            <div class="input-group">
                                                <span class="input-group-addon addon-login"><i class="fa fa-user"></i></span>
                                                <input id="username" value=${ username} type="text"  placeholder="用户名" disabled="disabled" class="form-control input-login">                                            
                                            </div>
                                        </div>
                                        <input type="button" class="btn btn-custom btn-block" value="注销" onclick="exit()">
                                  
                                    </form> 
                                		
                                	<%
                                		}
                                	%>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </header>
            <section class="main">
                <div class="container">
                    

                    <div class="row">
                        <div class="col-md-8 col-sm-8">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="post">
                                        <div class="post-price">
                                            ¥${good.price}
                                        </div>
                                        <div class="post-title">
                                            <h2>${good.name}</h2>
                                        </div>
                                        <div class="post-meta">
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i>${good.publishedTime }</li>
                                                 <c:if test="${good.publishedStatus == 'sell' }">
                                                 		在售
                                                 </c:if>
                                                 <c:if test="${good.publishedStatus != 'sell' }">
                                                 		售出
                                                 </c:if>
                                                 <c:if test="${good.publishedStatus == 'sell' }">
                                                    	<button onclick="addCart(${good.id},${permission })" class="btn btn-custom"><i class="fa fa-shopping-cart"></i></button>
                                                    </c:if>
                                                    <c:if test="${good.publishedStatus != 'sell' }">
                                                      	 <button disabled="disabled"  class="btn btn-custom"><i class="fa fa-shopping-cart"></i></button>
                                                    </c:if>
                                            </ul>
                                        </div>
                                        <div class="flexslider post-images">
                                            <ul class="slides">
                                                    <img alt="" src="/upload/${good.url }" />
                                               
                                            </ul>

                                        </div>
                                        <div class="post-body">
                                            <h4><strong>简介</strong></h4>
                                            <p>
                                                ${good.detail} 
                                            </p>
                                            
                                        </div>
                                        <div class="post-footer">
                                            <div class="row">
                                                <div class="col-xs-6">    
                                                    <button class="btn btn-warning" data-target="#sendMessageModal" data-toggle="modal"><i class="fa fa-envelope"></i> <span class="hidden-xs hidden-sm">评论</span></button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        <div class="col-md-4 col-sm-4">
                            <div class="widget">
                                <div class="widget-header">
                                    <h3>Seller</h3>
                                </div>
                                <div class="widget-body text-center">
                                    <img alt="avatar" src="assets/img/people/gie.jpg" class="seller-avatar img-responsive">
                                    <h2 class="seller-name">${good.publishedByName }</h2>
                                    <p class="seller-detail">已售 <span class="item-numbers">${sellNumber}</span><br/>
                                        购买 <span class="item-numbers">${buyNumber}</span></p>
                                </div>
                            </div>
                            
                           <div class="widget">
                                <div class="widget-header">
                                    <h3>最新评论</h3>
                                </div>
                                <div class="widget-body">
                                    <ul class="trends">
                                    	<c:forEach items="${evaluationList}" var="e" varStatus="status">
                                    	<li>${e.username }<span>&nbsp;评论：</span>&nbsp;<span class="item-numbers">${e.detail }</span></li>
                                    	</c:forEach>
                                    </ul>
                                </div>
                           </div>
                    </div>
                </div>
            </section>
            
        <div aria-labelledby="sendMessageModalLabel" role="dialog" tabindex="-1" id="sendMessageModal" class="modal fade in">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                        <h4 id="sendMessageModalLabel" class="modal-title">发表评论</h4>
                    </div>
                    <div class="modal-body">
                            <div class="form-group">
                                <label class="control-label" for="message-text">内容:</label>
                                <textarea id="message-text" class="form-control input-lg" placeholder="你的评论" required></textarea>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" id="close-button" class="btn btn-default" type="button">Close</button>
                        <button class="btn btn-custom" onclick="sendMessage(${good.id},${permission })" type="button"><i class="fa fa-paper-plane"></i> Send</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/plugins/owl-carousel/owl.carousel.js"></script>
        <script src="assets/plugins/counter/jquery.countTo.js"></script>
        <script defer src="assets/plugins/flexslider/jquery.flexslider.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                // ===============Flexslider=====================
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails",
                    directionNav: false,
                    start: function (slider) {
                        $('body').removeClass('loading');
                    }
                });

                // ==========tooltip initial=================
                $('[data-toggle="tooltip"]').tooltip();
            });
            function login(){
            	var username = document.getElementById("username").value;
            	var password = document.getElementById("password").value;
            	console.log(username+" "+password);
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'login.action',
		        	  data: {username:username,password:password},
		        	  success: function(data){
	                      
	                   }
	      		});
            	location.reload();
            }
            function exit(){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'exit.action',
		        	  data: {},
		        	  success: function(data){
	                      
	                   }
	      		});
            	location.reload();
            }
            function addCart(val,val2){
            	if(val2==null){
            		alert("请先登陆");
            	}else{
            		alert("加入成功");
            		$.ajax({
  		        	  type: 'POST',
  		        	  url: 'addCart.action',
  		        	  data: {goodId:val},
  		        	  success: function(data){
  	                      
  	                   }
  	      			}); 
            	}
            	console.log(val,val2);
            	/* $.ajax({
		        	  type: 'POST',
		        	  url: 'addCart.action',
		        	  data: {goodId:val},
		        	  success: function(data){
	                      
	                   }
	      		}); */
            }
            function sendMessage(val,val2){
            	if(val2==null){
            		alert("请先登陆");
            	}else{
            		var message = document.getElementById("message-text").value;
            		alert("发表成功");
            		$.ajax({
  		        	  type: 'POST',
  		        	  url: 'addEvaluation.action',
  		        	  data: {gId:val,message:message},
  		        	  success: function(data){
  	                      
  	                   }
  	      			}); 
            	}
            	window.location.reload()
            	/* var btn = document.getElementById("close-button");
            	btn.click(); */
            	//document.getElementById("sendMessageModal").style.display="none";
            }
        </script>
    </body>
</html> 