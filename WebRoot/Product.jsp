<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品详情页</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
myFocus.set({
	id:'template_main',
	time:'2'
}
)

 function check() {
	      if(confirm("您确定要退出吗?")){
		        window.location.href = "UserLogout.jsp"
	           }
	           }
</script>
<style>
.comWidth{width:900px;margin-left:auto;margin-right:auto;}
.comWidth3{width:900px;margin-left:220px;margin-right:auto;padding-top:30px;padding-left:2px;}
.comWidth2{width:900px;margin-left:auto;margin-right:auto;padding-top:10px;}
.comWidth1{width:1090px;margin-left:auto;margin-right:auto;}
.quanping{width:auto;height:1000px;margin-left:auto;margin-right:auto;background-color:#FFE3E3;}
.fr{float:right;}
.fl{float:left;}
.hide{display:none;}
.show{display:block;}
.top{height:31px;width:100%;background-color:#F9F9F9 ;line-height:31px;}
.top a:hover{color:red;}
.login{font-weight:bold;}
.leftarea{font-weight:bold;}
.logo{height:108px;background-color:#EA0000;}
/*.logoimage{padding-top:8px;}*/
body,ul,li,p,h3,div{margin:0;padding:0;}
body{font-size:12px;}
img{border:none;}
li{list-style:none;}
hr{color:#FFF;}
dt{padding-left:10px;paddind-top:5px;}
/*dl{border-bottom:1px solid #FFF;}*/
a{text-decoration:none;color:#666;}
.navbox{height:36px;background-color:#FF4848;color:#FFF; }
.nav,shopclass p{font-family:"Microsoft YaHei","微软雅黑";}
.nav{line-height:35px;}
.nav li{float:left;}
.nav a{height:36px;display:inline-block;padding:0 60px;color:#FFF; }
.nav a:hover{color:black;}
.nav .active{background-color:#FF9D9D;}
.search_box{width:440px;padding-top:29px;padding-left:185px;}
.search_text{width:350px;height:35px;padding:0 5px;}
.search_button{width:80px;height:35px;font-size:14px;font-family:"Microsoft YaHei","微软雅黑";background-color:#F00;color:#FFF; }

.searchtext{width:300px;height:35px;padding:0 5px;margin-left:100px;}
.search{padding-top:5px;}
.s{margin-right:150px;}
.pimage{width:300px;height:350px;background-color:#F9F9F9;}
.pimages{width:300px;height:350px;background-color:#F9F9F9;left:1px;}
.pright{padding-left:30px;}
.btn {
	-moz-box-shadow: 0px 10px 14px -7px #bd4c4c;
	-webkit-box-shadow: 0px 10px 14px -7px #bd4c4c;
	box-shadow: 0px 10px 14px -7px #bd4c4c;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f27e7e), color-stop(1, #f76868));
	background:-moz-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-webkit-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-o-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:-ms-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background:linear-gradient(to bottom, #f27e7e 5%, #f76868 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f27e7e', endColorstr='#f76868',GradientType=0);
	background-color:#f27e7e;
	-moz-border-radius:8px;
	-webkit-border-radius:8px;
	border-radius:8px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:11px;
	padding:11px 23px;
	text-decoration:none;
	text-shadow:0px 1px 0px #f06c73;
}
.btn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f76868), color-stop(1, #f27e7e));
	background:-moz-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-webkit-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-o-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:-ms-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background:linear-gradient(to bottom, #f76868 5%, #f27e7e 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f76868', endColorstr='#f27e7e',GradientType=0);
	background-color:#f76868;
}
.btn:active {position:relative;top:1px;}
</style>
</head>

<body>
<div class="header">
  <div class="top">
    <div class="comWidth">
      <div class="leftarea fl"> 欢迎来到嗨购! </div>
      
      <div class="rightarea fr"> 
         <a href="<%=basePath %>Homepage.jsp" class="login">首页</a> <span>|</span>
      <%   if(session.getAttribute("UID")==null){ %>
      <a href="<%=basePath %>UserLogin.jsp" class="login">请登录</a> <span>|</span> <a href="<%=basePath %>UserRegister.jsp" class="register">免费注册</a>
      <%}else{ %>
      <span>欢迎！  <%=session.getAttribute("UID") %></span>
      <%} %>
     <span>|</span> <a href="<%=basePath %>ShoppingCar.jsp" class="shopcar1"> 我的购物车</a> <span>|</span> <a href="#" class="order">全部订单</a> <span>|</span> <a href="AdminLogin.jsp" class="order">系统维护</a> 
       <%   if(session.getAttribute("UID")!=null){ %>
       <span>|</span> <a onclick="check()" class="register">退出登录</a>
        <%} %>
        </div>
    </div>
  </div>
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
    
    </div>
  </div>
  </div>
  <div class="quanping">
  
   <div class="comWidth2">
     <div class="pimage fl">
     显示商品图片   
     </div>
     <div class="pright fl">  
     <div class="title ">商品名称:  </div>
     <div class="price">  商品价格:</div>
     <div class="inventory"> 库存:</div> 
     <div class="describe"> 描述:</div> 
     <div><input type="button" value="加入购物车" class="btn" /><a href="UserPay.jsp" ><input type="button" value="立即购买" class="btn" /></a></div>  
     </div>
   
     </div>
     
   
   <div class="comWidth3 fl">
   <hr>
     <div class="pimages fl">
细节图片
    </div>
     <div class="pimages fr">
细节图片
    </div>
     <div class="pimages fr">
细节图片
    </div>
   </div>
   
   
   </div>
  </body>
  </html>