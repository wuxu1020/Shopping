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
//鼠标悬浮显现内容
function app(x)
{
x.style.display="block";
}
function diap(x)
{
x.style.display="none";
}

function getSort(){
			$.ajax({
			type : "post",
			url : "Sort_getAllsort.action",
			data : {},
			datatype : "json",
			success : function(json) {
				var sortlist=json.sortlist;
				for(var i=0;i<sortlist.length;i++){
					switch(sortlist[i].stype){
						case "数码":appendtodd('shopclass_list1',sortlist[i].sname);break;
						case "家电":appendtodd('shopclass_list2',sortlist[i].sname);break;
						case "服装":appendtodd('shopclass_list3',sortlist[i].sname);break;
						case "食品":appendtodd('shopclass_list4',sortlist[i].sname);break;
						case "个护":appendtodd('shopclass_list5',sortlist[i].sname);break;
						case "其他":appendtodd('shopclass_list6',sortlist[i].sname);break;
					}
				}
			},
			error : function(text) {
				alert("删除失败！");
			}
		});
		}
   function appendtodd(pid,sname){
   		$('#'+pid).find('.it').append('<a href="Product_showproductToUser?page=1&searchvalue='+sname+'">'+sname+'</a>&nbsp;');
   }
</script>
<script src="js/jquery.min.js"></script>
<style>
.shopclass_item hover{color:black}
.shopclass_show hover{background-color:#FF9D9D;}
</style>
</head>

<body onload="getSort()">
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
       <span>|</span> <a href="<%=basePath %>ShoppingCar.jsp" class="shopcar1">我的购物车</a> <span>|</span> <a href="Order_usershoworder.action" class="order">全部订单</a> <span>|</span> <a href="AdminLogin.jsp" class="order">系统维护</a> 
       <%   if(session.getAttribute("UID")!=null){ %>
       <span>|</span> <a onclick="check()" class="register">退出登录</a>
        <%} %>
        </div>
    </div>
  </div>
  <div class="logo">
    <div class="comWidth1">
      <div class="logoimage fl"> <a href="#"><img src="image/haigou.png" alt="嗨购"></a> </div>
      <form action="Product_showproductToUser.action?page=1" method="post">
      <div class="search_box fl">
        <input type="text" class="search_text fl" name="searchvalue"/>
        <input type="submit" value="搜索" class="search_button fr" />
      </div>
      </form>
    </div>
  </div>
  <div class="navbox">
    <div class="comWidth">
      <div class="shopclass fl">
        <p>全部商品分类</p>
        <div class="shopclass_show" >
          <dl class="shopclass_item " id="l1" onmousemove="app(document.getElementById('shopclass_list1'))"
				onmouseout="diap(document.getElementById('shopclass_list1'))"> 
            <dt >数码 </dt>
            <dd id="shopclass_list1">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd>  
          </dl>   
           
          <dl class="shopclass_item" id="l1" onmousemove="app(document.getElementById('shopclass_list2'))"
				onmouseout="diap(document.getElementById('shopclass_list2'))">
            <dt id="l2" onmouseover="">家电 </dt>
            <dd id="shopclass_list2">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd> 
          </dl>
          
          <dl class="shopclass_item" id="l1" onmousemove="app(document.getElementById('shopclass_list3'))"
				onmouseout="diap(document.getElementById('shopclass_list3'))">
            <dt id="l3" onmouseover="">服装</dt>
           <dd id="shopclass_list3">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd> 
          </dl>
          
          <dl class="shopclass_item" id="l1" onmousemove="app(document.getElementById('shopclass_list4'))"
				onmouseout="diap(document.getElementById('shopclass_list4'))">
            <dt id="l4" onmouseover="">食品</dt>
            <dd id="shopclass_list4">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd> 
          </dl>
          
          <dl class="shopclass_item" id="l1" onmousemove="app(document.getElementById('shopclass_list5'))"
				onmouseout="diap(document.getElementById('shopclass_list5'))">
            <dt id="l5" onmouseover="">个护</dt>
           <dd id="shopclass_list5">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd> 
          </dl>
          
           <dl class="shopclass_item" id="l1" onmousemove="app(document.getElementById('shopclass_list6'))"
				onmouseout="diap(document.getElementById('shopclass_list6'))">       
            <dt id="l6" onmouseover="">其他</dt>
           <dd id="shopclass_list6">
          <div class="shopclass_cont">
            <dl class="shoplist_item">
              <dd class="it"> </dd>
            </dl>
          </div>
            </dd> 
          </dl>
        </div>
        

      </div>
      <ul class="nav fr">
        <li><a href="NewProduct.jsp" class=active >最新上架</a></li>
        <li><a href="HotProduct.jsp" >最热商品</a></li>
        
      </ul>
    </div>
  </div>
<!--   轮播图 -->
  <div class="middle"  onmouseout="noshowf()">
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
