<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="./AdminMenu.jsp"%>
<!DOCTYPE HTML>
<html>

<head>

<!--[if lt IE 9]>
          <script src="js/html5shiv.min.js"></script>
          <script src="js/respond.min.js"></script>
        <![endif]-->
<script type="text/javascript">
	function changepsw(){
	$("#changepswerrms").val("");
	$("#changepswokms").val("");
	var oldpsw=$("#oldpsw").val().replace(/\s+/g,"");
	var newpsw=$("#newpsw").val().replace(/\s+/g,"");
	var denewpsw=$("#denewpsw").val().replace(/\s+/g,"");
	if(oldpsw==""||newpsw==""||denewpsw==""){
		$("#changepswerrms").html("不能有空项！");
		return false;
	}
	if(newpsw!=denewpsw){
		$("#changepswerrms").html("新密码输入不一致！");
		return false;
	}
	$.ajax({
			type : "post",
			url : "AgentChangePsw_Changepwd.action",
			data : {'oldpsw':oldpsw,'newpsw':newpsw,'denewpsw':denewpsw},
			datatype : "json",
			success : function(json) {
				var state=json.resulte;
				if(state==0){
					$("#changepswerrms").html("原始密码不正确！");
					return false;
				}
				if(state==1){
					$("#changepswokms").html("密码修改成功，请重新登录！");
					location.href="Admin_Login.jsp";
				}
			},
			error : function(text) {
				alert("修改密码失败！");
			}
		});
		}
		
		function clearms(){
			$("#changepswerrms").html("");
			$("#changepswokms").html("");
		}
</script>  
 
</head>

<body>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">


				<!-- 修改密码模块 -->
				<div role="tabpanel" class="tab-pane active" id="chan">
					<div class="check-div">原始密码为12312313</div>
					<div
						style="padding: 50px 0;margin-top: 50px;background-color: #fff; text-align: right;width: 420px;margin: 50px auto;">
						<form class="form-horizontal">
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">原密码：</label>
								<div class="col-xs-5">
									<input type="type" class="form-control input-sm duiqi" onfocus="clearms()" id="oldpsw"
										placeholder="" style="margin-top: 7px;height: 30px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">新密码：</label>
								<div class="col-xs-5">
									<input type="password" class="form-control input-sm duiqi" onfocus="clearms()" id="newpsw"
										placeholder="" style="margin-top: 7px;height: 30px;">
								</div>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label">确认新密码：</label>
								<div class="col-xs-5">
									<input type="password" class="form-control input-sm duiqi" onfocus="clearms()" id="denewpsw"
										placeholder="" style="margin-top: 7px;height: 30px;">
								</div>
							</div>
							
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label"   id=""></label>
								<label for="sKnot" class="col-xs-4 control-label" 
								style="color: red"  id="changepswerrms"></label>
							</div>
							<div class="form-group">
								<label for="sKnot" class="col-xs-4 control-label"  id=""></label>
								<label for="sKnot" class="col-xs-4 control-label" 
								style="color: green"  id="changepswokms"></label>
							</div>
							
							
							<div class="form-group text-right">
								<div class="col-xs-offset-4 col-xs-5"
									style="margin-left: 169px;">
									<button type="reset" class="btn btn-xs btn-white">取 消</button>
									<button type="button" class="btn btn-xs btn-green" onclick="changepsw()">保存</button>
								</div>
							</div>
						</form>
					</div>
				</div>
				
				</div>
				</div>
</body>
</html>
