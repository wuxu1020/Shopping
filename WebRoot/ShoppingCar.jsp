<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
/* 固定条 */
.float-bar-holder {
    position: relative;
    height: 50px;
}
.float-bar{
    width: 990px;
    margin: 0 auto;
}
.float-bar-wrapper {
    height: 50px;
    overflow: hidden;
    background: #e5e5e5;
}
.float-bar .select-all {
    float: left;
    width: 50px;
    height: 50px;
    line-height: 50px;
    padding-left: 5px;
}
.select-all {
    cursor: pointer;
    margin-top: -2px;
}
.select-all .cart-checkbox {
    vertical-align: middle;
    margin-top: -2px;
}
。cart-checkbox {
    position: relative;
    display: inline-block;
    width: 15px;
    height: 15px;
    overflow: hidden;
}
.cart-checkbox input {
    position: absolute;
    z-index: 0;
    left: -20px;
    top: -20px;
}
.cart-checkbox label {
    position: relative;
    z-index: 1;
    float: left;
    width: 15px;
    height: 15px;
    background-position: 0 0;
    line-height: 200em;
    overflow: hidden;
    cursor: pointer;
}
.float-bar .operations {
    float: left;
    line-height: 50px;
    height: 50px;
}
.float-bar .operations a {
    margin-left: 25px;
    float: left;
}
a {
    color: #3c3c3c;
    text-decoration: none;
}
.float-bar-right {
    float: right;
    position: absolute;
    right: 0;
    top: 0;
    z-index: 4;
    padding-left: 20px;
}
.float-bar-right, .float-bar-wrapper {
    background: #e5e5e5;
}
.float-bar .amount-sum {
    cursor: pointer;
}
.float-bar .amount-sum, .float-bar .price-sum {
    height: 48px;
    color: #3c3c3c;
}
.float-bar .amount-sum, .float-bar .price-sum, .float-bar .btn-area {
    float: left;
}
.float-bar .amount-sum em {
    line-height: 50px;
    padding: 0 5px;
}
.float-bar .price-sum strong, .float-bar .amount-sum em, .float-bar .price-sum .txt, .float-bar .amount-sum .txt {
    float: left;
}
.float-bar .amount-sum em, .float-bar .price-sum .price em {
    color: #f40;
    font-weight: 700;
    font-size: 18px;
    font-family: tohoma,arial;
}
address, cite, dfn, em, var {
    font-style: normal;
}
.float-bar .txt {
    line-height: 48px;
}
.float-bar .amount-sum .arrow-box {
    float: left;
}
.selected-items-arrow {
    top: 0;
    display: none;
    position: absolute;
    z-index: 10002;
    margin-left: -1px;
    background-position: -95px -75px;
    width: 14px;
    height: 7px;
}
.float-bar .amount-sum .arrow {
    display: inline-block;
    width: 5px;
    height: 6px;
    background-position: 0 -115px;
    margin: 21px 10px 0 6px;
}
.float-bar .pipe {
    float: left;
    margin: 0 10px 0 18px;
    width: 1px;
    height: 12px;
}
.float-bar .amount-sum, .float-bar .price-sum {
    height: 48px;
    color: #3c3c3c;
}
.float-bar .amount-sum, .float-bar .price-sum, .float-bar .btn-area {
    float: left;
}
.float-bar .price-sum .price {
    color: #f40;
    font-weight: 400;
    font-size: 18px;
    line-height: 48px;
    font-family: Arial;
    vertical-align: middle;
}
.float-bar .price-sum .price em {
    font-weight: 700;
    font-size: 22px;
    padding: 0 3px;
    color: #f40;
}
.float-bar .total-symbol {
    font-size: 14px;
    font-family: verdana;
    font-weight: 400;
    color: #f40;
}
.float-bar .btn-area {
    float: left;
}
.submit-btn-disabled {
    background: #B0B0B0;
    color: #fff;
    border-left: 1px solid #e7e7e7;
    width: 119px;
    cursor: not-allowed;
    text-decoration: none;
}
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
       <span>|</span> <a href="<%=basePath %>ShoppingCar.jsp" class="shopcar1">我的购物车</a> <span>|</span> <a href="#" class="order">全部订单</a> <span>|</span> <a href="AdminLogin.jsp" class="order">系统维护</a> 
       <%   if(session.getAttribute("UID")!=null){ %>
       <span>|</span> <a onclick="check()" class="register">退出登录</a>
        <%} %>
        </div>
    </div>
  </div>
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
      <div class="search_box fl">
        <input type="text" class="search_text fl" />
        <input type="button" value="搜索" class="search_button fr" />
      </div>
    </div>
  </div>
 
 <div class="quanping">
