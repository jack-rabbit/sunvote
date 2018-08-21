package com.fh.service.sunvote.testpaperinfo;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/** 
 * 说明： 测验明细表接口
 * 创建时间：2018-05-17
 * @version
 */
public interface TestPaperInfoManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void batchSave(List<PageData> pd)throws Exception;
	
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
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> reportPaperDetail(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
	/**
	 * 根据测验id，试题id，查询该问题，在该答卷的答题情况
	 * 可以根据试卷id，试题id，查询试卷在所有测验中答题情况
	 * 可以根据学生id，试题id，查询试题在学生下面的答题情况
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listTestPaperQuestionIDinfo(PageData pd)throws Exception;
	
	
	/**
	 * 查询测验下面的所有试题ID列表
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listTestPaperQuestionIDs(PageData pd)throws Exception;
	
}

