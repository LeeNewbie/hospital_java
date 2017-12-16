package com.cocosh.hos.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.cocosh.hos.model.Hlabel;
import com.cocosh.hos.model.Item;
import com.cocosh.hos.model.Order;
import com.cocosh.hos.service.HlabelService;
import com.cocosh.hos.service.ItemBradyService;
import com.cocosh.hos.service.ItemDiagnoseService;
import com.cocosh.hos.service.ItemDrugService;
import com.cocosh.hos.service.ItemIcdService;
import com.cocosh.hos.service.ItemRecordService;
import com.cocosh.hos.service.ItemService;
import com.cocosh.hos.service.ItemTestService;
import com.cocosh.hos.service.OrderHistestService;
import com.cocosh.hos.service.OrderService;
import com.cocosh.hos.service.impl.OrderHlabelServiceImpl;

@Controller
@RequestMapping("manage/item")
public class ItemController extends BaseController {
	@Autowired
	private ItemService service;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemBradyService bradyService;
	@Autowired
	private ItemIcdService icdService;
	@Autowired
	private ItemDiagnoseService diagnoseService;
	@Autowired
	private ItemTestService testService;
	@Autowired
	private HlabelService hlabelService;
	@Autowired
	private OrderHistestService histestService;
	@Autowired
	private OrderHlabelServiceImpl orderhlabelService;
	@Autowired
	private ItemRecordService recordService;
	@Autowired
	private ItemDrugService drugService;

	@RequiresPermissions("manage:item:list")
	@RequestMapping("list")
	public String list(BaseConditionVO vo, Model model) {
		Page<Map<String,Object>> page=service.queryPage(vo);
		model.addAttribute("page", page);
		model.addAttribute("vo", vo);
		return "hos/item/list";
	}
	
	@RequiresPermissions("manage:item:add")
	@RequestMapping(value="add/{order_id}",method=RequestMethod.GET)
	public String add(Model model,@PathVariable String order_id) {
		model.addAttribute("order", orderService.queryById(order_id));
		List<Hlabel> phlabels=hlabelService.queryByPid("0");
		model.addAttribute("phlabels", JsonUtil.obj2json(phlabels));
		if(phlabels.size()>0){
			model.addAttribute("hlabels", JsonUtil.obj2json(hlabelService.queryByPid(phlabels.get(0).getId())));
		}
		return "hos/item/add";
	}

	@RequiresPermissions("manage:item:add")
	@RequestMapping("add")
	@ResponseBody
	public AjaxResult add(@RequestBody Item po) {
		if (service.add(po)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}

	@RequiresPermissions("manage:item:update")
	@RequestMapping("update/{id}")
	public String update(@PathVariable String id,Model model) {
		Item item=service.queryById(id);
		model.addAttribute("item",item);
		Order order=orderService.queryById(item.getOrder_id());
		model.addAttribute("order",order);
		model.addAttribute("brady", bradyService.queryByItemId(id));
		model.addAttribute("icd", icdService.queryByItemId(id));
		model.addAttribute("diagnose", diagnoseService.queryByItemId(id));
		model.addAttribute("test", testService.queryByItemId(id));
		model.addAttribute("histests", histestService.queryByOrderId(id));
		model.addAttribute("orderhlabels", orderhlabelService.queryByOrderId(id));
		model.addAttribute("records", recordService.queryByItemId(id));
		model.addAttribute("drugs", drugService.queryByItemId(id));
		List<Hlabel> phlabels=hlabelService.queryByPid("0");
		model.addAttribute("parent_hlabels", phlabels);
		model.addAttribute("phlabels", JsonUtil.obj2json(phlabels));
		if(phlabels.size()>0){
			model.addAttribute("hlabels", JsonUtil.obj2json(hlabelService.queryByPid(phlabels.get(0).getId())));
		}
		return "hos/item/update";
	}

	@RequiresPermissions("manage:item:update")
	@RequestMapping("update")
	@ResponseBody
	public AjaxResult update(@RequestBody Item po) {
		if (service.update(po)) {
			return new AjaxResult("0");
		} else {
			return new AjaxResult("1");
		}
	}

	@RequiresPermissions("manage:item:del")
	@RequestMapping("del/{id}")
	@ResponseBody
	public AjaxResult del(@PathVariable String id) {
		if (service.del(id)) {
			return new AjaxResult("0");
		}
		return new AjaxResult("1");
	}
	

	@RequiresPermissions("manage:item:import")
	@RequestMapping("import/{suffix}")
	@ResponseBody
	public AjaxResult projectImport(@PathVariable String suffix,HttpServletRequest req) {
		return service.itemImport(suffix, req);
	}
}
