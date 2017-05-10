<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="左右结构项目，属于大人员的社交工具">
<meta name="keywords" content="左右结构项目 社交 占座 ">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>网上商城</title>
<script type="text/javascript" src="jquery/JS/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="jquery/JS/jQuery.js"></script>
<script src="js/bootstrap.min.js"></script>

<!--[if lt IE 9]>
          <script src="js/html5shiv.min.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/slide.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
</head>

<body onload="cheakLoginOrNot()">
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="左右结构项目" src="images/logo.png"><span>左右结构项目</span>
				</p>
			</div>
			<form action="AgentLogin_Logout.action">
			<div id="personInfor">
				<p id="userName"><%=session.getAttribute("loginMessage")%></p>
				<p>
					<span>欢迎！</span>
				</p>
				<p>
					<button type="submit" class="btn btn-danger btn-xs">退出登录</button>
				</p>
			</div>
			</form>
			<div class="meun-title">账号管理</div>
			<div>
				<a class="meun-item" href="AgentJump_ToCheakSupplier.action?pagetype='可用'"><img
					src="images/icon_user_grey.png">代理商管理</a>
			</div>
			<div>
				<%-- <a class="meun-item" href="<%=basePath%>Admin_CheakSupplier.jsp"><img
					src="images/icon_source.png">代理商审核</a> --%>
					<a class="meun-item" href="AgentJump_ToCheakSupplier.action?pagetype='不可用'"><img
					src="images/icon_source.png">代理商审核</a>
			</div>
			<div>
				<a class="meun-item" href="<%=basePath%>Admin_AddAdmin.jsp"><img
					src="images/icon_chara.png">管理员管理</a>
			</div>
			<div>
				<a class="meun-item" href="<%=basePath%>Admin_ChangePsw.jsp"><img
					src="images/icon_change_grey.png">修改密码</a>
			</div>
			<div class="meun-title">交易管理</div>
			<div>
				<a class="meun-item" href="#" aria-controls="regu" role="tab"
					data-toggle="tab"> <img src="images/icon_rule_grey.png">时间管理
				</a>
			</div>
			<div>
				<a class="meun-item" href="<%=basePath%>Admin_DealMS.jsp"> <img
					src="images/icon_card_grey.png">交易信息</a>
			</div>
		</div>
	</div>

	<script src="js/jquery.nouislider.js"></script>
	<script type="text/javascript">
	function cheakLoginOrNot() { 
      var customerId=<%=session.getAttribute("agentID")%>; 
      if (customerId == null) { 
        /* alert("您尚未登录，按确定跳转登录页面...");
        location.href="http://localhost:8080/shop/Admin_Login.jsp"; */
    } 
} 
	<%-- function logout(){
		<%
		Object se=session.getAttribute("agentID");
		if(se!=null)
		session.removeAttribute(se.toString());
		%>
	} --%>
	</script>
</body>
</html>
