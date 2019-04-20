<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>  
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="robots" content="index, follow">
        <title>用户管理</title>
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
                        <a href="managerIndex" class="navbar-brand"><span class="logo"><i class="fa fa-recycle"></i> 二手交易平台管理端</span></a>
                    </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown"><strong class="caret"></strong>&nbsp;个人中心</a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">用户管理</a></li>
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
									<c:forEach items="${userList}" var="g" varStatus="status">
										<div class="item-ads">
												<div class="row">
						
                                                <div class="col-sm-8 col-xs-6">
                                                    <div class="item-title">
                                                        <h4>用户：${g.username } &nbsp;&nbsp;&nbsp; <span>密码：******</span> </h4>
                                                    </div>
                                                   
                                                   
                                                </div>
                                                <div class="col-sm-2 col-xs-3">
                                                     <button class="btn btn-warning" onclick="Values('${g.uId}','${g.username }')" 
                                                     data-target="#editPwd" data-toggle="modal"><i class="fa fa-edit"></i> <span class="hidden-xs hidden-sm">修改密码</span></button>
                                                    <%-- <div class="item-action">
                                                    	<button onclick="deleteCart(${g.id})" class="btn btn-custom"><i class="fa fa-times"></i></button>
                                                    </div> --%>
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
            <div aria-labelledby="editPwdLabel" role="dialog" tabindex="-1" id="editPwd" class="modal fade in">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
               		 <input type="hidden" id="uId" name="uId" value=''/>
                    <div class="modal-header">
                        <button aria-label="Close" data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span></button>
                        <h4 id="editPwdLabel" class="modal-title">修改密码</h4>
                    </div>
                    <div class="modal-body">
                    		<div class="form-group">
                                <label class="control-label">用户：</label>
                                <input type="text" disabled="disabled" id="userName" class="form-control input-lg" value="" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="message-text">密码</label>
                                <input type="password" id="message-text" class="form-control input-lg" placeholder="输入新密码" required>
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" id="close-button" class="btn btn-default" type="button">Close</button>
                        <button class="btn btn-custom" onclick="editUser()" type="button"><i class="fa fa-paper-plane"></i> 修改</button>
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
            
            function Values(ID,username){
            	console.log(ID+" "+username);
        		$("#uId").val(ID);
        		$("#userName").val(username);
        		$("#message-text").val('');
        	}
            
            function exit(){
            	$.ajax({
		        	  type: 'POST',
		        	  url: 'exit.action',
		        	  data: {},
		        	  success: function(data){
	                      
	                   }
	      		});
            	window.location="managerIndex";
            }
            function editUser(){
            	var uId = document.getElementById("uId").value;
            	var pwd = document.getElementById("message-text").value;
            	console.log(uId+" "+pwd);
            	if(pwd==null||pwd.length==0){
            		alert("请输入密码");
            	}else{
            		 $.ajax({
  		        	  type: 'POST',
  		        	  url: 'editUser.action',
  		        	  data: {uId:uId,password:pwd},
  		        	  success: function(data){
  	                      
  	                   }
  	      			}); 
            		document.getElementById("close-button").click();
            	}
            }
        </script>
    </body>
</html> 