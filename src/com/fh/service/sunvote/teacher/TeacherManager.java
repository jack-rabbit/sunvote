package com.fh.service.sunvote.teacher;

import java.util.List;
import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 教师接口
 * 创建人：Elvis
 * 创建时间：2018-04-26
 * @version
 */
public interface TeacherManager{

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
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**
	 * knowadgeClassReport
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> diffcultClassReport(PageData pd)throws Exception;
	
	/**
	 * diffcultStudentReport
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> diffcultStudentReport(PageData pd)throws Exception;
	
	/**
	 * knowadgeClassReport
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> knowadgeClassReport(PageData pd)throws Exception;
	
	/**
	 * 根据难度统计学生掌握掌握情况
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> knowadgeStudentReport(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**通过username&password获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserInfo(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

