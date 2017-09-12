<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<form action="product/${msg }.do" name="Form" id="Form"
								method="post">
								<input type="hidden" name="PRODUCTID" id="PRODUCTID"
									value="${pd.PRODUCTID}" /> <input type="hidden" name="PROURL"
									id="PROURL" value="${pd.PROURL}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品类型:</td>
											<td><select class="chosen-select form-control"
												data="${pd.PROTYPE}" name="PROTYPE" id="PROTYPE"
												data-placeholder="请选择"
												style="vertical-align:top;width: 120px;">
													<!-- 开始循环 -->
													<c:choose>
														<c:when test="${not empty proTypeList}">
															<c:forEach items="${proTypeList}" var="t" varStatus="vst">
																<option value="${t.ID }">${t.TYPENAME }</option>
															</c:forEach>
														</c:when>
													</c:choose>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品名称:</td>
											<td><input type="text" name="PRONAME" id="PRONAME"
												value="${pd.PRONAME}" maxlength="50" placeholder="这里输入产品名称"
												title="产品名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品金额:</td>
											<td><input
												onkeypress='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												onkeyup='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												type="text" name="PROMONEY" id="PROMONEY"
												value="${pd.PROMONEY}" maxlength="32" placeholder="这里输入金额"
												title="金额" style="width:120px;" /></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品预付金额:</td>
											<td><input
												onkeypress='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												onkeyup='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												type="text" name="PROADVANCEMONEY" id="PROADVANCEMONEY"
												value="${pd.PROADVANCEMONEY}" maxlength="32"
												placeholder="这里输入预付金额" title="预付金额" style="width:120px;" />
											</td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品标题:</td>
											<td><input type="text" name="PROTITLE" id="PROTITLE"
												value="${pd.PROTITLE}" maxlength="200"
												placeholder="这里输入产品标题" title="产品标题" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品描述:</td>
											<td><input type="text" name="PRODESCRIPTION"
												id="PRODESCRIPTION" value="${pd.PRODESCRIPTION}"
												maxlength="500" placeholder="这里输入产品描述" title="产品描述"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品封面图片:</td>
											<td>
												<div style="float:left;">
													<c:choose>
														<c:when test="${pd.PROIMG==null || pd.PROIMG==''}">
															<img id="imgLogo"
																src="<%=basePath%>uploadFiles/uploadImgs/kode-icon.png"
																width="100" />
														</c:when>
														<c:otherwise>
															<img id="imgLogo"
																src="<%=basePath%>uploadFiles/uploadImgs/${pd.PROIMG}"
																width="100" />
														</c:otherwise>
													</c:choose>
												</div>
												<div style="clear: both;">
													<input type="file" name="TP_URL" id="uploadify1"
														keepDefaultStyle="true" />
												</div> <input type="hidden" name="PROIMG" id="PROIMG"
												value="${pd.PROIMG }" /> <input type="hidden" value="no"
												id="hasTp1" /></td>
										</tr>
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">内容:</td>
											<td>
												<div id="containerMsg" class="form-group draggable">
													<div class="col-sm-9">
														<div class="ueQ313596790Que"></div>
														<script id="container" type="text/plain"
															style="width:100%;height:400px;"></script>
														<div class="ueQ313596790Que"></div>
													</div>
												</div></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品预订次数:</td>
											<td><c:choose>
													<c:when
														test="${pd.PRORESERVATIONNUM==null || pd.PRORESERVATIONNUM==''}">
														<input type="number" min="0" name="PRORESERVATIONNUM"
															id="PRORESERVATIONNUM" value="0" maxlength="32"
															placeholder="这里输入产品预订次数" title="产品预订次数"
															style="width:120px;" />
													</c:when>
													<c:otherwise>
														<input type="number" min="0" name="PRORESERVATIONNUM"
															id="PRORESERVATIONNUM" value="${pd.PRORESERVATIONNUM}"
															maxlength="32" placeholder="这里输入产品预订次数" title="产品预订次数"
															style="width:120px;" />
													</c:otherwise>
												</c:choose></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品成功消费次数:</td>
											<td><c:choose>
													<c:when
														test="${pd.PROCONSUMENUM==null || pd.PROCONSUMENUM==''}">
														<input type="number" min="0" name="PROCONSUMENUM"
															id="PROCONSUMENUM" value="0" maxlength="32"
															placeholder="这里输入产品成功消费次数" title="产品成功消费次数"
															style="width:120px;" />
													</c:when>
													<c:otherwise>
														<input type="number" min="0" name="PROCONSUMENUM"
															id="PROCONSUMENUM" value="${pd.PROCONSUMENUM}"
															maxlength="32" placeholder="这里输入产品成功消费次数"
															title="产品成功消费次数" style="width:120px;" />
													</c:otherwise>
												</c:choose></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品有效期:</td>
											<td><c:choose>
													<c:when
														test="${pd.PROVALIDITY==null || pd.PROVALIDITY==''}">
														<input type="number" min="0" name="PROVALIDITY"
															id="PROVALIDITY" value="0" maxlength="32"
															placeholder="这里输入产品有效期" title="产品有效期"
															style="width:120px;" />
													</c:when>
													<c:otherwise>
														<input type="number" min="0" name="PROVALIDITY"
															id="PROVALIDITY" value="${pd.PROCONSUMENUM}"
															maxlength="32" placeholder="这里输入产品有效期" title="产品有效期"
															style="width:120px;" />
													</c:otherwise>
												</c:choose></td>
										</tr>
										<tr>
											<td style="width:130px;text-align: right;padding-top: 13px;">产品状态:</td>
											<td><select class="chosen-select form-control"
												data="${pd.PROSTATE}" name="PROSTATE" id="PROSTATE"
												data-placeholder="请选择"
												style="vertical-align:top;width: 120px;">
													<!-- 开始循环 -->
													<c:choose>
														<c:when test="${not empty proStateList}">
															<c:forEach items="${proStateList}" var="s"
																varStatus="vss">
																<option value="${s.ID }">${s.NAME }</option>
															</c:forEach>
														</c:when>
													</c:choose>
											</select></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
												class="btn btn-mini btn-danger"
												onclick="goback();">取消</a>
											</td>
										</tr>
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display:none">
									<br /> <br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green">提交中...</h4>
								</div>
							</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<div id="fwb" style="display: none;">
	  ${pd.PROCONTENT}
	</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 上传图片插件 -->
	<link href="plugins/uploadify/uploadify.css" rel="stylesheet"
		type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript"
		src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<!-- 上传图片插件 -->
	<script type="text/javascript">
