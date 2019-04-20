<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
        <title>我的发布</title>
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
                                    <li><a href="record">交易记录</a></li>
                                    <li><a href="evaluation">评论管理</a></li>
                                    <li><a href="#">我的发布</a></li>
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
                        
                        <div class="col-md-8 col-sm-8">
                            
                            <div class="search-results-box">
                                <div class="row">
                                    
                                </div>
                            </div>
                            <div class="list-results">
                                <div class="row">
                                    <div class="col-sm-12">
									<c:forEach items="${publishedList}" var="g" varStatus="status">
										<div class="item-ads">
												<div class="row">

                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-img">
                                                        <img alt="" src="/upload/${g.url}">
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-xs-6">
                                                    <div class="item-title">
                                                        <a href="detail?gId=${g.id }"><h4>${g.name }</h4></a>
                                                    </div>
                                                   
                                                </div>
                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-price">
                                                        <h3>${g.price}</h3>
                                                        <c:if test="${g.publishedStatus == 'sell' }">
                                                        	<span>在售</span>
                                                        </c:if>
                                                        <c:if test="${g.publishedStatus != 'sell' }">
                                                        	<span>已售</span>
                                                        </c:if>
                                                    </div>
                                                    <div class="item-action">
                                                    	<c:if test="${g.publishedStatus == 'sell' }">
                                                    		<button onclick="deleteCart(${g.id})" class="btn btn-custom"><i class="fa fa-times"></i></button>
                                                    	</c:if>
                                                    	<c:if test="${g.publishedStatus != 'sell' }">
                                                      	 	<button disabled="disabled" onclick="deleteCart(${g.id})" class="btn btn-custom"><i class="fa fa-times"></i></button>
                                                    	</c:if>
                                                    	
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
									</c:forEach>
                                            
                                       
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
                                    <h2 class="seller-name">${username }</h2>
                                    <p class="seller-detail">已售 <span class="item-numbers">${sellNumber}</span><br/>
                                        购买 <span class="item-numbers">${buyNumber}</span></p>
                                </div>
                                <div class="widget-footer">
                                    <div class="row">
                                        <div class="col-sm-6" style="margin-left: 25%;">
                                            <button class="btn btn-warning btn-block" data-target="#sendMessageModal" data-toggle="modal">发布商品</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                    </div>
                </div>
            </section>
             <!-- Send Message Modal -->
        <div aria-labelledby="sendMessageModalLabel" role="dialog" tabindex="-1" id="sendMessageModal" class="modal fade in">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                        <h4 id="sendMessageModalLabel" class="modal-title">发布商品</h4>
                    </div>
                    <div class="modal-body">
                        <form action="publishGood" method="post" enctype = "multipart/form-data">
                            <div class="form-group">
                                <label class="control-label">商品名</label>
                                <input id="food-name" name="name" type="text" class="form-control input-lg"  required="required">
                            </div>
                            <div class="form-group">
                                <label class="control-label">商品价格</label>
                                <input id="food-price" name="price" type="number" class="form-control input-lg"  required="required">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="message-text">商品简介</label>
                                <textarea id="food-detail" name="detail" class="form-control input-lg"  required="required"></textarea>
                            </div>
                            <div class="form-group">
                                <label class="control-label">上传图片</label>
                                <input type="file" id="test-image-file" name="upload" accept="image/gif, image/jpeg, image/png, image/jpg" required="required">
                            </div>
                            <div class="modal-footer">
                        	<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                        	<input class="btn btn-custom"  type="submit" value="发布"/>
                    	</div>
                        </form>
                        
                    </div>
                    
                </div>
            </div>
        </div>
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
            function deleteCart(val){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'deletePublished.action',
		        	  data: {id:val},
		        	  success: function(data){
	                      
	                   }
	      		});
          	alert("删除成功");
          	window.location="getMyPublished";
            }
				/* alert("发布成功");            	
            	window.location.reload() */
            	/* var btn = document.getElementById("close-button");
            	btn.click(); */
            	//document.getElementById("sendMessageModal").style.display="none";
            
        </script>
    </body>
</html> 