<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
        <title>二手交易中心</title>
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
                        <a href="#" class="navbar-brand"><span class="logo"><i class="fa fa-recycle"></i> 二手交易平台</span></a>
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
                                        
                                    </form>  
                                    <button class="btn btn-custom btn-block" data-target="#registerModal" data-toggle="modal">注册</button>
                                                                    
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
             <div aria-labelledby="registerModalLabel" role="dialog" tabindex="-1" id="registerModal" class="modal fade in">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                        <h4 id="registerModalLabel" class="modal-title">用户注册</h4>
                    </div>
                    <div class="modal-body">
                        <form >
                            <div class="form-group">
                                <label class="control-label">用户名</label>
                                <input id="user-name" name="username" type="text" class="form-control input-lg"  required="required">
                            </div>
                            <div class="form-group">
                                <label class="control-label">密码</label>
                                <input id="user-pwd" name="password" type="password" class="form-control input-lg"  required="required">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="message-text">确认密码</label>
                                <input id="user-pwd1" name="password1" type="password" class="form-control input-lg"  required="required">
                            </div>
                           
                        </form>
                         <div class="modal-footer">
                        	<button data-dismiss="modal" id="close_button" class="btn btn-default" type="button">关闭</button>
                        	<button class="btn btn-custom"  onclick="rigister()">注册</button>
                    	</div>
                    </div>
                    
                </div>
            </div>
        </div>
            <div class="category-search">
                <div class="container">
                    <div class="row category-search-box">
                            <div class="col-md-3 col-sm-3  cat-search-input">
                                <select id="findSelect" class="form-control">
                                    <option value="1" selected>商品名称</option>
                                    <option value="2">发布人</option>
                                </select>
                            </div>
                           
                            <div class="col-md-3 col-sm-3  cat-search-input">
                                <input id="findInput"type="text" class="form-control" placeholder="I want to find...">
                            </div>
                            <div class="col-md-3 col-sm-3  cat-search-input">
                                <button onclick="find()" class="btn btn-custom btn-block"><i class="fa fa-search"></i></button>
                            </div>
                    </div>
                </div>
            </div>
            <section class="category-wrapper">
                <div class="container" >
                    

                    <div class="row">
                        
                        <div class="col-md-9 col-sm-9">
                            <div class="category-header no-margin-bottom">
                                <div class="row">
                                    <div class="col-md-4  cat-search-input">
                                        <select id="orderType" class="form-control" onchange="func()">
                                        	<option>排序</option>
                                            <option value="2">价格升序</option>
                                            <option value="3">价格降序</option>
                                            <option value="1">最近发布</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="search-results-box">
                                <div class="row">
                                    
                                </div>
                            </div>
                            <div class="list-results">
                                <div class="row">
                                    <div class="col-sm-12">
									<c:forEach items="${goodList}" var="g" varStatus="status">
										<div class="item-ads">
												<div class="row">

                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-img">
                                                        <img alt="" src="/upload/${g.url }">
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 col-xs-6">
                                                    <div class="item-title">
                                                        <a href="detail?gId=${g.id }"><h4>${g.name }</h4></a>
                                                    </div>
                                                    <div class="item-meta">
                                                        <ul>
                                                            <li class="item-date"><i class="fa fa-clock-o"></i> ${g.publishedTime}</li>
                                                            <li class="item-type"><i class="fa fa-bookmark"></i> ${g.publishedByName}</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2 col-xs-3">
                                                    <div class="item-price">
                                                        <h3>${g.price}</h3>
                                                        <span>${g.publishedStatus }</span>
                                                    </div>
                                                    <div class="item-action">
                                                    <c:if test="${g.publishedStatus == 'sell' }">
                                                    	<button onclick="addCart(${g.id},${permission })" class="btn btn-custom"><i class="fa fa-shopping-cart"></i></button>
                                                    </c:if>
                                                    <c:if test="${g.publishedStatus != 'sell' }">
                                                      	 <button disabled="disabled"  class="btn btn-custom"><i class="fa fa-shopping-cart"></i></button>
                                                    </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
									</c:forEach>
                                            
                                       
                                    </div>
                                </div>
                            </div>
                            <!-- 分页细则 -->
                            <div class="row">
                                <div class="col-md-12 text-right">
                                    <ul class="pagination">
                                    
                                    <%
                                    	int nowPage = Integer.valueOf(request.getSession().getAttribute("nowPage").toString());
                                    	int goodNumber = Integer.valueOf(request.getSession().getAttribute("goodNumber").toString());
                                    	int size = goodNumber/10;
                                		if(goodNumber%10!=0){
                                			size++;
                                		}
                                    	if(goodNumber<=50){
                                    		for(int i=1;i<=size;i++){
                                    			if(i!=nowPage){
                                    %>	
                                    		<li><a href="queryByPage?type=user&nowPage=<%=i%>"><%=i %></a></li>
                                    <%
                                    			}else{
                                    %>
                                    		<li class="active"><a href="queryByPage?type=user&nowPage=<%=i%>"><%=i %></a></li>
                                    <%				
                                    			}
                                    		}
                                    %>
                                        
                                      <%
                                    	}else{
                                    		int startPage = nowPage;
                                    		if(size-nowPage<2){
                                    			startPage = size-4;
                                    		}else if(nowPage>2){
                                    			startPage = nowPage-2;
                                    		}else{
                                    			startPage = 1;
                                    		}
                                    		for(int i=startPage;i<=startPage+4;i++){
                                    			if(i!=nowPage){
                                                    %>	
                                                    			
                                                    		<li><a href="queryByPage?type=user&nowPage=<%=i%>"><%=i %></a></li>
                                                    <%
                                                    			}else{
                                                    %>
                                                    		<li class="active"><a href="queryByPage?type=user&nowPage=<%=i%>"><%=i %></a></li>
                                                    <%				
                                                    			}
                                    		}
                                    	}
                                      %>
                                    </ul>
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
            function find(){
            	var findSelect = document.getElementById("findSelect").value;
            	var findInput = document.getElementById("findInput").value;
            	window.location="queryByPage.action?type=user&nowPage=1&findSelect="+findSelect+"&findInput="+findInput; 
            }
            function func(){
            	var vs = $("#orderType").val();
            	console.log(vs);
            	window.location="queryByPage.action?type=user&nowPage=1&orderType="+vs; 
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
            function rigister(){
            	var name = document.getElementById("user-name").value;
            	var pwd = document.getElementById("user-pwd").value;
            	var pwd1 = document.getElementById("user-pwd1").value;
            	console.log(name);
            	if(name.length==0||pwd.length==0||pwd1.length==0){
            		alert("用户名或者密码不能为空");
            	}else if(pwd!=pwd1){
            		alert("两次密码不一致");	
            	}else{
            		alert("注册成功，请重新登陆");
            		$.ajax({
            			type:"post",
            			url:"addUser.action",
            			data:{
            				username:name,
            				password:pwd
            			},
            			success:function(data){
            			},
            			error:function(){
            				alert("系统异常，请稍后重试！");
            			}
            		});
            		document.getElementById("close_button").click();
            	}
            }
        </script>
    </body>
</html> 