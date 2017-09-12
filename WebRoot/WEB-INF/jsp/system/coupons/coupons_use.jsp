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
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
						   <c:if test="${isUse==1 }">
						   <tr style="vertical-align: middle;">
								<td style="width:120px;text-align: right;padding-top: 13px;">温馨提示:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								${msg}
								</td>
							</tr>
						   </c:if>
							
							<tr style="vertical-align: middle;">
								<td style="width:120px;text-align: right;padding-top: 13px;">优惠券类型:</td>
								<td style="vertical-align: middle;">
								${pd.typeName}
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">优惠券名称:</td>
								<td style="vertical-align: middle;">
								${pd.couponsName}
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">优惠券编号:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								${pd.numbers}
								</td>
							</tr>
							<tr>
								<td style="width:180px;text-align: right;padding-top: 13px;">优惠券面值:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								${pd.denomination}
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">状态:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								${pd.stateDetailName }
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">获取日期:</td>
								<td style="vertical-align: middle;">
								<fmt:formatDate value="${pd.acquireDate}" pattern="yyyy-MM-dd"  />
								</td>
							</tr>
							<tr>
								<td style="width:180px;text-align: right;padding-top: 13px;">有效期:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
    							${pd.validity}天
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">截止过期日期:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								<fmt:formatDate value="${pd.endDate}" pattern="yyyy-MM-dd"  />
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">使用日期:</td>
								<td style="vertical-align: middle;color: #f60;font-weight: bold;">
								<fmt:formatDate value="${pd.useDate}" pattern="yyyy-MM-dd HH:mm:ss"  />
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">会员昵称:</td>
								<td style="vertical-align: middle;">
								${pd.weChatName}
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">会员手机号:</td>
								<td style="vertical-align: middle;">
								${pd.phoneNumber}
								</td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-danger" onclick="goback();">返回</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
		//返回
		function goback(){
			top.jzts();
			window.location.href="<%=basePath%>coupons/list.do";
		}
		</script>
</body>
</html>