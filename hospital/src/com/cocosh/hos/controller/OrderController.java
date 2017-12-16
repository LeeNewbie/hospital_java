package com.cocosh.hos.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cocosh.framework.base.AjaxResult;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.base.BaseController;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.util.JsonUtil;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.model.Hlabel;
import com.cocosh.hos.model.Order;
import com.cocosh.hos.service.HlabelService;
import com.cocosh.hos.service.OrderHistestService;
import com.cocosh.hos.service.OrderService;
import com.cocosh.hos.service.OrderTestService;
import com.cocosh.hos.service.ProductService;
import com.cocosh.hos.service.impl.OrderHlabelServiceImpl;

@Controller
@RequestMapping("manage/order")
public class OrderController extends BaseController {
	@Autowired
	private OrderService service;
	@Autowired
	private ProductService productService;
	@Autowired
	private HlabelService hlabelService;
	@Autowired
	private OrderTestService testService;
	@Autowired
	private OrderHistestService histestService;
	@Autowired
	private OrderHlabelServiceImpl orderhlabelService;

	@RequiresPermissions("manage:order:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<Order> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "hos/order/list";
	}
	
	@RequiresPermissions("manage:order:add")
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute("plist", productService.queryGroupName());
		List<Hlabel> phlabels=hlabelService.queryByPid("0");
		model.addAttribute("phlabels", JsonUtil.obj2json(phlabels));
		if(phlabels.size()>0){
			model.addAttribute("hlabels", JsonUtil.obj2json(hlabelService.queryByPid(phlabels.get(0).getId())));
		}
		return "hos/order/add";
	}

	@RequiresPermissions("manage:order:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(@RequestBody Order po) {
		if(StringUtil.isEmpty(po.getSn())||StringUtil.isEmpty(po.getMachine_sn())){
			return new AjaxResult("2","病历号和机器序列号不能为空");
		}
		if(service.queryBySn(po.getSn())!=null){
			return new AjaxResult("2","病历号已存在");
		}
		if(service.queryByMachine_sn(po.getMachine_sn())!=null){
			return new AjaxResult("2","机器序列号已存在");
		}
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:order:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		Order order=service.queryById(id);
		model.addAttribute("order",order);
		model.addAttribute("ordertest",testService.queryByOrderId(id));
		model.addAttribute("histests", histestService.queryByOrderId(id));
		model.addAttribute("plist", productService.queryGroupName());
		model.addAttribute("product", productService.queryById(order.getProduct_id()));
		model.addAttribute("orderhlabels", orderhlabelService.queryByOrderId(id));
		List<Hlabel> phlabels=hlabelService.queryByPid("0");
		model.addAttribute("parent_hlabels", phlabels);
		model.addAttribute("phlabels", JsonUtil.obj2json(phlabels));
		if(phlabels.size()>0){
			model.addAttribute("hlabels", JsonUtil.obj2json(hlabelService.queryByPid(phlabels.get(0).getId())));
		}
		return "hos/order/update";
	}

	@RequiresPermissions("manage:order:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(@RequestBody Order po) {
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:order:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
}
