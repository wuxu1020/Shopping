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


				<!--代理商管理模块-->
				<div role="tabpanel" class="tab-pane active" id="user" >
					<form action="">
					<div class="check-div form-inline">
						<input type="hidden" name="pagetype" value="'不可用'">
						<div class="col-xs-4">
							<input type="text" class="form-control input-sm"
								placeholder="" style="height: 32px;">
							<button class="btn btn-white btn-xs ">查 询</button>
						</div>
					</div>
					</form>
					<div class="data-div">
						<div class="row tableHeader">
						    <div class="col-xs-2">供应商编号</div>
							<div class="col-xs-2">名称</div>
							<div class="col-xs-2">电话</div>
							<div class="col-xs-2">执照号</div>
							<div class="col-xs-2">法人姓名</div>
							<div class="col-xs-2">状态</div>
							<div class="col-xs-2">操作</div>
						</div>
						<div class="tablebody">
						<c:forEach items="${request.SupplierList}" var="supplier" varStatus="status">
							<div class="row" >
								<div class="col-xs-2 ">${supplier.snum}</div>
								<div class="col-xs-2 ">${supplier.sname}</div>
								<div class="col-xs-2 ">${supplier.stel}</div>
								<div class="col-xs-2 ">${supplier.slicense}</div>
								<div class="col-xs-2 ">${supplier.slegalname}</div>
								<div class="col-xs-2 ">${supplier.ssta}</div>
								<div class="col-xs-2">
									<button class="btn btn-success btn-xs" data-toggle="modal"
										data-target="#reviseUser" 
					onclick="modify(${status.index})">查看|修改</button>
									<button class="btn btn-danger btn-xs" data-toggle="modal"
										data-target="#deleteUser" onclick="deletesup(${supplier.sid})">删除</button>
								</div>
							</div>
						</c:forEach>
						</div>

					</div>
					<!--页码块-->
					<footer class="footer">
					<ul class="pagination">
						<li><select id="jumppage" onchange="jumppage()" >
						<c:forEach var="i" begin="1" end="${cheak_sup_page_sum}" varStatus="status">
								<option value="${status.index}" ${status.index==cheak_sup_page?"selected='selected'":""}>${status.index}</option>
						</c:forEach>
						</select> 页</li>
						<li class="gray">${cheak_sup_page}</li>
						<li><a href="AgentJump_ToCheakSupplier.action?pagetype='不可用'&page=${(cheak_sup_page-1)>0?cheak_sup_page-1:1}">
						<i class="glyphicon glyphicon-menu-left"></i>
						</a></li>
						<li><a href="AgentJump_ToCheakSupplier.action?pagetype='不可用'&page=${(cheak_sup_page+1)<cheak_sup_page_sum?cheak_sup_page+1:cheak_sup_page_sum}"><i class="glyphicon glyphicon-menu-right"></i></a></li>
					</ul>
					</footer>


					<!--弹出修改用户窗口-->
					<div class="modal fade" id="reviseUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<form class="form-horizontal" action="AgentXiugai_SupplierXiugai.action">
											<div class="form-group ">
												<label for="sName" class="col-xs-3 control-label">编号：</label>
												<div class="col-xs-8 ">
													<input type="number" class="form-control input-sm duiqi"
														id="snum" name="snum" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sLink" class="col-xs-3 control-label">账号：</label>
												<div class="col-xs-8 ">
													<input type="text" class="form-control input-sm duiqi"
														id="susername" name="susername" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sOrd" class="col-xs-3 control-label">商店名称：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="sname" name="sname" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">电话：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="stel" name="stel" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">地址：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="saddr" name="saddr" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">执照号：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="slicense" name="slicense" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">法人姓名：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="slegalname" name="slegalname" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">银行卡号：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="sbankaccount" name="sbankaccount" placeholder="">
												</div>
											</div>
											<div class="form-group">
												<label for="sKnot" class="col-xs-3 control-label">支付宝账号：</label>
												<div class="col-xs-8">
													<input type="text" class="form-control input-sm duiqi"
														id="sapayaccount" name="sapayaccount" placeholder="">
												</div>
											</div>
											<input type="hidden" id="sid" name="sid">
											<input type="hidden" name="pagetype" value="'不可用'">
											<input type="hidden" name="actiontype" value="1">
											<input type="hidden" name="page" value="${cheak_sup_page}">
											<div class="form-group">
												<label for="situation" class="col-xs-3 control-label">状态：</label>
												<div class="col-xs-8">
													<label class="control-label" for="anniu"> <input
														type="radio" name="ssta" value="可用" id="normal">正常
													</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
														class="control-label" for="meun"> <input
														type="radio" name="ssta" value="不可用" id="forbid">禁用
													</label>
												</div>
											</div>
											<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="submit" class="btn btn-xs btn-green">保 存</button>
								</div>
										</form>
									</div>
								</div>
								
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

					<!--弹出删除用户警告窗口-->
					<div class="modal fade" id="deleteUser" role="dialog"
						aria-labelledby="gridSystemModalLabel">
						<form class="form-horizontal" action="AgentXiugai_SupplierXiugai.action">
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
									<div class="container-fluid">确定要删除该用户？删除后不可恢复！</div>
								</div>
								<input type="hidden" id="delesid" name="sid" type="number">
								<input type="hidden" name="actiontype" value="0">
								<input type="hidden" name="pagetype" value="'可用'">
								<input type="hidden" name="page" value="${cheak_sup_page}">
								<div class="modal-footer">
									<button type="button" class="btn btn-xs btn-white"
										data-dismiss="modal">取 消</button>
									<button type="submit" class="btn  btn-xs btn-danger">删除</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						</form>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->

				</div>
     </div>
     </div>
	<script src="js/jquery.nouislider.js"></script>

	<!-- this page specific inline scripts -->
	<script>
		//min/max slider
		function huadong(my, unit, def, max) {
			$(my).noUiSlider(
					{
						range : [ 0, max ],
						start : [ def ],
						handles : 1,
						connect : 'upper',
						slide : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
							console.log($(this).find(".noUi-handle").parent()
									.parent().html());
						},
						set : function() {
							var val = Math.floor($(this).val());
							$(this).find(".noUi-handle").text(val + unit);
						}
					});
			$(my).val(def, true);
		}
		huadong('.slider-minmax1', "分钟", "5", 30);
		huadong('.slider-minmax2', "分钟", "6", 15);
		huadong('.slider-minmax3', "分钟", "10", 60);
		huadong('.slider-minmax4', "次", "2", 10);
		huadong('.slider-minmax5', "天", "3", 7);
		huadong('.slider-minmax6', "天", "8", 10);
		
		function jumppage(){
			/* var page=$("#jumppage").val();  
        	location.href="AgentJump_ToCheakSupplier.action?pagetype='不可用'&page="+page; */
		}
		
		function modify(index){
			
			var order = eval('');
			$("#sid").val(order[index].sid);
			$("#snum").val(order[index].snum);
			$("#susername").val(order[index].susername);
			$("#sname").val(order[index].sname);
			$("#stel").val(order[index].stel);
			$("#saddr").val(order[index].saddr);
			$("#slicense").val(order[index].slicense);
			$("#slegalname").val(order[index].slegalname);
			$("#sbankaccount").val(order[index].sbankaccount);
			$("#sapayaccount").val(order[index].sapayaccount);
		}
		
		function deletesup(index){
			$("#delesid").val(index);
		}
	</script>
</body>
</html>
