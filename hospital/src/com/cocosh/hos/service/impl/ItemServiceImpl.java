package com.cocosh.hos.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cocosh.framework.annotation.LogClass;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.framework.mybatis.PaginationInterceptor;
import com.cocosh.framework.util.StringUtil;
import com.cocosh.hos.mapper.ItemBradyMapper;
import com.cocosh.hos.mapper.ItemDrugMapper;
import com.cocosh.hos.mapper.ItemIcdMapper;
import com.cocosh.hos.mapper.ItemMapper;
import com.cocosh.hos.mapper.ItemRecordMapper;
import com.cocosh.hos.mapper.ItemTestMapper;
import com.cocosh.hos.mapper.OrderHistestMapper;
import com.cocosh.hos.mapper.OrderHlabelMapper;
import com.cocosh.hos.model.Item;
import com.cocosh.hos.model.ItemBrady;
import com.cocosh.hos.model.ItemDiagnose;
import com.cocosh.hos.model.ItemDrug;
import com.cocosh.hos.model.ItemIcd;
import com.cocosh.hos.model.ItemRecord;
import com.cocosh.hos.model.ItemTest;
import com.cocosh.hos.model.OrderHistest;
import com.cocosh.hos.model.OrderHlabel;
import com.cocosh.hos.service.ItemDiagnoseService;
import com.cocosh.hos.service.ItemService;

@Transactional
@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemMapper mapper;
	@Autowired
	private ItemBradyMapper bradyMapper;
	@Autowired
	private ItemIcdMapper icdMapper;
	@Autowired
	private ItemDiagnoseService diagnoseMapper;
	@Autowired
	private ItemTestMapper testMapper;
	@Autowired
	private OrderHistestMapper histestMapper;
	@Autowired
	private OrderHlabelMapper orderlabelMapper;
	@Autowired
	private ItemRecordMapper recordMapper;
	@Autowired
	private ItemDrugMapper drugMapper;
	

	@LogClass(module = "随访表单管理", method = "添加")
	@Override
	public boolean add(Item po) {
		String item_id=StringUtil.getUuid();
		po.setId(item_id);
		boolean flag= mapper.add(po) > 0;
		if(flag){
			ItemBrady brady=po.getBrady();
			if(brady!=null){
				brady.setItem_id(item_id);
				bradyMapper.add(brady);
			}
			ItemIcd icd=po.getIcd();
			if(icd!=null){
				icd.setItem_id(item_id);
				icdMapper.add(icd);
			}
			ItemDiagnose diagnose=po.getDiagnose();
			if(diagnose!=null){
				diagnose.setItem_id(item_id);
				diagnoseMapper.add(diagnose);
			}
			ItemTest test=po.getTest();
			if(test!=null){
				test.setItem_id(item_id);
				testMapper.add(test);
			}
			List<OrderHistest> histests=po.getHistests();//his测试
			if(histests.size()>0){
				for(OrderHistest histest:histests){
					histest.setId(StringUtil.getUuid());
					histest.setOrder_id(item_id);
					histestMapper.add(histest);
				}
			}
			List<OrderHlabel> orderhlabels=po.getOrderhlabels();
			if(orderhlabels.size()>0){
				for(OrderHlabel ohlabel:orderhlabels){
					ohlabel.setOrder_id(item_id);
					orderlabelMapper.add(ohlabel);
				}
			}
			List<ItemRecord> records=po.getRecords();
			if(records.size()>0){
				for(ItemRecord record:records){
					record.setId(StringUtil.getUuid());
					record.setItem_id(item_id);
					recordMapper.add(record);
				}
			}
			List<ItemDrug> drugs=po.getDrugs();
			if(drugs.size()>0){
				for(ItemDrug drug:drugs){
					drug.setId(StringUtil.getUuid());
					drug.setItem_id(item_id);
					drugMapper.add(drug);
				}
			}
		}
		return flag;
	}
	
    @LogClass(module = "随访表单管理", method = "删除")
	@Override
	public boolean del(String ids) {
		return mapper.del(ids.split(",")) > 0;
	}

	@LogClass(module = "随访表单管理", method = "修改")
	@Override
	public boolean update(Item po) {
		boolean flag= mapper.update(po) > 0;
		if(flag){
			ItemBrady brady=po.getBrady();
			if(brady!=null){
				bradyMapper.update(brady);
			}
			ItemIcd icd=po.getIcd();
			if(icd!=null){
				icdMapper.update(icd);
			}
			ItemDiagnose diagnose=po.getDiagnose();
			if(diagnose!=null){
				diagnoseMapper.update(diagnose);
			}
			ItemTest test=po.getTest();
			if(test!=null){
				testMapper.update(test);
			}
			histestMapper.delByOrderId(po.getId());//删除his测试
			List<OrderHistest> histests=po.getHistests();//his测试
			if(histests.size()>0){
				for(OrderHistest histest:histests){
					histest.setId(StringUtil.getUuid());
					histest.setOrder_id(po.getId());
					histestMapper.add(histest);
				}
			}
			orderlabelMapper.delByOrderId(po.getId());//删除orderlabel
			List<OrderHlabel> orderhlabels=po.getOrderhlabels();
			if(orderhlabels.size()>0){
				for(OrderHlabel ohlabel:orderhlabels){
					ohlabel.setOrder_id(po.getId());
					orderlabelMapper.add(ohlabel);
				}
			}
			recordMapper.delByItemId(po.getId());//删除record
			List<ItemRecord> records=po.getRecords();
			if(records.size()>0){
				for(ItemRecord record:records){
					record.setId(StringUtil.getUuid());
					record.setItem_id(po.getId());
					recordMapper.add(record);
				}
			}
			drugMapper.delByItemId(po.getId());//删除drug
			List<ItemDrug> drugs=po.getDrugs();
			if(drugs.size()>0){
				for(ItemDrug drug:drugs){
					drug.setId(StringUtil.getUuid());
					drug.setItem_id(po.getId());
					drugMapper.add(drug);
				}
			}
		}
		return flag;
	}

	@Override
	public Page<Map<String,Object>> queryPage(BaseConditionVO vo) {
		PaginationInterceptor.startPage(vo.getPageNo(),vo.getPageSize());
		mapper.queryPage(vo);
		Page<Map<String ,Object>> page=PaginationInterceptor.endPage();
		return page;
	}

	@Override
	public Item queryById(String id) {
		return mapper.queryById(id);
	}
	
}
