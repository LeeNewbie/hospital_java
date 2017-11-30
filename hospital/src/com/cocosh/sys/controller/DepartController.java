package com.cocosh.sys.controller;

import java.util.List;

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
import com.cocosh.sys.model.Depart;
import com.cocosh.sys.service.DepartService;
import com.cocosh.sys.service.UserService;

@Controller
@RequestMapping("manage/depart")
public class DepartController extends BaseController {
	@Autowired
	private DepartService service;
	@Autowired
	private UserService  userService;

	@RequiresPermissions("manage:depart:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Depart depart=service.querySelfAndChild();
		model.addAttribute("depart", depart);
		model.addAttribute("vo", vo);
		return "sys/depart/list";
	}
	
	@RequiresPermissions("manage:depart:add")
	@RequestMapping(value="add/{parent_id}/{grade}",method=RequestMethod.GET)
	public String add(Model model,@PathVariable String parent_id,@PathVariable Integer grade) {
		model.addAttribute("parent_id", parent_id);
		model.addAttribute("grade", grade);
		return "sys/depart/add";
	}

	@RequiresPermissions("manage:depart:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(Depart po) {
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:depart:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("depart",service.queryById(id));
		return "sys/depart/update";
	}

	@RequiresPermissions("manage:depart:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(Depart po) {
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}
	
	@RequiresPermissions("manage:depart:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		//删除的时候先验证
		List<Depart> list=service.queryChild(id);
		if(list.size()>0){
			return new AjaxResult("-1");//有孩子啊没有删除
		}
		//该部门有会员存在
		if(userService.validExist(id)){
			return new AjaxResult("-2");//该部门有会员存在
		}
		if (service.del_true(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:dot:del")
	@RequestMapping("del/{flg}/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable Integer flg,@PathVariable String id) {
		if (service.del(flg,id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
}
