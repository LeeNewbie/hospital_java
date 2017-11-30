package com.cocosh.sys.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cocosh.framework.base.AjaxResult;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.base.BaseController;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.util.SecurityUtil;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.sys.model.User;
import com.cocosh.sys.service.DepartService;
import com.cocosh.sys.service.RoleService;
import com.cocosh.sys.service.UserService;

@Controller
@RequestMapping("manage/user")
public class UserController extends BaseController {
	@Autowired
	private UserService service;
	@Autowired
	private RoleService roleService;
	@Autowired
	private DepartService departService;
	
	@RequiresPermissions("manage:user:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<User> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "sys/user/list";
	}
	
	@RequiresPermissions("manage:user:add")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model){
		model.addAttribute("depart", departService.queryParent());
		model.addAttribute("roles",roleService.queryAll());
		return "sys/user/add";
	}

	@RequiresPermissions("manage:user:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(User user) {
		User u=service.queryByUsername(user.getUsername());
		if(u==null){
			if(!StringUtil.isEmpty(user.getMobile())){
				if(service.queryByMobile(user.getMobile())!=null){
					return new AjaxResult("-1","手机号已存在");
				}
			}
			if (service.add(user)) {
				return new AjaxResult("0");
			}else {
				return new AjaxResult("1");
			}
		}
		return new AjaxResult("-1","用户名已存在");
	}

	@RequiresPermissions("manage:user:del")
	@RequestMapping("del/{flg}/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable Integer flg,@PathVariable String id) {
		if (service.del(flg,id)) {
			return new AjaxResult("0", "");
		}
		return new AjaxResult("1","");
	}

	@RequiresPermissions("manage:user:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("user", service.queryById(id));
		model.addAttribute("roles",roleService.queryAll());
		model.addAttribute("depart", departService.queryParent());
		return "sys/user/update";
	}
	
	@RequiresPermissions("manage:user:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(User user) {
		if(!StringUtil.isEmpty(user.getUsername())){
			User quser=service.queryByUsername(user.getUsername());
			if(quser!=null&&!quser.getId().equals(user.getId())){
				return new AjaxResult("-1", "用户名已存在");
			}
		}
		if(!StringUtil.isEmpty(user.getMobile())){
			User u=service.queryByMobile(user.getMobile());
			if(u!=null&&!u.getId().equals(user.getId())){
				return new AjaxResult("-1","手机号已存在");
			}
		}
		if (service.update(user)) {
			return new AjaxResult("0","");
		}
		return new AjaxResult("1", "");
	}
	
	/**
	 * 设置个人信息
	 */
	@RequestMapping("setUp")
	@ResponseBody
	public AjaxResult setUp(HttpServletRequest req){
		User user=service.queryUserById(getUser().getId());
		String oriPwd=req.getParameter("oriPwd");
		String newPwd=req.getParameter("newPwd");
		String rePwd=req.getParameter("rePwd");
		if (!user.getPassword().equals(SecurityUtil.md5(oriPwd))) {
			return new AjaxResult("1","修改失败：原密码不正确");
		}
		if (!newPwd.equals(rePwd)) {
			return new AjaxResult("1","修改失败：确认密码不正确");
		}
		User upd=new User();
		upd.setId(user.getId());
		upd.setHead_img(req.getParameter("headImg"));
		upd.setPassword(SecurityUtil.md5(newPwd));
		service.modifyUser(upd);
		return new AjaxResult("0","修改成功,请重新登录");
	}
	
}
