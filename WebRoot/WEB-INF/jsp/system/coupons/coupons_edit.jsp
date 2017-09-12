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
					<form action="coupons/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name=COUPONSID id="COUPONS_ID" value="${pd.COUPONSID}"/>
						<input type="hidden" name=COUPONSTOTALNUM id="COUPONSTOTALNUM" value="${pd.COUPONSTOTALNUM}"/>
						<input type="hidden" name=COUPONSUSENUM id="COUPONSUSENUM" value="${pd.COUPONSUSENUM}"/>
						<c:choose>
						<c:when test="${pd.DENOMINATION==null || pd.DENOMINATION==''}">
						<input type="hidden" name=DENOMINATION id="DENOMINATION"  value="0"/>
						</c:when>
						<c:otherwise>
						<input type="hidden" name=DENOMINATION id="DENOMINATION"  value="${pd.DENOMINATION}"/>
						</c:otherwise>
						</c:choose>
						
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">优惠券类型:</td>
								<td>
								<select
											class="chosen-select form-control" data="${pd.COUPONSTYPE }"
											name="COUPONSTYPE" id="COUPONSTYPE" data-placeholder="请选择"
											style="vertical-align:top;width: 120px;">
												<!-- 开始循环 -->
													<c:choose>
														<c:when test="${not empty typeList}">
															<c:forEach items="${typeList}" var="t" varStatus="vst">
																<option value="${t.ID }">${t.TYPENAME }</option>
															</c:forEach>
														</c:when>
													</c:choose>
										</select>
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">优惠券名称:</td>
								<td><input type="text" name="COUPONSNAME" id="COUPONSNAME" value="${pd.COUPONSNAME}" maxlength="200" placeholder="这里输入优惠券名称" title="优惠券名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">有效期:</td>
								<td>
								<c:choose>
    							<c:when test="${pd.VALIDITY=='' || pd.VALIDITY==null}">
    							<input type="number" min="0" name="VALIDITY" id="VALIDITY" value="0" maxlength="11" placeholder="这里输入有效期" title="有效期" style="width:120px;"/>
    							</c:when>
    							<c:otherwise>
    							<input type="number" min="0" name="VALIDITY" id="VALIDITY" value="${pd.VALIDITY}" maxlength="11" placeholder="这里输入有效期" title="有效期" style="width:120px;"/>
							    </c:otherwise>
    							</c:choose>
    							天
								</td>
							</tr>
							<tr>
								<td style="width:120px;text-align: right;padding-top: 13px;">状态:</td>
								<td>
								<select
											class="chosen-select form-control" data="${pd.COUPONSSTATE }"
											name="COUPONSSTATE" id="COUPONSSTATE" data-placeholder="请选择"
											style="vertical-align:top;width: 120px;">
												<!-- 开始循环 -->
												<c:choose>
													<c:when test="${not empty stateList}">
														<c:forEach items="${stateList}" var="s" varStatus="vss">
															<option value="${s.ID }">${s.NAME }</option>
														</c:forEach>
													</c:when>
												</c:choose>
										</select>
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
			if($("#COUPONSTYPE").val()==""){
				$("#COUPONSTYPE").tips({
					side:3,
		            msg:'请输入优惠券类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPONSTYPE").focus();
			return false;
			}
			if($("#COUPONSNAME").val()==""){
				$("#COUPONSNAME").tips({
					side:3,
		            msg:'请输入优惠券名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPONSNAME").focus();
			return false;
			}
			if($("#VALIDITY").val()==""){
				$("#VALIDITY").tips({
					side:3,
		            msg:'请输入有效期',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#VALIDITY").focus();
			return false;
			}
			if($("#COUPONSSTATE").val()==""){
				$("#COUPONSSTATE").tips({
					side:3,
		            msg:'请输入状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUPONSSTATE").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			if ($("#COUPONSTYPE").attr('data') != ''
				&& $("#COUPONSTYPE").attr('data') != -1) {
			$("#COUPONSTYPE").val($("#COUPONSTYPE").attr('data'));
			}
			if ($("#COUPONSSTATE").attr('data') != ''
					&& $("#COUPONSSTATE").attr('data') != -1) {
				$("#COUPONSSTATE").val($("#COUPONSSTATE").attr('data'));
			}
		});
		</script>
</body>
</html>