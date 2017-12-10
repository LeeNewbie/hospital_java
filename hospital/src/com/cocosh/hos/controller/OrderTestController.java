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
import com.cocosh.hos.model.OrderTest;
import com.cocosh.hos.service.OrderTestService;

@Controller
@RequestMapping("manage/ordertest")
public class OrderTestController extends BaseController {
	@Autowired
	private OrderTestService service;

	@RequiresPermissions("manage:ordertest:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<OrderTest> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "ordertest/list";
	}
	
	@RequiresPermissions("manage:ordertest:add")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model) {
		return "ordertest/add";
	}

	@RequiresPermissions("manage:ordertest:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(OrderTest po) {
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:ordertest:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("ordertest",service.queryById(id));
		return "ordertest/update";
	}

	@RequiresPermissions("manage:ordertest:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(OrderTest po) {
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:ordertest:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
}
