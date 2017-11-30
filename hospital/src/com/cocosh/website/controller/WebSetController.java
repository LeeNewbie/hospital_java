package com.cocosh.website.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.base.BaseController;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.payment.wxap.HttpsUtil;
import com.cocosh.framework.payment.wxap.WXConfig;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.sys.model.News;
import com.cocosh.sys.model.User;
import com.cocosh.sys.service.NewsService;
import com.cocosh.sys.service.UserService;

@Controller
@RequestMapping("/")
public class WebSetController extends BaseController {
	@Autowired
	private NewsService service;
	@Autowired
	private UserService userService;

	@RequestMapping("index")
	public String index(HttpServletRequest request,HttpServletResponse response) {
		return "website/index";
	}

	@RequestMapping("joinus")
	public String joinus() {
		return "website/joinus";
	}
	
	@RequestMapping("newsList")
	public String newsList(Model model,BaseConditionVO vo) {
		vo.setPageSize(5);
		vo.setEnabled("0");
		Page<News> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "website/news_list";
	}
	
	@RequestMapping("newsDetail/{id}")
	public String newsDetail(@PathVariable String id,Model model) {
		model.addAttribute("detail",service.queryById(id));
		return "website/news_detail";
	}
	
	@RequestMapping("download")
	public String download() {
		return "website/download";
	}
	//后期去掉这个页面（写入缓存）
	@RequestMapping(value ="toregister")  
	 public String toregister(HttpServletRequest request,HttpServletResponse response){  
		writeCookie(request, response, "wapuser", "8e14af8cc94d43f0ba8de09395867880", 3600 * 24 * 7);
		 return "wap/toregister";
	 }
	//后期添加20170816
	//没有权限
	 @RequestMapping(value ="noperm")  
	 public String noPerm(HttpServletRequest request){  
		 return "wap/noperm";
	 }
	 //去登陆
	 @RequestMapping(value ="tologin")  
	 public String tologin(){  
		 return "wap/tologin";
	 }
	 
	 //写入缓存
	 @RequestMapping(value ="login")  
	 public String login(HttpServletRequest request,HttpServletResponse response){  
		 String code=request.getParameter("code");
		 JSONObject getJson = HttpsUtil.gainToken(WXConfig.COMPANY_ACCESS_TOKEN_URL+"corpid="+WXConfig.CorpID+"&corpsecret="+WXConfig.Secret);
		if(getJson!=null){
			String access_token=getJson.getString("access_token");
			if(!StringUtil.isEmpty(access_token)){
				//获取userid
				JSONObject getJson2 = HttpsUtil.gainToken(WXConfig.USERINFO+"access_token="+access_token+"&code="+code);
				if(getJson2.has("UserId")){
				  String UserId=getJson2.getString("UserId");
				  System.out.println("UserId:"+UserId);//判断是不是企业用户
				  writeCookie(request, response, "UserId", UserId, 3600 * 24 * 7);
				  User user=userService.queryByUserId(UserId);
				  if(user!=null){
					  writeCookie(request, response, "wapuser", user.getId(), 3600 * 24 * 7);
					  return "redirect:/wap/index";
				  }else{
					  return "wap/toregister";
				  }
				}
			}
		}
		return "wap/noperm";
	 }
}
