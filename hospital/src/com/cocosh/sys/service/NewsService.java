package com.cocosh.sys.service;
 
import java.util.List;

import com.cocosh.framework.base.AjaxResult;
import com.cocosh.framework.base.BaseConditionVO;
import com.cocosh.framework.mybatis.Page;
import com.cocosh.sys.model.News;

public interface NewsService {
	boolean add(News po);
	boolean del(Integer flg,String ids);
	boolean update(News po);
	Page<News> queryPage(BaseConditionVO vo);
	News queryById(String id);
	List<News> queryBanners();
	List<News> queryNews(Integer pageNo);
	List<News> queryActivity(Integer pageNo);
	News queryStartAdvert();
	AjaxResult addStartAdvert(News po);
}
