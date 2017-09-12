package com.fh.interceptor;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fh.entity.Member;
import com.fh.service.system.member.MemberManager;
import com.fh.service.system.memberlog.MemberLogManager;
import com.fh.util.Const;
import com.fh.util.Convert;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.PublicUtil;
import com.fh.util.Tools;
import com.fh.wechat.gongzhong.UserManage;
import com.fh.wechat.gongzhong.WebOAuthManage;
import com.fh.wechat.gongzhong.vo.user.UserInfo;

/**
 * 
* 类名称：微信授权拦截器
* 类描述： 
* @author lukas 414024003@qq.com
* 作者单位： 
* 联系方式：
* 创建时间：2015年11月2日
* @version 1.6
 */
public class WeChatHandlerInterceptor extends HandlerInterceptorAdapter{
	
	protected Logger logger = Logger.getLogger(this.getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String basePath = getRequertUrl(request);
		logger.info("请求访问的URL====>-----------basePath:"+basePath);
		System.err.println("请求访问的URL====>-----------basePath:"+basePath);
		String path = request.getServletPath().substring(1,request.getServletPath().length());
		if(request.getQueryString()!=null){
			path+="?" + request.getQueryString();
		}
		Session session = Jurisdiction.getSession();
		logger.info("请求访问的URL====>-----------path:"+path);
		String posturl =basePath+path;
		// 获取浏览器对象
		String ua = request.getHeader("user-agent").toLowerCase();
		Member member = new Member();
		// 判断是否是微信浏览器
		if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
			// 如果是微信浏览器session未空或者取消授权，重定向到授权页面
			if(session.getAttribute(Const.SESSION_WECHATUSER) == null){
				logger.info("需要进行授权！");		
				 posturl = WebOAuthManage.getBaseOauth2Url(basePath+ "oAuthManage/index.do", basePath+path);
				logger.info("未编码微信授权链接====>" + posturl);
				System.err.println("未编码微信授权链接====>" + posturl);
				response.sendRedirect(posturl);
				return false;
			}
			if (session.getAttribute(Const.SESSION_MEMBER) == null){
				UserInfo userInfo = (UserInfo) session.getAttribute(Const.SESSION_WECHATUSER);
				logger.info("未编码userInfouserInfo信授权链接====>" + userInfo.getNickname());
//				if (session.getAttribute(Const.SESSION_MEMBER) == null  && Tools.notEmpty(userInfo.getOpenid())) {
//					PageData pd = new PageData();
//					pd.put("OPENID", userInfo.getOpenid());
//					pd = memberService.findByOpenId(pd);
//					logger.info("=="+pd);
//					if(pd!=null){
//						logger.info("=====================");
//						String openId = pd.getString("OPENID");
//						member.setCity(pd.getString("CITY"));
//						member.setCountry(pd.getString("COUNTRY"));
//						member.setHeadImgUrl(pd.getString("HEADIMGURL"));
//						member.setLanguage(pd.getString("LANGUAGE"));
//						member.setMemberId(pd.getString("MEMBERID"));
//						member.setMemberType(pd.getInt("MEMBERTYPE"));
//						member.setOpenId(pd.getString("OPENID"));
//						member.setProvince(pd.getString("PROVINCE"));
//						member.setSex(pd.getInt("SEX"));
//						member.setWeChatName(pd.getString("WECHATNAME"));
//						//保存用户基本信息
//						session.setAttribute(Const.SESSION_MEMBER, member);
//						pd = new PageData();
//						pd.put("LOGTYPE", 1);
//						pd.put("CONTENTS", member.getWeChatName()+"[登录]");
//						pd.put("CREATEDATE", new Date());
//						String addr = request.getRemoteAddr();
//						//pd.put("LOGIP", PublicUtil.getIp());
//						pd.put("LOGIP", addr);
//						pd.put("MEMBERID", member.getMemberId());
//						PageData m = new PageData();
//						m.put("LASTIP", PublicUtil.getIp());
//						m.put("LASTDATE", new Date());
//						m.put("OPENID", member.getOpenId());
//						memberlogService.save(pd,m);//保存登录记录
//						
//						
//						PageData mPd = new PageData();
//						mPd.put("LASTIP", addr);
//						mPd.put("LASTDATE", new Date());
//						mPd.put("OPENID", openId);
//						memberService.editLoginInfo(mPd);
//						logger.info("更新用户信息");
//					}
//					
//				}
				return true;
			}
			
		}else{
			logger.info("非微信浏览器");		
			UserInfo userInfo  = new UserInfo();
			//用于本地调试进行模拟，正式环境注释该模块
//			if (session.getAttribute(Const.SESSION_WECHATUSER) == null) {
//				if(basePath.contains("localhost") || basePath.contains("ddj.java.1yg.tv")){
//					 userInfo = (UserInfo) UserManage.getUserInfo("oJ0qCtzS5uv83EC30B0NgVmlywE0");
//				}else{
//					 userInfo = (UserInfo) UserManage.getUserInfo("oXeXowU94y21bfSd5mOtqbPr8hzY");
//				}
//				session.setAttribute(Const.SESSION_WECHATUSER, userInfo);
//				logger.info("微信昵称-------" + userInfo.getNickname());
//			} 
//			
			//用于本地调试进行模拟，正式环境注释该模块
			posturl=getRequertUrl(request)+"frontStore/er.html";
			response.sendRedirect(posturl);
			return false;
		}
		return true;
	}
	
	
	/**
	 * 获取项目虚拟地址
	 * @return
	 */
	public String getRequertUrl(HttpServletRequest request){
	   String basePath = request.getScheme()+"://"+request.getServerName();
	   if(request.getServerPort()==8080){
		   basePath+=":"+request.getServerPort()+request.getContextPath()+"/";
	   }else{
		   basePath+=request.getContextPath()+"/";
	   }
	   return basePath;
	}
	
}
