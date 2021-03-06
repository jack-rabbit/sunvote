package com.fh.service.sunvote.teacher.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.sunvote.teacher.TeacherManager;

/** 
 * 说明： 教师
 * 创建人：FH Q313596790
 * 创建时间：2018-04-26
 * @version
 */
@Service("teacherService")
public class TeacherService implements TeacherManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("TeacherMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("TeacherMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("TeacherMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("TeacherMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("TeacherMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TeacherMapper.findById", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData getUserInfo(PageData pd)throws Exception{
		return (PageData)dao.findForObject("TeacherMapper.getUserInfo", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("TeacherMapper.deleteAll", ArrayDATA_IDS);
	}

	@Override
	public List<PageData> diffcultClassReport(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeacherMapper.diffcultClassReport", pd);
	}

	@Override
	public List<PageData> diffcultStudentReport(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeacherMapper.diffcultStudentReport", pd);
	}

	@Override
	public List<PageData> knowadgeClassReport(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeacherMapper.knowadgeClassReport", pd);
	}

	@Override
	public List<PageData> knowadgeStudentReport(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("TeacherMapper.knowadgeStudentReport", pd);
	}
	
}

