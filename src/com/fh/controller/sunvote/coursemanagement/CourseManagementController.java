package com.fh.controller.sunvote.coursemanagement;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.api.ResponseGson;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.sunvote.coursemanagement.CourseManagementManager;
import com.fh.service.sunvote.grade.GradeManager;
import com.fh.service.sunvote.sclass.SClassManager;
import com.fh.service.sunvote.subject.SubjectManager;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.sunvote.term.TermManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：任课管理
 * 创建人：Elvis
 * 创建时间：2018-04-26
 */
@Controller
@RequestMapping(value="/coursemanagement")
public class CourseManagementController extends BaseController {
	
	String menuUrl = "coursemanagement/list.do"; //菜单地址(权限用)
	@Resource(name="coursemanagementService")
	private CourseManagementManager coursemanagementService;
	
	@Resource(name="teacherService")
	private TeacherManager teacherService;
	
	@Resource(name="sclassService")
	private SClassManager sclassService;
	
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	
	@Resource(name="termService")
	private TermManager termService;
	
	@Resource(name="gradeService")
	private GradeManager gradeService;
	
	
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增CourseManagement");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		coursemanagementService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save2")
	public ModelAndView save2() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增CourseManagement");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		coursemanagementService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result2");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除CourseManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		coursemanagementService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CourseManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		coursemanagementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit2")
	public ModelAndView edit2() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改CourseManagement");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		coursemanagementService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result2");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表CourseManagement");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = coursemanagementService.list(page);	//列出CourseManagement列表
		mv.setViewName("sunvote/coursemanagement/coursemanagement_list");
		mv.addObject("varList", varList);
		
		List<PageData> terms = termService.listAll(pd);
		mv.addObject("terms", terms);
		
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listcs")
	public ModelAndView listcs(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = coursemanagementService.listCourse(page);	//列出CourseManagement列表
		mv.setViewName("sunvote/coursemanagement/coursemanagement_list2");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	/**
	 * 获取作业详情
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/teacherClass", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String homework() throws Exception {
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		PageData pageData = this.getPageData();
		List<PageData> list = coursemanagementService.listTeacherClass(pageData);
		res.setData(list);
		return res.toJson();
		
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("sunvote/coursemanagement/coursemanagement_edit");
		
		List<PageData> teachers = teacherService.listAll(pd);
		mv.addObject("teachers",teachers);
		List<PageData> classs = sclassService.listAll(pd);
		mv.addObject("classs",classs);
		List<PageData> subjects = subjectService.listAll(pd);
		mv.addObject("subjects", subjects);
		
		List<PageData> terms = termService.listAll(pd);
		mv.addObject("terms", terms);
		List<PageData> grades =  gradeService.listAll(pd);
		mv.addObject("grades", grades);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	

	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd2")
	public ModelAndView goAdd2()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("sunvote/coursemanagement/coursemanagement_edit2");
		
		List<PageData> teachers = teacherService.listAll(pd);
		mv.addObject("teachers",teachers);
		List<PageData> classs = sclassService.listAll(pd);
		mv.addObject("classs",classs);
		
		List<PageData> subjects = subjectService.listAllSchool(pd);
		mv.addObject("subjects", subjects);
		
		List<PageData> terms = termService.listAll(pd);
		mv.addObject("terms", terms);
		List<PageData> grades =  gradeService.listAllInschool(pd);
		mv.addObject("grades", grades);
		mv.addObject("msg", "save2");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		List<PageData> classs = sclassService.listAll(pd);
		mv.addObject("classs",classs);
		pd = this.getPageData();
		pd = coursemanagementService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/coursemanagement/coursemanagement_edit");
		List<PageData> teachers = teacherService.listAll(pd);
		mv.addObject("teachers",teachers);
		List<PageData> subjects = subjectService.listAll(pd);
		mv.addObject("subjects", subjects);
		List<PageData> terms = termService.listAll(pd);
		mv.addObject("terms", terms);
		List<PageData> grades =  gradeService.listAll(pd);
		mv.addObject("grades", grades);
		
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除CourseManagement");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			coursemanagementService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出CourseManagement到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("老师");	//1
		titles.add("班级ID");	//2
		titles.add("科目");	//3
		titles.add("开始时间");	//4
		titles.add("结束时间");	//5
		titles.add("备注");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = coursemanagementService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("TEACHER_ID").toString());	//1
			vpd.put("var2", varOList.get(i).getString("CLASS_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("SUBJECT_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("START_DATE"));	    //4
			vpd.put("var5", varOList.get(i).getString("END_DATE"));	    //5
			vpd.put("var6", varOList.get(i).getString("REMARK"));	    //6
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
