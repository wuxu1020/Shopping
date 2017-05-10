<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>

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


.register{
    margin-top:100px;
    margin-left:15%;
	max-width:300px;
	height:400px;
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

.register .form-signin-heading,.register .checkbox {
	margin-bottom: 15px;
}
.register .form-signin-heading{
font-size:23px;
margin:30px 100px;
}

.register input[type="text"],.register input[type="password"] {
	height: auto;
	margin-bottom: 15px;
	margin-top:10px;
	padding: 7px 9px;
}
.register label{
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
.btn{
width:50px;
height:30px;
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
<div class="register">
		<form  action="User_register.action" method="post" onSubmit="return check()">
			<h2 class="form-signin-heading">用户注册</h2>
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
	                     <td align="right">年龄：</td>	            
		                 <td><input type="text" name="age" id="age" class="input" value=""></td>
		                 	  
		            </tr>
                    <tr>
	                     <td align="right">性别：</td>	            
		                 <td><label>男</label><input type="radio" value="1"  name="sex" />
                             <label>女</label><input type="radio" value="2"  name="sex" />
                             </td>  
		            </tr>
                    <tr>
	                     <td align="right">手机号码：</td>	            
		                 <td><input type="text" name="phone" id="phone" class="input" value=""></td>
		                 	  
		            </tr>
		             <tr>
	                     <td ></td>            
		                 <td><button type="submit"  class="btn" value="submit">注册</button></td>
		               
		                 <td></td>	  	  
		            </tr>
		    </table>
		</form>
	</div>
</body>
</html>
