package com.fh.service.sunvote.coursemanagement.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.sunvote.coursemanagement.CourseManagementManager;

/** 
 * 说明： 任课管理
 * 创建人：FH Q313596790
 * 创建时间：2018-04-26
 * @version
 */
@Service("coursemanagementService")
public class CourseManagementService implements CourseManagementManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CourseManagementMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CourseManagementMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CourseManagementMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagementMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagementMapper.listAll", pd);
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listCourse(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagementMapper.listCourse", pd);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> listCourse(Page pd)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagementMapper.listCourselistPage", pd);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<PageData> listTeacherClass(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CourseManagementMapper.listTeacherClass", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CourseManagementMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CourseManagementMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

