package com.fh.controller.sunvote;

import org.springframework.stereotype.Service;

import com.fh.service.sunvote.basestation.impl.BasestationService;
import com.fh.service.sunvote.classtype.impl.ClassTypeService;
import com.fh.service.sunvote.grade.impl.GradeService;
import com.fh.service.sunvote.paper.PaperManager;
import com.fh.service.sunvote.papertype.PaperTypeManager;
import com.fh.service.sunvote.questiontype.QuestionTypeManager;
import com.fh.service.sunvote.school.impl.SchoolService;
import com.fh.service.sunvote.sclass.impl.SClassService;
import com.fh.service.sunvote.student.StudentManager;
import com.fh.service.sunvote.subject.impl.SubjectService;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.sunvote.teacher.impl.TeacherService;
import com.fh.service.sunvote.teachingmaterial.impl.TeachingMaterialService;
import com.fh.service.sunvote.term.TermManager;
import com.fh.service.sunvote.testpaper.TestPaperManager;
import com.fh.util.PageData;
import com.fh.util.SpringBeanFactoryUtils;

@Service
public class Myelfun {
	
	/**
	 * 根据ID 获取学校名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findSchoolName(String type) throws Exception{
		SchoolService schoolService = (SchoolService)SpringBeanFactoryUtils.getBean("schoolService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = schoolService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID获取年级名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findGradeName(String type) throws Exception{
		GradeService gradeService = (GradeService)SpringBeanFactoryUtils.getBean("gradeService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = gradeService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID或者班级类型名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findClassTypeName(String type) throws Exception{
		ClassTypeService classTypeService = (ClassTypeService)SpringBeanFactoryUtils.getBean("classtypeService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = classTypeService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID，获取科目中文名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findSubjectEName(String type) throws Exception{
		SubjectService subjectService = (SubjectService)SpringBeanFactoryUtils.getBean("subjectService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = subjectService.findById(pageData);
		if(pageData != null){
			return pageData.getString("ENAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID或者科目英文名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findSubjectCName(String type) throws Exception{
		SubjectService subjectService = (SubjectService)SpringBeanFactoryUtils.getBean("subjectService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = subjectService.findById(pageData);
		if(pageData != null){
			return pageData.getString("CNAME");
		}else{
			return "" ;
		}
	}

	/**
	 * 根据ID查找基站名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public static String findBasestationName(String type) throws Exception{
		BasestationService basestationService = (BasestationService)SpringBeanFactoryUtils.getBean("basestationService");
		PageData pageData = new PageData();
		pageData.put("ID", type);
		pageData = basestationService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID 老师姓名
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findTeacherName(String id) throws Exception {
		TeacherService teacherService = (TeacherService)SpringBeanFactoryUtils.getBean("teacherService");
		PageData pageData = new PageData();
		pageData.put("ID", id);
		pageData = teacherService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID班级名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findClassName(String id) throws Exception {
		SClassService sclassService = (SClassService)SpringBeanFactoryUtils.getBean("sclassService");
		PageData pageData = new PageData();
		pageData.put("ID", id);
		pageData = sclassService.findById(pageData);
		if(pageData != null){
			return pageData.getString("CLASS_NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID学生
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findStudentName(String id) throws Exception {
		StudentManager studentService = (StudentManager)SpringBeanFactoryUtils.getBean("studentService");
		PageData pageData = new PageData();
		pageData.put("ID", id);
		pageData = studentService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据学期名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findTermName(String id) throws Exception {
		TermManager termService = (TermManager)SpringBeanFactoryUtils.getBean("termService");
		PageData pageData = new PageData();
		pageData.put("TERM_ID", id);
		pageData = termService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID班级名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findTeachingmaterialName(String id) throws Exception {
		TeachingMaterialService teachingmaterialService = (TeachingMaterialService)SpringBeanFactoryUtils.getBean("teachingmaterialService");
		PageData pageData = new PageData();
		pageData.put("ID", id);
		pageData = teachingmaterialService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	/**
	 * 根据ID查找题目类型
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findQuestionTypeName(String id) throws Exception {
		QuestionTypeManager questiontypeService = (QuestionTypeManager)SpringBeanFactoryUtils.getBean("questiontypeService");
		PageData pageData = new PageData();
		pageData.put("QUESTIONTYPE_ID", id);
		pageData = questiontypeService.findById(pageData);
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	public static String getUserID(String user_id){
		TeacherManager teacherService = (TeacherManager)SpringBeanFactoryUtils.getBean("teacherService");
		PageData pd = new PageData();
		pd.put("ID", user_id);
		try {
			pd = teacherService.findById(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pd != null){
			return pd.getString("SCHOOL_ID");
		}else{
			return "" ;
		}
	}
	
	public static String findPaperTypeName(String id){
		PaperTypeManager papertypeService = (PaperTypeManager)SpringBeanFactoryUtils.getBean("papertypeService");
		PageData pageData = new PageData();
		pageData.put("ID", id);
		try {
			pageData = papertypeService.findById(pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	public static String findPaperName(String id){
		PaperManager paperService = (PaperManager)SpringBeanFactoryUtils.getBean("paperService");
		PageData pageData = new PageData();
		pageData.put("PAPER_ID", id);
		try {
			pageData = paperService.findById(pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pageData != null){
			return pageData.getString("TITLE");
		}else{
			return "" ;
		}
	}
	
	public static String findTestPaperName(String id){
		TestPaperManager testpaperService = (TestPaperManager)SpringBeanFactoryUtils.getBean("testpaperService");
		PageData pageData = new PageData();
		pageData.put("TESTPAPER_ID", id);
		try {
			pageData = testpaperService.findById(pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(pageData != null){
			return pageData.getString("NAME");
		}else{
			return "" ;
		}
	}
	
	
}
