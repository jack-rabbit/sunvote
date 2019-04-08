package com.fh.service.sunvote.homework.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.sunvote.homework.HomeworkManager;

/** 
 * 说明： 作业
 * 创建人：FH Q313596790
 * 创建时间：2019-03-07
 * @version
 */
@Service("homeworkService")
public class HomeworkService implements HomeworkManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("HomeworkMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("HomeworkMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("HomeworkMapper.edit", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void deleteHomework(PageData pd)throws Exception{
		dao.update("HomeworkMapper.deleteHomework", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void deleteHomeworkAll(String[] ArrayDATA_IDS)throws Exception{
		dao.update("HomeworkMapper.deleteHomework", ArrayDATA_IDS);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HomeworkMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HomeworkMapper.listAll", pd);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> qlistAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HomeworkMapper.qlistAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HomeworkMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("HomeworkMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> findByCode(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("HomeworkMapper.findByCode", pd);
	}

	@Override
	public List<PageData> report(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("HomeworkMapper.report", pd);
	}
	
}

