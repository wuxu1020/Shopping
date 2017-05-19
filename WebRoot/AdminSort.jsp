<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="shopping.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<script src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	function getUser() {
		location.href = "http://localhost:8080/shopping/Admin_getUser.action";
	}
	function check() {
		if (confirm("您确定要退出吗?")) {
			window.location.href = "Homepage.jsp"
		}
	}
	
	function addsort(){
		var stype=$('#ptype').val();
		var sname=$('#psort').val().replace(/\s+/g,"");
		$.ajax({
			type : "post",
			url : "Sort_addSort.action",
			data : {'stype':stype,'sname':sname},
			datatype : "json",
			success : function(json) {
				if(json.result=="have"){
					alert("相同的分类已存在");
					return false;
				}
				var sort=json.sort;
				var showitem='<tr class="yonghu" align="center" id="'+sort.sid+'0">'
							 +'<td><input type="text" readonly="readonly" style="background-color:transparent" value="'+sort.sname+'"></td>'
							 +'<td><span>'+sort.stype+'</span></td>'
							 +"<td><a onclick=\"delUser('"+sort.sid+"')\" class=\"btn\">修改</a>"
							 +"<a onclick=\"delSort('"+sort.sid+"')\" class=\"btn\">删除</a>"
							 +'</td></tr>'
				$("#allsort").prepend(showitem);
			},
			error : function(text) {
				alert("删除失败！");
			}
		});
	}
	
	
	function showsort(){
		var searchsortvalue=$('#searchsort').val().replace(/\s+/g,"");
		$.ajax({
			type : "post",
			url : "Sort_searchSort.action",
			data : {'sname':searchsortvalue},
			datatype : "json",
			success : function(json) {
				var sortlist=json.sortlist;
				var showitem='';
				$("#allsort").find('tr').remove();
				for(var i=0;i<sortlist.length;i++){
					showitem+='<tr class="yonghu" align="center" id="'+sortlist[i].sid+'">'
							 +'<td><input type="text" readonly="readonly" style="background-color:transparent" value="'+sortlist[i].sname+'"></td>'
							 +'<td><span>'+sortlist[i].stype+'</span></td>'
							 +"<td><a onclick=\"editSort('"+sortlist[i].sid+"')\" class=\"btn\">修改</a>"
							 +"<a onclick=\"delSort('"+sortlist[i].sid+"')\" class=\"btn\">删除</a>"
							 +'</td></tr>'
				}
				$("#allsort").append(showitem);
			},
			error : function(text) {
				alert("访问服务器失败！");
			}
		});
	}
	
	function delSort(sid){
	 	var id=sid;
	 	if (confirm("您确定要删除该用户吗?")) {
			$.ajax({
			type : "post",
			url : "Sort_delsort.action",
			data : {'sid':id},
			datatype : "json",
			success : function(json) {
				$("#"+id).remove();
			},
			error : function(text) {
				alert("删除失败！");
			}
		});
		}
		}
</script>
<style type="text/css">
.comWidth {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}

.comWidth .fenlei {
	height: 50px;
	font-size: 16px;
}

.comWidth .fenlei input[type="text"] {
	height: 25px;
	padding-left: 4px;
}

.comWidth .fenlei .lihai {
	height: 30px;
	padding-left: 4px;
}

.comWidth1 {
	width: 1090px;
	margin-left: auto;
	margin-right: auto;
}

.quanping {
	width: auto;
	height: 1000px;
	margin-left: auto;
	margin-right: auto;
	background-color: #FFE3E3;
}

.fr {
	float: right;
}

.fl {
	float: left;
}

.hide {
	display: none;
}

.show {
	display: block;
}

.top {
	height: 31px;
	width: 100%;
	background-color: #F9F9F9;
	line-height: 31px;
}

.top a:hover {
	color: red;
}

.login {
	font-weight: bold;
}

.leftarea {
	font-weight: bold;
}

.logo {
	height: 108px;
	background-color: #EA0000;
}
/*.logoimage{padding-top:8px;}*/
body, ul, li, p, h3, div {
	margin: 0;
	padding: 0;
}

body {
	font-size: 12px;
}

img {
	border: none;
}

li {
	list-style: none;
}

input {
	border: none;
}

hr {
	color: #FFF;
}

dt {
	padding-left: 10px;
	paddind-top: 5px;
}
/*dl{border-bottom:1px solid #FFF;}*/
a {
	text-decoration: none;
	color: #666;
}

.navbox {
	height: 36px;
	background-color: #FF4848;
	color: #FFF;
}

.nav, shopclass p {
	font-family: "Microsoft YaHei", "微软雅黑";
}

.nav {
	line-height: 35px;
}

.nav li {
	float: left;
}

.nav a {
	height: 36px;
	display: inline-block;
	padding: 0 60px;
	color: #FFF;
}

