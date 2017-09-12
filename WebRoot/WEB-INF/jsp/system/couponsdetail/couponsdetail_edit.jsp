<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					
					<form action="couponsdetail/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="COUPONSID" id="COUPONSID" value="${pd.COUPONSID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">添加优惠券张数:</td>
								<td><input type="number" min="1" max="1000" name="CREATENUM" id="CREATENUM" value="${pd.CREATENUM}" maxlength="11" placeholder="这里输入添加优惠券张数" title="添加优惠券张数" style="width:200px;"/></td>
							</tr>
							<tr>
								<td style="width:180px;text-align: right;padding-top: 13px;">优惠券面值:</td>
								<td>
								<input
												onkeypress='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												onkeyup='if(!this.value.match(/^[\+\-]?\d*?\.?\d*?$/))this.value=this.t_value;else this.t_value=this.value;if(this.value.match(/^(?:[\+\-]?\d+(?:\.\d+)?)?$/))this.o_value=this.value'
												type="text" name="DENOMINATION" id="DENOMINATION"
												<c:choose>
												<c:when test="${pd.DENOMINATION == null ||  pd.DENOMINATION==''}">
												value="0"
												</c:when>
												<c:otherwise>
												value="${pd.DENOMINATION}"
												</c:otherwise>
												</c:choose>
												maxlength="10" placeholder="这里输入优惠券面值" title="优惠券面值" style="width:120px;" />
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
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
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#ID").val()==""){
				$("#ID").tips({
					side:3,
		            msg:'请输入主键',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ID").focus();
			return false;
			}
			if($("#COUPONSID").val()==""){
				$("#COUPONSID").tips({
					side:3,
		            msg:'请输入优惠券主表标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPONSID").focus();
			return false;
			}
			if($("#NUMBERS").val()==""){
				$("#NUMBERS").tips({
					side:3,
		            msg:'请输入优惠券码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NUMBERS").focus();
			return false;
			}
			if($("#DENOMINATION").val()==""){
				$("#DENOMINATION").tips({
					side:3,
		            msg:'请输入面值',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DENOMINATION").focus();
			return false;
			}
			if($("#QRCODE").val()==""){
				$("#QRCODE").tips({
					side:3,
		            msg:'请输入二维码存储路径',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QRCODE").focus();
			return false;
			}
			if($("#MEMBERID").val()==""){
				$("#MEMBERID").tips({
					side:3,
		            msg:'请输入会员标识',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#MEMBERID").focus();
			return false;
			}
			if($("#STATEID").val()==""){
				$("#STATEID").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATEID").focus();
			return false;
			}
			if($("#CREATEDATE").val()==""){
				$("#CREATEDATE").tips({
					side:3,
		            msg:'请输入创建时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATEDATE").focus();
			return false;
			}
			if($("#EDITDATE").val()==""){
				$("#EDITDATE").tips({
					side:3,
		            msg:'请输入编辑时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EDITDATE").focus();
			return false;
			}
			if($("#ACQUIREDATE").val()==""){
				$("#ACQUIREDATE").tips({
					side:3,
		            msg:'请输入备注10',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ACQUIREDATE").focus();
			return false;
			}
			if($("#ENDDATE").val()==""){
				$("#ENDDATE").tips({
					side:3,
		            msg:'请输入有效截止日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ENDDATE").focus();
			return false;
			}
			if($("#USEDATE").val()==""){
				$("#USEDATE").tips({
					side:3,
		            msg:'请输入使用日期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USEDATE").focus();
			return false;
			}
			if($("#USERREMARK").val()==""){
				$("#USERREMARK").tips({
					side:3,
		            msg:'请输入使用备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#USERREMARK").focus();
			return false;
			}
			if($("#REMARKS").val()==""){
				$("#REMARKS").tips({
					side:3,
		            msg:'请输入操作备注',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REMARKS").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>