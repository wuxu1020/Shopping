<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
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
<script type="text/javascript">
//1.数据定义 实际生产应由后台给出
var data=[
{img:1},
{img:2},
{img:3}
];
//2.通用函数
var g=function(id){
	if(id.substr(0,1)=='.')
	{
		return document.getElementsByClassName(id.substr(1));
		}
	return document.getElementById(id);
	}
//3.添加幻灯片的操作 所有幻灯片及按钮
function addSliders(){
//3.1获取模板
var tpl_main=g('template_main').innerHTML
    .replace(/^\s*/,'')
	 .replace(/\s*$/,'');
	
var tpl_ctrl=g('template_ctrl').innerHTML
    .replace(/^\s*/,'')
	 .replace(/\s*$/,'');
	
//3.2定义最终输出HTML的变量	
var out_main=[];
var out_ctrl=[];
//3.3遍历所有数据，构建最终输出的HTML
	for(i in data){
		var _html_main=tpl_main
		.replace(/{{index}}/g,data[i].img);
		
		var _html_ctrl=tpl_ctrl
		.replace(/{{index}}/g,data[i].img);
		
		out_main.push(_html_main);
		out_ctrl.push(_html_ctrl);
		}
//3.4 把HTML会写到对应的DOM里面
g('template_main').innerHTML=out_main.join('');
g('template_ctrl').innerHTML=out_ctrl.join('');
}
//5.幻灯片切换
function switchSlider(n){
//5.1获得要展现的幻灯片和控制按钮 DOM
	var main=g('main_'+n);
	var ctrl=g('ctrl_'+n);
	
//5.2获得所有的幻灯以及控制按钮
	var clear_main=g('.main-i');
    var clear_ctrl=g('.ctrl-i');	
//5.3清楚他们的active样式
	for(var i=0;i<clear_ctrl.length;i++){
	clear_main[i].className=clear_main[i].className
	.replace('main-i_active','');
	clear_ctrl[i].className=clear_ctrl[i].className
	.replace('ctrl-i_active','');		
		}
//5.4为当前控制按钮和幻灯片附加样式
	main.className += ' main-i_active';
	ctrl.className += ' ctrl-i_active';
	}
//4.定义何时处理幻灯片输出
	window.onload=function(){
		addSliders(1);
		switchSlider(1);
		}
</script>

</head>

<body>
<div class="header">
  <div class="top">
    <div class="comWidth">
      <div class="leftarea fl"> 欢迎来到嗨购! </div>
      
      <div class="rightarea fr"> 
      <%   if(session.getAttribute("UID")==null){ %>
      <a href="<%=basePath %>UserLogin.jsp" class="login">请登录</a> <span>|</span> <a href="<%=basePath %>UserRegister.jsp" class="register">免费注册</a>
      <%}else{ %>
      <span>欢迎！  <%=session.getAttribute("UID") %></span>
      <%} %>
       <span>|</span> <a href="<%=basePath %>ShoppingCar.jsp" class="shopcar1">我的购物车</a> 显示购物车数量<span>|</span> <a href="#" class="order">全部订单</a> <span>|</span> <a href="AdminLogin.jsp" class="order">系统维护</a> 
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
  <div class="navbox">
    <div class="comWidth">
      <div class="shopclass fl">
        <p>全部商品分类</p>
        <div class="shopclass_show">
          <ul class="shopclass_item ">
            <li >智能数码 / 手机 / 电脑</li>
          </ul>
          <ul class="shopclass_item">
            <li>家电 / 空调 / 冰箱 /洗衣机</li>
          </ul>
          <ul class="shopclass_item">
            <li>男装 / 女装 / 连衣裙</li>
          </ul>
          <ul class="shopclass_item">
            <li>食品 / 生鲜 / 酒水</li>
          </ul>
          <ul class="shopclass_item">
            <li>个护化妆 / 纸品清洁 </li>
          </ul>
        </div>
        <div class="shopclass_list show" >
          <div class="shopclass_cont">
            <dl class="shoplist_item ">
              <dt>手机</dt>
              <dd> <a href="#">智能机</a> <a href="#">老人机</a> <a href="#">华为</a> <a href="#">OPPO</a> <a href="#">小米</a> </dd>
            </dl>
            <dl class="shoplist_item">
              <dt>电脑</dt>
              <dd> <a href="#">台式</a> <a href="#">笔记本</a> <a href="#">一体机</a> <a href="#">联想</a> <a href="#">戴尔</a> <a href="#">华硕</a> </dd>
            </dl>
            <dl class="shoplist_item">
              <dt>平板电脑</dt>
              <dd> <a href="#">华为</a> <a href="#">苹果</a> <a href="#">小米</a> </dd>
            </dl>
            <dl class="shoplist_item">
              <dt>外设附件</dt>
              <dd> <a href="#">鼠标</a> <a href="#">键盘</a> <a href="#">电脑包</a> <a href="#">U盘</a> </dd>
            </dl>
            <dl class="shoplist_item">
              <dt>游戏设备</dt>
              <dd> <a href="#">游戏耳机</a> <a href="#">游戏手柄</a> <a href="#">游戏机</a> </dd>
            </dl>
            <dl class="shoplist_item">
              <dt>摄影摄像</dt>
              <dd> <a href="#">单反</a> <a href="#">数码相机</a> <a href="#">摄像机</a> <a href="#">佳能</a> <a href="#">拍立得</a> </dd>
            </dl>
          </div>
        </div>
      </div>
      <ul class="nav fr">
        <li><a href="#" class=active >最新上架</a></li>
        <li><a href="#" >最热商品</a></li>
        <li><a href="#" class=active>数码城</a></li>
        <li><a href="#">连衣裙</a></li>
        <li><a href="#" class=active
       >抢购</a></li>
      </ul>
    </div>
  </div>
  <div class="middle">
    <div class="slider"> 
      <!--0.修改view->Template 关键字替换，增加template id-->
      <div class="main" id="template_main">
        <div class="main-i main-i_active{{css}}" id="main_{{index}}"> <img src="{{index}}.jpg"/> </div>
      </div>
      <div class="ctrl" id="template_ctrl"> <a class="ctrl-i" id="ctrl_{{index}}" href="javascript:switchSlider({{index}});"> <img src="{{index}}.jpg"/></a> </div>
    </div>
  </div> 

</div>
</body>
</html>