<!--  购物车中间 -->
<div id="J_CartMain" class="cart-main">
<div class="cart-table-th">
<div class="wp">
<div class="th th-chk">
<div id="J_SelectAll1" class="select-all J_SelectAll">
<div class="cart-checkbox">
<input class="J_CheckBoxShop" id="J_SelectAllCbx1" type="checkbox" name="select-all" value="true">
<label for="J_SelectAllCbx1">勾选购物车内所有商品</label></div>&nbsp;&nbsp;全选</div></div>
<div class="th th-item">
<div class="td-inner">商品信息</div></div>
<div class="th th-info">
<div class="td-inner">&nbsp;</div></div>
<div class="th th-price">
<div class="td-inner">单价</div></div>
<div class="th th-amount">
<div class="td-inner">数量</div></div>
<div class="th th-sum">
<div class="td-inner">金额</div></div>
<div class="th th-op">
<div class="td-inner">操作</div></div>
</div></div>
<div id="J_OrderList" data-spm="1997196601">
<div id="J_OrderHolder_s_818035833_1" style="height: auto;">
<div id="J_Order_s_818035833_1" class="J_Order clearfix order-body">
<!-- 订单内容 -->
<div class="order-content">
<div id="J_BundleList_s_818035833_1" class="item-list">
<div id="J_Bundle_s_818035833_1_0" class="bundle  bundle-last ">
<div id="J_ItemHolder_445439946879" class="item-holder">
<div id="J_Item_445439946879" class="J_ItemBody item-body clearfix item-normal  first-item">  
<ul class="item-content clearfix"> 
<!-- 勾选框 -->
<li class="td td-chk"> 
<div class="td-inner">
<div class="cart-checkbox ">
<input class="J_CheckBoxItem" id="J_CheckBox_445439946879" type="checkbox" name="items[]" value="445439946879">
<label for="J_CheckBox_445439946879">勾选商品</label></div></div> </li> 
<!-- 商品图片内容 -->
<li class="td td-item"> 
<div class="td-inner"> 
<div class="item-pic J_ItemPic img-loaded">
<a href="" target="_blank" data-title="夏季韩版新款百搭高腰显瘦牛仔裙单排扣短裙半身裙纯色A字裙女夏" class="J_MakePoint" data-point="tbcart.8.12">
<img src="" class="itempic J_ItemImg"></a></div> 
<div class="item-info"> 
<div class="item-basic-info"> 
<a href="" target="_blank" title="夏季韩版新款百搭高腰显瘦牛仔裙单排扣短裙半身裙纯色A字裙女夏" class="item-title J_MakePoint" data-point="tbcart.8.11">夏季韩版新款百搭高腰显瘦牛仔裙单排扣短裙半身裙纯色A字裙女夏</a> </div> 
<div class="item-other-info">  
<div class="promo-logos"></div> 
<div class="item-icon-list clearfix">
<div class="item-icons J_ItemIcons  item-icons-fixed ">
<span class="item-icon item-icon-0" title="支持信用卡支付">
<img src="//assets.alicdn.com/sys/common/icon/trade/xcard.png" alt=""></span>
<a href="" target="_blank" class="item-icon item-icon-1 J_MakePoint" data-point="tbcart.8.26" title="0首付，慢慢还，拥有所爱，无需等待！">
<img src="//img.alicdn.com/tps/TB1GnsWJXXXXXbCXpXXXXXXXXXX-43-16.png" alt=""></a>
<a href="" target="_blank" class="item-icon item-icon-2 J_MakePoint" data-point="tbcart.8.26" title="15天退货，退货邮费买家承担">
<img src="//img.alicdn.com/tps/i2/TB1XY_zGpXXXXbeXXXXAz6UFXXX-16-16.png" alt="15天退货"></a>
<a href="" data-point="tbcart.8.26" title="消费者保障服务，卖家承诺商品如实描述">
<img src="//img.alicdn.com/tps/i3/T1bnR4XEBhXXcQVo..-14-16.png" alt="">
</a></div></div> </div> </div> </div> </li> 
<!-- 商品价格 -->
<li class="td td-price"> 
<div class="td-inner">
<div class="item-price price-promo-seller">
<div class="price-content">
<div class="price-line">
<em class="price-original">￥26.00</em></div>
<div class="price-line">
<em class="J_Price price-now" tabindex="0">￥19.98</em></div></div>
<div class="promo-main promo-seller">
<div class="promo-content  promo-viptool20120502 J_ItemPromotions">
卖家降价<span class="arrow"></span>
</div></div></div></div> </li> 
<!-- 商品数量 -->
<li class="td td-amount"> 
<div class="td-inner">
<div class="amount-wrapper ">
<div class="item-amount ">
<a href="#" class="J_Minus no-minus">-</a>
<input type="text" value="1" class="text text-amount J_ItemAmount" data-max="9805" data-now="1" autocomplete="off">
<a href="#" class="J_Plus plus">+</a></div>
<div class="amount-msg J_AmountMsg"></div></div></div> </li> 
<!-- 商品总价 -->
<li class="td td-sum"> 
<div class="td-inner">
<em tabindex="0" class="J_ItemSum number">￥19.98</em>
<div class="J_ItemLottery"></div></div> </li>
<!-- 删除商品 -->
<li class="td td-op"> 
<div class="td-inner">
<a href="" data-point-url="" class="J_Del J_MakePoint">删除</a></div> </li></ul>  </div> </div>
<!-- 固定条 -->
<div id="J_FloatBarHolder" class="float-bar-holder">
<div id="J_FloatBar" class="float-bar clearfix default" style="position: static;">

