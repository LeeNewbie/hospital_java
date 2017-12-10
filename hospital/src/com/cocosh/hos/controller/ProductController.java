package com.cocosh.hos.controller;

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
import com.cocosh.framework.mybatis.Page;
import com.cocosh.hos.model.Product;
import com.cocosh.hos.service.ProductService;

@Controller
@RequestMapping("manage/product")
public class ProductController extends BaseController {
	@Autowired
	private ProductService service;

	@RequiresPermissions("manage:product:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<Product> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "hos/product/list";
	}
	
	@RequiresPermissions("manage:product:add")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model) {
		return "hos/product/add";
	}

	@RequiresPermissions("manage:product:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(Product po) {
		List<Product> list=service.query(po);
		if(list.size()>0) return new AjaxResult("2");
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:product:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("product",service.queryById(id));
		return "hos/product/update";
	}

	@RequiresPermissions("manage:product:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(Product po) {
		List<Product> list=service.query(po);
		if(list.size()>0&&(!po.getId().equals(list.get(0).getId()))) return new AjaxResult("2");
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:product:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
	
	@RequestMapping("queryByName/{name}")
	@ResponseBody
	public List<Product> queryByName(@PathVariable String name) {
		return service.queryByName(name);
	}
	
	
}