.nav a:hover {
	color: black;
}

.name {
	top: 5px;
}

.nav .active {
	background-color: #FF9D9D;
}

.searchtext {
	width: 300px;
	height: 35px;
	padding: 0 5px;
	margin-left: 18px;
}

.btn {
	-moz-box-shadow: 0px 10px 14px -7px #bd4c4c;
	-webkit-box-shadow: 0px 10px 14px -7px #bd4c4c;
	box-shadow: 0px 10px 14px -7px #bd4c4c;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f27e7e
		), color-stop(1, #f76868));
	background: -moz-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background: -webkit-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background: -o-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background: -ms-linear-gradient(top, #f27e7e 5%, #f76868 100%);
	background: linear-gradient(to bottom, #f27e7e 5%, #f76868 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f27e7e',
		endColorstr='#f76868', GradientType=0);
	background-color: #f27e7e;
	-moz-border-radius: 8px;
	-webkit-border-radius: 8px;
	border-radius: 8px;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 11px;
	padding: 11px 23px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #f06c73;
}

.btn:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f76868
		), color-stop(1, #f27e7e));
	background: -moz-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background: -webkit-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background: -o-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background: -ms-linear-gradient(top, #f76868 5%, #f27e7e 100%);
	background: linear-gradient(to bottom, #f76868 5%, #f27e7e 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f76868',
		endColorstr='#f27e7e', GradientType=0);
	background-color: #f76868;
}

.btn:active {
	position: relative;
	top: 1px;
}
</style>


</head>



<body onload="showsort()">
	<div class="quanping">
		<div class="top">
			<div class="comWidth">
				<div class="leftarea fl">欢迎来到嗨购!</div>
				<div class="rightarea fr">
					<a onclick="check()" class="register">退出登录</a>
				</div>
			</div>
		</div>
		<div class="logo">
			<div class="comWidth1">
				<div class="logoimage fl">
					<a href="#"><img src="image/haigou.png" alt="嗨购"></a>
				</div>
			</div>
		</div>
		<div class="navbox">
			<div class="comWidth">
				<ul class="nav ">
					<li><a onclick="getUser()" class=active>用户管理</a></li>
					<li><a href="AdminProduct.jsp">商品管理</a></li>
					<li><a href="AdminOrder.jsp" class=active>订单管理</a></li>
					<li><a href="AdminSale.jsp">销售统计</a></li>
					<li><a href="AdminSort.jsp" class=active>分类管理</a></li>
				</ul>
			</div>
		</div>

		<div class="comWidth">
			<h2>添加分类：</h2>
			<div class="fenlei">
				<label class="name">分类名称 ：</label> <input id="psort" type="text"
					class="addsorttext" />
			</div>
			<div class="fenlei">
				<label class="name">所属类别 ：</label> <select class="lihai" id="ptype">
					<option value="">请选择所属类别</option>
					<option value="智能数码">智能数码</option>
					<option value="家用电器">家用电器</option>
					<option value="服装">服装</option>
					<option value="食品">食品</option>
					<option value="个人护理">个人护理</option>
					<option value="其他">其他</option>
				</select>  
			</div>
			<input type="button" value="确认提交" class="btn" onclick='addsort()'  />
			<hr />
		</div>

		<div class="comWidth">
			<h2>查询分类：</h2>
			<input type="button" onclick="showsort()" value="搜索" class="btn" onchange="showsort()" />
			<input type="text" name="searchsort" id="searchsort"
				class="searchtext" /> 显示查询结果
			<hr />
			
			<%-- <div class="quanping">
				<table class="table">
					<tr>
						<td align="center" style="width:18%"><strong>分类名</strong></td>
						<td align="center" style="width:18%"><strong>分类类别</strong></td>
						<td align="center" style="width:18%"><strong>操作</strong></td>

					</tr>

					<tr class="yonghu" align="center" id='${status.index}'>
						<td>
							<input type="text" readonly="readonly">
						</td>
						<td>
							<span></span> 
						</td>

						<td><a onclick="delUser('${user.username}','${status.index}')" class="btn">修改</a> 
							<a onclick="delUser('${user.username}','${status.index}')" class="btn">删除</a>
						</td>
					</tr>

				</table>
			</div> --%>
			
		</div>
		<div class="comWidth">
			<h2>所有分类：</h2>

			<div class="quanping">
				<table class="table">
				<thead>
					<tr>
						<th  style="width:18%"><strong>分类名</strong></th>
						<th align="center" style="width:18%"><strong>分类类别</strong></th>
						<th align="center" style="width:18%"><strong>操作</strong></th>

					</tr>
				</thead>
				<tbody id="allsort">
					
				</tbody>
				</table>
			</div>


		</div>
	</div>
</body>


</html>
