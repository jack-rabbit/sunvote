package com.fh.service.sunvote.student;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 学生管理接口
 * 创建人：Elvis
 * 创建时间：2018-04-28
 * @version
 */
public interface StudentManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> datalistclassPage(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	public List<PageData> findByClassId(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**
	 * 
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findByName(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	/**
	 * 列出当前班级学生名单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllClass(PageData pd)throws Exception;
	
	/**
	 * 查询班级学期的学生名单
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listAllClassByTerm(PageData pd)throws Exception;
	
}

