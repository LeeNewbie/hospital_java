package com.cocosh.hos.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cocosh.framework.annotation.LogClass;
import com.cocosh.framework.base.AjaxResult;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.excel.ExcelUtil;
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
import com.cocosh.hos.mapper.OrderMapper;
import com.cocosh.hos.model.Item;
import com.cocosh.hos.model.ItemBrady;
import com.cocosh.hos.model.ItemDiagnose;
import com.cocosh.hos.model.ItemDrug;
import com.cocosh.hos.model.ItemIcd;
import com.cocosh.hos.model.ItemRecord;
import com.cocosh.hos.model.ItemTest;
import com.cocosh.hos.model.Order;
import com.cocosh.hos.model.OrderHistest;
import com.cocosh.hos.model.OrderHlabel;
import com.cocosh.hos.service.ItemDiagnoseService;
import com.cocosh.hos.service.ItemService;
import com.cocosh.sys.model.User;

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
	@Autowired
	private OrderMapper orderMapper;
	

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

	@Override
	public AjaxResult itemImport(String suffix, HttpServletRequest req) {
		String[] template=new String[]{"机器序列号","工作模式","基本频率","上线频率","休息/睡眠频率",	"滞后频率","起搏AV","感知AV",	"心房输出","心房脉宽","心房阈值管理",	"心房感知灵敏度","右室输出","右室脉宽","右室阈值管理","右室感知灵敏度","左室输出","左室脉宽","左室阈值管理","左室感知灵敏度","VT-1",	"VT-1频率","VT-1鉴别诊断","VT-1治疗方案","VT-2","VT-2频率","VT-2鉴别诊断",	"VT-2治疗方案","VF","VF频率","VF治疗方案","左室向量","SAV/PAV","VV间期","AS-VP","AS-VS","AP-VP","AP-VS","PVC","AP","VP","BP","AMS事件","模式转换"	,"AT/AF负荷","预估寿命",	"电池内阻","磁铁频率","充电时间","心房阈值","脉宽","心房感知","心房阻抗","右室阈值","脉宽","右室感知","右室阻抗","高压阻抗","左室阈值","脉宽","左室阻抗"};
		try {
			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) req;
			MultipartFile mFile = multiRequest.getFile("file");
			Workbook wb=suffix.equals("xls")?new HSSFWorkbook(mFile.getInputStream()):new XSSFWorkbook(mFile.getInputStream());
			Sheet sheet = wb.getSheetAt(0);
	        int totalRows = sheet.getPhysicalNumberOfRows();  
	        int totalCells = 0;  
	        if (totalRows >= 1 && sheet.getRow(1) != null) {  
	            totalCells = sheet.getRow(1).getPhysicalNumberOfCells();  
	        }else {
	        	return new AjaxResult("1","Excel内容不合法，请使用模板上传");
			}
	        //验证ECXEL内容是否规范
	        Row titleRow = sheet.getRow(1);
	        for (int c = 0; c < totalCells; c++) {
				if (ExcelUtil.ConvertCell(titleRow.getCell(c)).replace("*", "").equals(template[c])) {
					continue;
				}
				System.out.println(template[c].equals(ExcelUtil.ConvertCell(titleRow.getCell(c))));
				System.out.println(template[c]+"-----------"+ExcelUtil.ConvertCell(titleRow.getCell(c))+"----");
				System.out.println(c+"----------------------");
				return new AjaxResult("1","Excel内容不合法，请使用模板上传");
			}
	        //读取全部记录插入数据库
	        Integer true_len=0;
	        Integer false_len=0;
	        String names="";
	        for (int r = 2; r < totalRows; r++) { 
	            Row row = sheet.getRow(r);  
	            if (row == null) {  
	                continue;  
	            }
	            String machine_sn=ExcelUtil.ConvertCell(row.getCell(0));
	            if(StringUtil.isEmpty(machine_sn)){
	            	false_len=false_len+1;
	            	names+=machine_sn+",";
	            	continue;
	            }
	            Order order =orderMapper.queryByMachine_sn(machine_sn);
	            if(order==null){
	            	false_len=false_len+1;
	            	names+=machine_sn+",";
	            	continue;
	            }
	            Item item=new Item();
	            item.setId(StringUtil.getUuid());
	            item.setOrder_id(order.getId());
	            mapper.add(item);
	            
	            ItemBrady brady=new ItemBrady();
	            brady.setItem_id(item.getId());
	            brady.setWork_mode(ExcelUtil.ConvertCell(row.getCell(1)));
	            brady.setBasic_rate(ExcelUtil.ConvertCell(row.getCell(2)));
	            brady.setUp_rate(ExcelUtil.ConvertCell(row.getCell(3)));
	            brady.setRest_rate(ExcelUtil.ConvertCell(row.getCell(4)));
	            brady.setLate_rate(ExcelUtil.ConvertCell(row.getCell(5)));
	            
	            brady.setQibo_av(ExcelUtil.ConvertCell(row.getCell(6)));
	            brady.setFeel_av(ExcelUtil.ConvertCell(row.getCell(7)));
	            brady.setHreat_out(ExcelUtil.ConvertCell(row.getCell(8)));
	            brady.setHreat_width(ExcelUtil.ConvertCell(row.getCell(9)));
	            brady.setHreat_yuzhi(0);
	            if("关".equals(ExcelUtil.ConvertCell(row.getCell(10))))brady.setHreat_yuzhi(1);
	           
	            brady.setHreat_sensive(ExcelUtil.ConvertCell(row.getCell(11)));
	            brady.setRight_out(ExcelUtil.ConvertCell(row.getCell(12)));
	            brady.setRight_width(ExcelUtil.ConvertCell(row.getCell(13)));
	            brady.setRight_yuzhi(0);
	            if("关".equals(ExcelUtil.ConvertCell(row.getCell(14))))brady.setRight_yuzhi(1);
	            brady.setRight_sensive(ExcelUtil.ConvertCell(row.getCell(15)));
               
	            brady.setLeft_out(ExcelUtil.ConvertCell(row.getCell(16)));
	            brady.setLeft_width(ExcelUtil.ConvertCell(row.getCell(17)));
	            brady.setLeft_yuzhi(0);
	            if("关".equals(ExcelUtil.ConvertCell(row.getCell(18)))) brady.setLeft_yuzhi(1);
	            brady.setLeft_sensive(ExcelUtil.ConvertCell(row.getCell(19)));
	            bradyMapper.add(brady);
	            
	            ItemIcd icd=new ItemIcd();
	            icd.setItem_id(item.getId());
                icd.setVt1_name(ExcelUtil.ConvertCell(row.getCell(20)));
	            icd.setVt1_rate(ExcelUtil.ConvertCell(row.getCell(21)));
	            icd.setVt1_identify(ExcelUtil.ConvertCell(row.getCell(22)));
	            icd.setVt1_scheme(ExcelUtil.ConvertCell(row.getCell(23)));
	            
	            icd.setVt2_name(ExcelUtil.ConvertCell(row.getCell(24)));
	            icd.setVt2_rate(ExcelUtil.ConvertCell(row.getCell(25)));
	            icd.setVt2_identify(ExcelUtil.ConvertCell(row.getCell(26)));
	            icd.setVt2_scheme(ExcelUtil.ConvertCell(row.getCell(27)));
              
	            icd.setVf_name(ExcelUtil.ConvertCell(row.getCell(28)));
		        icd.setVf_rate(ExcelUtil.ConvertCell(row.getCell(29)));
		        icd.setVf_scheme(ExcelUtil.ConvertCell(row.getCell(30)));
		        
		        icd.setCrt_left(ExcelUtil.ConvertCell(row.getCell(31)));
		        icd.setCrt_sav(ExcelUtil.ConvertCell(row.getCell(32)));
		        icd.setCrt_period(ExcelUtil.ConvertCell(row.getCell(33)));
		        icdMapper.add(icd);
		        
                ItemDiagnose diagnose=new ItemDiagnose();
		       diagnose.setItem_id(item.getId());
		        diagnose.setAsvp(ExcelUtil.ConvertCell(row.getCell(34)));
		        diagnose.setAsvs(ExcelUtil.ConvertCell(row.getCell(35)));
		        diagnose.setApvp(ExcelUtil.ConvertCell(row.getCell(36)));
		        diagnose.setApvs(ExcelUtil.ConvertCell(row.getCell(37)));
		        diagnose.setPvc(ExcelUtil.ConvertCell(row.getCell(38)));
		        diagnose.setAp(ExcelUtil.ConvertCell(row.getCell(39)));
		        diagnose.setVp(ExcelUtil.ConvertCell(row.getCell(40)));
		        diagnose.setBp(ExcelUtil.ConvertCell(row.getCell(41)));
		        diagnose.setAms(ExcelUtil.ConvertCell(row.getCell(42)));
		        diagnose.setExchange(ExcelUtil.ConvertCell(row.getCell(43)));
		        diagnose.setAtaf(ExcelUtil.ConvertCell(row.getCell(44)));
		        diagnoseMapper.add(diagnose);
		        
                 ItemTest test=new ItemTest();
			     test.setItem_id(item.getId());
			     test.setPredict_life(ExcelUtil.ConvertCell(row.getCell(45)));
			     test.setElect_forbid(ExcelUtil.ConvertCell(row.getCell(46)));
			     test.setMagnet_rate(ExcelUtil.ConvertCell(row.getCell(47)));
			     test.setElect_time(ExcelUtil.ConvertCell(row.getCell(48)));
                 test.setHreat_test_yuzhi(ExcelUtil.ConvertCell(row.getCell(49)));
                 test.setHreat_test_width(ExcelUtil.ConvertCell(row.getCell(50)));
                 test.setHreat_test_feel(ExcelUtil.ConvertCell(row.getCell(51)));
                 test.setHreat_test_forbid(ExcelUtil.ConvertCell(row.getCell(52)));
                
                 test.setRight_test_yuzhi(ExcelUtil.ConvertCell(row.getCell(53)));
                 test.setRight_test_width(ExcelUtil.ConvertCell(row.getCell(54)));
                 test.setRight_test_feel(ExcelUtil.ConvertCell(row.getCell(55)));
                 test.setRight_test_forbid(ExcelUtil.ConvertCell(row.getCell(56)));
                 test.setRight_test_hign(ExcelUtil.ConvertCell(row.getCell(57)));
                 
                 test.setLeft_test_yuzhi(ExcelUtil.ConvertCell(row.getCell(58)));
                 test.setLeft_test_width(ExcelUtil.ConvertCell(row.getCell(59)));
                 test.setLeft_test_forbid(ExcelUtil.ConvertCell(row.getCell(60)));
                 testMapper.add(test);
	            true_len=true_len+1;
	        }
	        if(!StringUtil.isEmpty(names)) names=" ,机器序列号："+names+"导入失败";
	        return new AjaxResult("0","导入完成：成功导入 "+true_len+" 条，失败 "+false_len+" 条"+names);
		} catch (IOException e) {
			e.printStackTrace();
			return new AjaxResult("1","导入失败:"+e.getMessage());
		}
	}
	
}
