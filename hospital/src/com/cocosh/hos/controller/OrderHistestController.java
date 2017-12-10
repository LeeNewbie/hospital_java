package com.cocosh.hos.controller;

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
import com.cocosh.hos.model.OrderHistest;
import com.cocosh.hos.service.OrderHistestService;

@Controller
@RequestMapping("manage/orderhistest")
public class OrderHistestController extends BaseController {
	@Autowired
	private OrderHistestService service;

	@RequiresPermissions("manage:orderhistest:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<OrderHistest> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "orderhistest/list";
	}
	
	@RequiresPermissions("manage:orderhistest:add")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model) {
		return "orderhistest/add";
	}

	@RequiresPermissions("manage:orderhistest:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(OrderHistest po) {
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:orderhistest:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("orderhistest",service.queryById(id));
		return "orderhistest/update";
	}

	@RequiresPermissions("manage:orderhistest:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(OrderHistest po) {
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:orderhistest:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
}
