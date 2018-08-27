package com.fh.service.api;

import java.util.List;

import com.fh.util.PageData;

public interface V1Manager {

	public List<PageData> getTeacherClassInfo(PageData pd) throws Exception;
	
	public List<PageData> getTeacherSubjectInfo(PageData pd) throws Exception;
	
	public List<PageData> getClassStudent(PageData pd) throws Exception;
	
	public List<PageData> getTestPaperInfo(PageData pd) throws Exception;
	
	
	public List<PageData> getQuestionsByPID(PageData pd) throws Exception;
	
	public List<PageData> getTeacherInfo(PageData pd) throws Exception;
	
	public List<PageData> getQuestionWrongInfo(PageData pd) throws Exception ;
	
	
}
