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
import com.cocosh.hos.model.Hlabel;
import com.cocosh.hos.model.Product;
import com.cocosh.hos.service.HlabelService;

@Controller
@RequestMapping("manage/hlabel")
public class HlabelController extends BaseController {
	@Autowired
	private HlabelService service;

	@RequiresPermissions("manage:hlabel:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<Hlabel> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "hos/hlabel/list";
	}
	
	@RequiresPermissions("manage:hlabel:add")
	@RequestMapping(value="add/{pid}",method=RequestMethod.GET)
	public String add(Model model,@PathVariable String pid) {
		model.addAttribute("pid", pid);
		model.addAttribute("plist", service.queryByPid("0"));
		return "hos/hlabel/add";
	}

	@RequiresPermissions("manage:hlabel:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(Hlabel po) {
		Hlabel query=service.queryByPidAndName(po.getPid(), po.getName());
		if(query!=null) return  new AjaxResult("2");
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:hlabel:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		model.addAttribute("hlabel",service.queryById(id));
		model.addAttribute("plist", service.queryByPid("0"));
		return "hos/hlabel/update";
	}

	@RequiresPermissions("manage:hlabel:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(Hlabel po) {
		Hlabel query=service.queryByPidAndName(po.getPid(), po.getName());
		if(query!=null&&(!query.getId().equals(po.getId()))){
			return new AjaxResult("2");
		}
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:hlabel:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
	
	@RequestMapping("queryByPid/{pid}")
	@ResponseBody
	public List<Hlabel> queryByPid(@PathVariable String pid) {
		return service.queryByPid(pid);
	}
}
