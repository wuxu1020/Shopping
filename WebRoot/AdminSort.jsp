<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="shopping.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分类管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript">
   function getUser(){
     location.href="http://localhost:8080/shopping/Admin_getUser.action";
  }
 function check() {
	      if(confirm("您确定要退出吗?")){
		        window.location.href = "Homepage.jsp"
	           }
	           }
 </script>
 <style type="text/css">
.comWidth{width:900px;margin-left:auto;margin-right:auto;}
.comWidth .fenlei{height:50px;font-size:16px;}
.comWidth .fenlei input[type="text"]{height:25px;padding-left:4px;}
.comWidth .fenlei .lihai{height:30px;padding-left:4px;}
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
input{border:none;}
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
.name{top:5px;}
.nav .active{background-color:#FF9D9D;}
.searchtext {width: 300px;height: 35px;padding: 0 5px;margin-left:18px; }
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
.btn:active {
	position:relative;
	top:1px;
}
</style>
  </head>
  
  
  <body>
  <div class="quanping">
   <div class="top">
    <div class="comWidth">
      <div class="leftarea fl"> 欢迎来到嗨购! </div>
      <div class="rightarea fr">
                                 <a onclick="check()" class="register">退出登录</a> 
      </div>
    </div>
 </div>
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
    </div>
  </div>
   <div class="navbox">
    <div class="comWidth">
     <ul class="nav ">
        <li><a  onclick="getUser()" class=active>用户管理</a></li>
        <li><a href="AdminProduct.jsp" >商品管理</a></li>
        <li><a href="AdminOrder.jsp" class=active>订单管理</a></li>
        <li><a href="AdminSale.jsp">销售统计</a></li>
        <li><a href="AdminSort.jsp" class=active>分类管理</a></li>
      </ul>
   </div>
  </div>
  
  <div class="comWidth">
  <h2>添加分类：</h2>
   <div class="fenlei"> 
   <label  class="name">分类名称 ：</label>
    <input type="text" class="addsorttext" />
   </div>
     <div class="fenlei"> 
   <label  class="name">所属类别 ：</label>
    <select class="lihai">
    <option>请选择所属类别</option>
    <option>智能数码</option>
    <option>家用电器</option>
    <option>服装</option>
     <option>食品</option>
    <option>个人护理</option>
    <option>其他</option>
    </select>
   </div>
   <input type="button" value="确认提交" class="btn" />
     <hr/>
   </div>
 
   <div class="comWidth">
     <h2>查询分类：</h2>
     <input type="button" onclick="getproduct()" value="搜索" class="btn" /> 
   <input type="text" name="searchsort" id="searchsort" class="searchtext" /> 
  显示查询结果
  <hr/>
   </div>
   <div class="comWidth">
     <h2>所有分类：</h2>
     显示所有分类，能删除修改
   </div>
   </div>
  </body>
  
  
</html>
