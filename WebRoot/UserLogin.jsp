<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #fff;
	background-image:url(image/登录.jpg);
}

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,p,blockquote,th,td
	{
	margin: 0;
	padding: 0;
}


.denglu{
    margin-top:100px;
    margin-left:15%;
	max-width:300px;
	height:280px;
	padding: 19px 29px 29px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	opacity:0.7;
}

.denglu .form-signin-heading,.denglu .checkbox {
	margin-bottom: 15px;
}
.denglu .form-signin-heading{
font-size:23px;
margin:30px 110px;
}

.denglu input[type="text"],.denglu input[type="password"] {
	height: auto;
	margin-bottom: 15px;
	margin-top:10px;
	padding: 7px 9px;
}
.btn{
width:50px;
height:40px;
font-size:16px;
float:right;
}
h1 {
	color: #fff;
	background: #06b;
	padding: 10px;
	font-size: 200%;
	text-align: center;
}

</style>
</head>

<body>
<div class="denglu">
		<form  action="User_cheakLogin.action" method="post" >
			<h2 class="form-signin-heading">请登录</h2>
		    <table>
		    
		            <tr>
	                     <td align="right">用户名：</td>	            
		                 <td><input type="text" name="username" id="username" class="input" value=""></td>
		                   	  
		            </tr>
		         
		             <tr>
	                     <td align="right">密码：</td>	            
		                 <td><input type="password" name="password" id="password" class="input" value=""></td>
		                 	  
		            </tr>
		             <tr>
	                     <td ></td>            
		                 <td><button type="submit"  class="btn">登录</button></td>
		               
		                 <td></td>	  	  
		            </tr>
		    </table>
		</form>
	</div>
</body>
</html>
