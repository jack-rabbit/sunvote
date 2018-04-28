package com.fh.controller.sunvote;

import org.springframework.stereotype.Service;

import com.fh.service.sunvote.basestation.impl.BasestationService;
import com.fh.service.sunvote.classtype.impl.ClassTypeService;
import com.fh.service.sunvote.grade.impl.GradeService;
import com.fh.service.sunvote.school.impl.SchoolService;
import com.fh.service.sunvote.sclass.impl.SClassService;
import com.fh.service.sunvote.subject.impl.SubjectService;
import com.fh.service.sunvote.teacher.impl.TeacherService;
import com.fh.service.sunvote.teachingmaterial.impl.TeachingMaterialService;
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
	public static String findSchoolName(int type) throws Exception{
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
	public static String findGradeName(int type) throws Exception{
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
	public static String findClassTypeName(int type) throws Exception{
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
	public static String findSubjectEName(int type) throws Exception{
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
	public static String findSubjectCName(int type) throws Exception{
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
	public static String findBasestationName(int type) throws Exception{
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
	public static String findTeacherName(int id) throws Exception {
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
	public static String findClassName(int id) throws Exception {
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
	 * 根据ID班级名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public static String findTeachingmaterialName(int id) throws Exception {
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
	
}
