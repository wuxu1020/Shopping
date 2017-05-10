<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <title>管理员登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

</head>

<body oncontextmenu="return false">
	<div class="page-container">
            <h1>管理员登录</h1>
            <form action="" method="post">
				<div>
					<input type="text" id="username" name="username" class="username" placeholder="Username" autocomplete="off"/>
				</div>
                <div>
					<input type="password" id="password" name="password" class="password" placeholder="Password" oncontextmenu="return false" onpaste="return false" />
                </div>
                <button id="submit" type="button" onclick="cheaku_p()">登录</button>
            </form>
            <div class="connect">
                <p></p>
				<p style="margin-top:20px;"></p>
            </div>
        </div>
		<div class="alert" style="display:none">
			<h2>消息</h2>
			<div class="alert_con">
				<p id="ts"></p>
				<p style="line-height:70px"><a class="btn">确定</a></p>
			</div>
		</div>

        <!-- Javascript -->
		<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="jquery/JS/jquery-2.1.1.min.js"></script>
        <script src="js/supersized.3.2.7.min.js"></script>
        <script src="js/supersized-init.js"></script>
		<script type="text/javascript">
		$(".btn").click(function(){
			is_hide();
		})
		function cheaku_p(){
			var u = $("#username").val().replace(/\s+/g,"");
		    var p = $("#password").val().replace(/\s+/g,"");
			if(u == '' || p =='')
			{
				$("#ts").html("用户名或密码不能为空~");
				is_show();
				return false;
			}
			$.ajax({
			type : "post",
			url : "AgentLogin_CheakLogin.action",
			data : {
				'username' : u,
				'password' : p
			},
			datatype : "json",
			//contentType: "application/json",
			success : function(json) {
				//alert(typeof(json.jsonResult));
				var order = json.result;
				if(order=="true"){
					var url = getRootPath()+"/AgentJump_ToCheakSupplier.action?pagetype='可用'";//获取工程路径  
                	location.href = url;
                	return true;
                }
                else {
                	$("#ts").html("用户名或密码不正确！");
				    is_show();
				    return false;
                }
			},
			error : function(text) {
				alert("erro");
			}
		});
		}
		window.onload = function()
		{
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		}
		function is_hide(){ $(".alert").animate({"top":"-40%"}, 300) }
		function is_show(){ $(".alert").show().animate({"top":"45%"}, 300) }
		
		
		function getRootPath(){  
        //获取当前网址，如： http://localhost:8099/UniqueduHome/view/error/notAuthorize.jsp
        var curWwwPath=window.document.location.href;  
        //获取主机地址之后的目录，如： UniqueduHome/view/error/notAuthorize.jsp  
        var pathName=window.document.location.pathname;  
        var pos=curWwwPath.indexOf(pathName);  
        //获取主机地址，如： http://localhost:8099  
        var localhostPaht=curWwwPath.substring(0,pos);  
        //获取带"/"的项目名，如：/UniqueduHome  
        var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
        return(localhostPaht+projectName); 
      /*  return (curWwwPath); */
    }
		</script>
</body>
</html>