<div class="float-bar-wrapper">
<div id="J_SelectAll2" class="select-all J_SelectAll">
<div class="cart-checkbox">
<input class="J_CheckBoxShop" id="J_SelectAllCbx2" type="checkbox" name="select-all" value="true">
<label for="J_SelectAllCbx2">勾选购物车内所有商品</label></div>&nbsp;全选</div>
<div class="operations">
<a href="#" hidefocus="true" class="J_DeleteSelected">删除</a>
<a href="#" hidefocus="true" class="J_ClearInvalid hidden" style="display: inline;">清除失效宝贝</a>
<a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
<a href="#" hidefocus="true" class="J_BatchShare">分享</a></div>
<div class="float-bar-right">
<div id="J_ShowSelectedItems" class="amount-sum">
<span class="txt">已选商品</span><em id="J_SelectedItemsCount">0</em>
<span class="txt">件</span>
<div class="arrow-box">
<span class="selected-items-arrow"></span>
<span class="arrow"></span></div></div>
<div class="pipe"></div>
<div class="price-sum">
<span class="txt">合计（不含运费）：</span>
<strong class="price"><em id="J_Total"><span class="total-symbol">&nbsp;</span>0.00</em></strong></div>
<div class="btn-area">
<a href="javascript:void(0)" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
<span>结&nbsp;算</span><b></b></a></div></div></div> </div></div>

<!--   <div class="comWidth2"> -->
<!--      <div class="pimage fl"> -->
<!--      显示商品图片    -->
<!--      </div> -->
<!--      <div class="pright fl">   -->
<!--      <div class="title "> -->
<!--    商品名称:  -->
<!--      </div> -->
     
<!--      <div class="price"> -->
<!--      商品价格: -->
<!--      </div> -->
<!--      <div class="inventory"> -->
<!--      库存: -->
<!--      </div>    -->
<!--  <a href="Product.jsp" > <input type="button" value="详情" class="btn fr s" /></a> -->
<!--      </div> -->
<!--      </div> -->
<!--    <a href="UserPay.jsp" > <input type="button" value="结算" class="btn fr s" /></a>   -->
     
     </div>
  </div>
  </body>
  </html>
 