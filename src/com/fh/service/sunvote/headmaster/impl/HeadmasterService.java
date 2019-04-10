package com.fh.service.sunvote.headmaster.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.sunvote.headmaster.HeadmasterManager;

/** 
 * 说明： 班主任
 * 创建人：FH Q313596790
 * 创建时间：2019-03-08
 * @version
 */
@Service("headmasterService")
public class HeadmasterService implements HeadmasterManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("HeadmasterMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("HeadmasterMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("HeadmasterMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("HeadmasterMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("HeadmasterMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HeadmasterMapper.findById", pd);
	}
	
	/**通过用户名或密码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByUsenameAndPassword(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HeadmasterMapper.findByUsenameAndPassword", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("HeadmasterMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAllCLassHeaderMaster(String[] ArrayDATA_IDS)throws Exception{
		dao.update("HeadmasterMapper.deleteAllCLassHeaderMaster", ArrayDATA_IDS);
	}

	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listClass(Page page) throws Exception {
		return (List<PageData>)dao.findForList("HeadmasterMapper.dataClasslistPage", page);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> listNoHeaderClass(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("HeadmasterMapper.listNoHeaderClass", pd);
	}

	@Override
	public void updateHeaderMaster(PageData pd) throws Exception {
		dao.update("HeadmasterMapper.updateHeaderMaster", pd);
		
	}

	@Override
	public PageData findClassByHeaderId(PageData pd) throws Exception {
		return (PageData)dao.findForObject("HeadmasterMapper.findClassByHeaderId", pd);
	}
	
}

