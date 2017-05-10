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
</head>

<body>
		<!-- 右侧具体内容栏目 -->
		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>
			<!-- Tab panes -->
			<div class="tab-content">


			

				<!--人员管理模块-->
				<div role="tabpanel" class="tab-pane active" id="stud">
					<div class="check-div form-inline">
						<div class="col-xs-5">
							<input type="text" class=" form-control input-sm"
								placeholder="输入文字搜索" style="height: 32px;">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
						<div class="col-lg-3 col-lg-offset-2 col-xs-4"
							style=" padding-right: 40px;text-align: right;">
							<label for="paixu">排序:&nbsp;</label> <select
								class=" form-control">
								<option>地区</option>
								<option>地区</option>
								<option>班期</option>
								<option>性别</option>
								<option>年龄</option>
								<option>份数</option>
							</select>
						</div>

					</div>
					<div class="data-div">
						<div class="row tableHeader">
							<div class="col-xs-2 ">学号</div>
							<div class="col-xs-1 ">姓名</div>
							<div class="col-xs-2">院系</div>
							<div class="col-xs-2">年年</div>
							<div class="col-xs-2 ">学习时长</div>
							<div class="col-xs-2">违约次数</div>
							<div class="col-xs-1">操作</div>
						</div>
						<div class="tablebody">

							<div class="row">
								<div class="col-xs-2 ">6426398978</div>
								<div class="col-xs-1">邓超</div>
								<div class="col-xs-2">计算机地区</div>
								<div class="col-xs-2">2013年</div>
								<div class="col-xs-2">15</div>
								<div class="col-xs-2">2</div>
								<div class="col-xs-1">
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteObey">清除违约</button>
								</div>
							</div>

						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
						</select> 页</li>
						<li class="gray">共20页</li>
						<li><i class="glyphicon glyphicon-menu-left"> </i></li>
						<li><i class="glyphicon glyphicon-menu-right"> </i></li>
					</ul>
					</footer>

					<!--弹出删除违约记录警告窗口-->

					<div class="modal fade" id="deleteObey" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">确定要删除该违约记录？删除后不可恢复！</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="button" class="btn btn-xs btn-danger">保
										存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
			</div>
		</div>
</body>
</html>