var jsessionid = "<%=session.getId()%>"; //勿删，uploadify兼容火狐用到
var locat = "<%=basePath%>";
		//====================上传二维码=================
		$(document)
				.ready(
						function() {
							$("#uploadify1")
									.uploadify(
											{
												'buttonImg' : locat
														+ "/plugins/uploadify/uploadp.png",
												'uploader' : locat
														+ "/plugins/uploadify/uploadify.swf",
												'script' : locat
														+ "/plugins/uploadify/uploadFile.jsp;jsessionid="
														+ jsessionid,
												'cancelImg' : locat
														+ "/plugins/uploadify/cancel.png",
												'folder' : locat
														+ "/uploadFiles/uploadImgs",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
												'queueId' : "fileQueue",
												'queueSizeLimit' : 1,//限制上传文件的数量
												'fileExt' : "*.jpg;*.png;*.gif",//设置可以选择的文件的类型，格式如：'*.jpg;*.png;*.gif'。 *.doc;*.pdf;*.rar
												'fileDesc' : "请选择jpg、png、gif图片",//设置可以选择的文件的类型提示
												//'fileExt'     : '*.jpg;*.gif;*.png',
												//'fileDesc'    : 'Please choose(.JPG, .GIF, .PNG)',
												'auto' : true,
												'multi' : false,//是否允许多文件上传
												'simUploadLimit' : 1,//同时运行上传的进程数量
												'buttonText' : "files",
												'scriptData' : {
													'uploadPath' : '/uploadFiles/uploadImgs/'
												},//{'uploadPath':'/uploadFiles/uploadImgs/','fileNmae':'watermark.png'}这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
												'method' : "GET",
												'onComplete' : function(event,
														queueId, fileObj,
														response, data) {
													$("#PROIMG").val(
															response.trim());
													var loaderUrl = locat
															+ '/uploadFiles/uploadImgs/'
															+ response.trim();
													$("#imgLogo").attr('src',
															loaderUrl);
												},
												'onAllComplete' : function(
														event, data) {
													//$("#Form").submit();
													//$("#zhongxin").hide();
													//$("#zhongxin2").show();
												},
												'onSelect' : function(event,
														queueId, fileObj) {
													$("#hasTp1").val("ok");
												}
											});

						});
		//====================上传图片=================
	</script>
	<!-- 表单构建组建 -->
    <script src="plugins/fhform/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="plugins/fhform/js/content.min.js?v=1.0.0"></script>
    <script src="plugins/fhform/js/jquery-ui-1.10.4.min.js"></script>
    <script src="plugins/fhform/js/beautifyhtml/beautifyhtml.js"></script>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 百度富文本编辑框-->
	<script type="text/javascript">
		$(top.hangge());
		var ue;
		//百度富文本
		setTimeout("ueditor()",500);
		function ueditor(){
			ue =UE.getEditor('container');
			ue.ready(function() {
			    //设置编辑器的内容
			    if('${msg }'!='save' && $("#fwb").html().length>0){
					ue.setContent($("#fwb").html());
			    }
			   
			});
		}
		
		//返回
		function goback(){
			top.jzts();
			window.location.href="<%=basePath%>product/list.do";
		}
		//保存
		function save() {

			if ($("#PROTYPE").val() == "" || $("#PROTYPE").val() == "-1") {
				$("#PROTYPE").tips({
					side : 3,
					msg : '请选择产品类型',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROTYPE").focus();
				return false;
			}
			if ($("#PRONAME").val() == "") {
				$("#PRONAME").tips({
					side : 3,
					msg : '请输入产品名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#PRONAME").focus();
				return false;
			}
			if ($("#PROMONEY").val() == "") {
				$("#PROMONEY").tips({
					side : 3,
					msg : '请输入产品金额',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROMONEY").focus();
				return false;
			}
			if ($("#PROADVANCEMONEY").val() == "") {
				$("#PROADVANCEMONEY").tips({
					side : 3,
					msg : '请输入产品预付金额',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROADVANCEMONEY").focus();
				return false;
			}
			if ($("#PROTITLE").val() == "") {
				$("#PROTITLE").tips({
					side : 3,
					msg : '请输入产品标题',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROTITLE").focus();
				return false;
			}
			if ($("#PRODESCRIPTION").val() == "") {
				$("#PRODESCRIPTION").tips({
					side : 3,
					msg : '请输入产品描述',
					bg : '#AE81FF',
					time : 2
				});
				$("#PRODESCRIPTION").focus();
				return false;
			}
			if ($("#PROIMG").val() == "") {
				$("#imgLogo").tips({
					side : 3,
					msg : '请选产品封面图片',
					bg : '#AE81FF',
					time : 2
				});
				return false;
			}
			if(!ue.hasContents()){
				$("#containerMsg").tips({
					side:3,
		            msg:'请输入内容',
		            bg:'#AE81FF',
		            time:2
		        });
			return false;
			}
			if ($("#PRORESERVATIONNUM").val() == "") {
				$("#PRORESERVATIONNUM").tips({
					side : 3,
					msg : '请输入产品预订次数',
					bg : '#AE81FF',
					time : 2
				});
				$("#PRORESERVATIONNUM").focus();
				return false;
			}
			if ($("#PROCONSUMENUM").val() == "") {
				$("#PROCONSUMENUM").tips({
					side : 3,
					msg : '请输入产品成功消费次数',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROCONSUMENUM").focus();
				return false;
			}
			if ($("#PROVALIDITY").val() == "") {
				$("#PROVALIDITY").tips({
					side : 3,
					msg : '请输入产品有效期',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROVALIDITY").focus();
				return false;
			}
			if ($("#PROSTATE").val() == "" || $("#PROSTATE").val() == "-1") {
				$("#PROSTATE").tips({
					side : 3,
					msg : '请选择产品状态',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROSTATE").focus();
				return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			if ($("#PROTYPE").attr('data') != ''
					&& $("#PROTYPE").attr('data') != -1) {
				$("#PROTYPE").val($("#PROTYPE").attr('data'));
			}
			if ($("#PROSTATE").attr('data') != ''
					&& $("#PROSTATE").attr('data') != -1) {
				$("#PROSTATE").val($("#PROSTATE").attr('data'));
			}
		});
	</script>
</body>
</html>