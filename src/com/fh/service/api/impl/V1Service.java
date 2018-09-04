package com.fh.service.api.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.service.api.V1Manager;
import com.fh.util.PageData;

@Service("v1Service")
public class V1Service implements V1Manager {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> getTeacherClassInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getTeacherClassInfo", pd);
	}

	@Override
	public List<PageData> getTeacherSubjectInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getTeacherSubjectInfo", pd);
	}

	@Override
	public List<PageData> getClassStudent(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getClassStudent", pd);
	}
	
	@Override
	public List<PageData> getTestPaperInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getTestPaperInfo", pd);
	}

	@Override
	public List<PageData> getQuestionsByPID(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getQuestionsByPID", pd);
	}
	
	@Override
	public List<PageData> getTeacherInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getTeacherInfo", pd);
	}
	
	@Override
	public List<PageData> getQuestionWrongInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getQuestionWrongInfo", pd);
	}
	
	@Override
	public List<PageData> getLastWrongQuestionInfo(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("V1Mapper.getLastWrongQuestionInfo", pd);
	}

}
