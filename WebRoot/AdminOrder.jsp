 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link href="css/head.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jQuery.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script> 
<script type="text/javascript">

 function check() {
	      if(confirm("您确定要退出吗?")){
		        window.location.href = "UserLogout.jsp"
	           }
	           }
</script>
<script type="text/javascript">
    $(function(){
    $("#myTab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    });
})
</script>
<style>
.comWidth{width:900px;margin-left:auto;margin-right:auto;}
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
.logo{height:108px;background-color:#EA0000;margin-top:-1px;}
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
#myTab{
     width:60%;
     margin:0 auto;
}
.nav{
    line-height:50px;
}
#myTab li{
     width:33%;
     height:50px;
}
.nav-pills>li.active>a, .nav-pills>li.active>a:focus, .nav-pills>li.active>a:hover {
    color: #fff;
    background-color:#FF4848;
}
.nav a{
     height:50px; 
     color:#000;
}
/* 未发货 */
.weifa{
    margin-left:145px;
     width:85%;
     height: 50px;
    line-height: 50px;
    color: #3c3c3c;

}
.th-item {
    float:left;
    width:200px;
}
.th-info {
    width: 150px;
    padding-right: 20px;
    float:left;
}
.th-price{
    float:left;
    width:50px;
    margin-left:150px;
}
.th-amount{
    float:left;
    padding:0px 55px; 
}
.th-sum {
    color: #f40;
    font-weight: 700;
    float:left;
    padding:0px 30px;
}
.th-time{
    float:left;
    padding:0px 30px;
}
/* 订单内容 */
.user{
    float:left;
    margin-right:150px; 
}
.username{
    float:left;  
    margin:0px 145px;
}
.tupian{
   width: 220px;
    height: 220px;
    border: 1px solid #eee;
    float: left;
    overflow: hidden;
    background: #fff no-repeat 50% 50%;
}
.mingchen{
   float:left;
   width:250px;
   height:220px;
}
.price-content{
   float:left;
   padding:0px 30px;
}
.amount{
   float:left;
   padding:0px 30px;
}
.sum{
   float:left;
   padding:0px 30px;
}
.time{
   float:left;
   padding:0px 30px;
}
</style>

</head>

<body>
<div class="header">
      <div class="top">
    <div class="comWidth">
      <div class="leftarea fl"> 欢迎来到嗨购! </div>
      <div class="rightarea fr"> 
         <a onclick="check()" class="register">退出登录</a> 
      </div>
    </div>
 </div>
    </div>
  </div>
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
    
    </div>
  </div>
<!--   订单 -->
  <div class="quanping">
<ul id="myTab" class="nav nav-pills" role="tablist">
    <li class="active"><a href="#weifahuo" role="tab" data-toggle="pill">未发货</a></li>
    <li><a href="#yifahuo" role="tab" data-toggle="pill">已发货</a></li>
    <li><a href="#yiwancheng" role="tab" data-toggle="pill">已完成</a></li>
</ul>
<!-- 选项卡面板 -->
<div id="myTabContent" class="tab-content">
<!--   未发货 -->
	<div class="tab-pane fade active" id="weifahuo">
		<div class="weifa">
		 <div class="user">用户</div>
		 <div class="th-item">商品信息</div>
	     <!-- <div class="th-info">&nbsp;</div> -->
	     <div class="th-price">单价</div>
	     <div class="th-amount">数量</div>
	     <div class="th-sum">金额</div>
	     <div class="th-time">时间</div>
	    </div>
	    <c:forEach items="${request.orderlist }" var="order">
	    <c:if test="${order.ostate=='未发货' }">
	 <div class="username">${order.username }</div>
	 <div class="tupian"></div>
	<!--  <div class="mingchen">?</div> -->
	
	 <div class="price-content">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0">￥<span >${order.price }</span></em>
	 </div>
	 <div class="amount">&nbsp;&nbsp;&nbsp;&nbsp;${order.ptotal }</div>
	 <div class="sum">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0" >￥<span >${order.ptotal*order.price }</span></em>
	 </div>
	 <div class="time">${order.obuytime }</div>
	 </c:if>
	 <br>
	 </c:forEach>
    </div>
<!--     已发货 -->
	<div class="tab-pane fade" id="yifahuo">
	<div class="weifa">
	     <div class="user">用户</div>
		 <div class="th-item">商品信息</div>
	     <div class="th-info">&nbsp;</div>
	     <div class="th-price">单价</div>
	     <div class="th-amount">数量</div>
	     <div class="th-sum">金额</div>
	     <div class="th-time">时间</div>
	 </div>
	 <c:forEach items="${request.orderlist }" var="order">
	    <c:if test="${order.ostate=='已发货' }">
	 <div class="username">${order.username }</div>
	 <div class="tupian"></div>
	<!--  <div class="mingchen">?</div> -->
	
	 <div class="price-content">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0">￥<span >${order.price }</span></em>
	 </div>
	 <div class="amount">&nbsp;&nbsp;&nbsp;&nbsp;${order.ptotal }</div>
	 <div class="sum">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0" >￥<span >${order.ptotal*order.price }</span></em>
	 </div>
	 <div class="time">${order.obuytime }</div>
	 </c:if>
	 <br>
	 </c:forEach>
    </div>
<!--     已完成 -->
	<div class="tab-pane fade" id="yiwancheng">
	<div class="weifa">
	     <div class="user">用户</div>
		 <div class="th-item">商品信息</div>
	     <div class="th-info">&nbsp;</div>
	     <div class="th-price">单价</div>
	     <div class="th-amount">数量</div>
	     <div class="th-sum">金额</div>
	     <div class="th-time">时间</div>
	 </div>
	 <c:forEach items="${request.orderlist }" var="order">
	    <c:if test="${order.ostate=='已完成' }">
	 <div class="username">${order.username }</div>
	 <div class="tupian"></div>
	<!--  <div class="mingchen">?</div> -->
	
	 <div class="price-content">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0">￥<span >${order.price }</span></em>
	 </div>
	 <div class="amount">&nbsp;&nbsp;&nbsp;&nbsp;${order.ptotal }</div>
	 <div class="sum">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 <em tabindex="0" >￥<span >${order.ptotal*order.price }</span></em>
	 </div>
	 <div class="time">${order.obuytime }</div>
	 </c:if>
	 <br>
	 </c:forEach>
	 </div>
</div> 
</div>
</body>
</html>
 