package com.fh.controller.sunvote.homework;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.fh.bean.HomeClass;
import com.fh.bean.Homework;
import com.fh.bean.HomeworkQuestion;
import com.fh.controller.api.ResponseGson;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.sunvote.coursemanagement.CourseManagementManager;
import com.fh.service.sunvote.homework.HomeworkManager;
import com.fh.service.sunvote.homework.HomeworkReportManager;
import com.fh.service.sunvote.homeworkproblem.HomeworkProblemManager;
import com.fh.service.sunvote.student.StudentManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.google.gson.Gson;

/**
 * 说明：作业 创建人：FH Q313596790 创建时间：2019-03-07
 */
@Controller
@RequestMapping(value = "/homework")
public class HomeworkController extends BaseController {

	String menuUrl = "homework/list.do"; // 菜单地址(权限用)
	@Resource(name = "homeworkService")
	private HomeworkManager homeworkService;
	@Resource(name = "homeworkReporService")
	private HomeworkReportManager homeworkReporService;

	@Resource(name = "homeworkproblemService")
	private HomeworkProblemManager homeworkproblemService;
	
	@Resource(name="coursemanagementService")
	private CourseManagementManager coursemanagementService;
	
	@Resource(name="homeworkReporService")
	private HomeworkReportManager homeworkReporkService;
	
	@Resource(name="studentService")
	private StudentManager studentService;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增Homework");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("HOMEWORK_ID", this.get32UUID()); // 主键
		homeworkService.save(pd);
		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete")
	public void delete(PrintWriter out) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "删除Homework");
		PageData pd = new PageData();
		pd = this.getPageData();
		homeworkService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 修改
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView edit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Homework");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		if(pd.get("TEACHER_ID") == null){
			pd.put("TEACHER_ID", getTeacherID());
		}
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = homeworkService.list(page); // 列出Homework列表
		mv.setViewName("sunvote/homework/homework_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("sunvote/homework/homework_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去新增页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAdd2")
	public ModelAndView goAdd2() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		// 添加科目ID
		pd.put("TEACHER_ID", getTeacherID());
		pd.put("SUBJECT_ID", homeworkService.querySubjectId(pd));
		mv.setViewName("sunvote/homework/homework_edit2");
		mv.addObject("msg", "save");
		mv.addObject("operation", "add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = homeworkService.findById(pd); // 根据ID读取
		mv.setViewName("sunvote/homework/homework_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goEdit2")
	public ModelAndView goEdit2() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = homeworkService.findById(pd); // 根据ID读取
		pd.put("QUESTIONS", homeworkproblemService.listProblem(pd));
		pd.put("TEACHER_ID", getTeacherID());
		mv.setViewName("sunvote/homework/homework_edit2");
		mv.addObject("msg", "edit");
		mv.addObject("operation", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 去预览页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/goView")
	public ModelAndView goView() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = homeworkService.findById(pd); // 根据ID读取
		pd.put("QUESTIONS", homeworkproblemService.listProblem(pd));
		pd.put("TEACHER_ID", getTeacherID());
		mv.setViewName("sunvote/homework/homework_view");
		mv.addObject("msg", "edit");
		mv.addObject("operation", "view");
		mv.addObject("pd", pd);
		return mv;
	}

	
	public static String getWeekStart(int cur){
		SimpleDateFormat format  = new SimpleDateFormat("YYYY-MM-dd");  
		Calendar ca = Calendar.getInstance();  
		ca.setFirstDayOfWeek(Calendar.MONDAY);  
		int a = ca.getFirstDayOfWeek();
		ca.set(Calendar.DAY_OF_WEEK, a); // Sunday  
		ca.add(Calendar.DATE, cur * 7);
		String weekEnd = format.format(ca.getTime());  
		return weekEnd;
	}
	
	public static String getWeekEnd(int cur){
		SimpleDateFormat format  = new SimpleDateFormat("YYYY-MM-dd");  
		Calendar ca = Calendar.getInstance();  
		ca.setFirstDayOfWeek(Calendar.MONDAY);  
		int a = ca.getFirstDayOfWeek();
		ca.set(Calendar.DAY_OF_WEEK, a+6); // Sunday  
		ca.add(Calendar.DATE, cur * 7);
		String weekEnd = format.format(ca.getTime());  
		return weekEnd + " 23:59:59";
	}
	
	
	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/report")
	public ModelAndView report() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEACHER_ID", getTeacherID());
		
		
		if(pd.get("CURRENT_WEEK") == null && pd.get("START_DATE") == null && pd.get("END_DATE") == null){
			pd.put("CURRENT_WEEK", "0");
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}else if(pd.get("CURRENT_WEEK") != null){
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}
		
		// 班级信息
		List<PageData> list = coursemanagementService.listTeacherClass(pd);
		for(PageData temp : list){
			temp.remove("HEADMASTER_ID");
			temp.remove("SCHOOL_ID");
			temp.remove("GRADE_ID");
			temp.remove("TEACHER_ID");
			temp.remove("KEYBOARD_TYPE");
			temp.remove("BASESTATION_ID");
			temp.put("CLASS_ID", temp.get("ID"));
			temp.remove("ID");
		}
		if(pd.get("CLASS_ID") == null && list.size() > 0){
			pd.put("CLASS_ID", list.get(0).get("CLASS_ID"));
		}
		pd.put("CLASSES", list);
		
		if (pd.get("CLASS_ID") != null) {
			// 对应班级数据
			PageData data = new PageData();
			List<PageData> studentList = studentService.findByClassId(pd);

			List<PageData> homeworkList = homeworkService.listAll(pd);
			List<PageData> dataList = homeworkService.report(pd);
			for (PageData stuPd : studentList) {
				double all = 0;
				double get = 0;
				for (PageData dpd : dataList) {
					if (dpd.get("STUDENT_ID").equals(stuPd.get("ID"))) {
						stuPd.put(dpd.get("HOMEWORK_ID"),
								dpd.get("STUDENT_SCORE"));
						try {
							get += Double.parseDouble(dpd.get("STUDENT_SCORE")
									.toString());
						} catch (Exception ex) {

						}
						try {
							all += Double.parseDouble(dpd.get("PAPER_SCORE")
									.toString());
						} catch (Exception ex) {

						}
					}
				}
				stuPd.put("STUDENT_ALL_SCORE", get);
				stuPd.put("PAPER_ALL_SCORE", all);
				stuPd.remove("SCHOOL_ID");
				stuPd.remove("SEX");
				stuPd.remove("CLASS_ID");
				stuPd.remove("NUMBER");
				stuPd.put("STUDENT_ID", stuPd.get("ID"));
				stuPd.remove("ID");
			}
			for (PageData hpd : homeworkList) {
				hpd.remove("QUESTION_COUNT");
				hpd.remove("COMPLETE_COUNT");
				hpd.remove("SUBJECT_ID");
				hpd.remove("SCHOOL_ID");
				hpd.remove("GRADE_ID");
				hpd.remove("SUMBIT_DATE");
				hpd.remove("MODIFY_DATE");
				hpd.remove("TEACHER_ID");
				hpd.remove("CREATE_DATE");
				hpd.remove("CLASS_ID");
				hpd.remove("CODE");
				hpd.remove("GET_MAX_SCORE");
				hpd.remove("HOMEWORK_DESC");
				hpd.remove("COMPLETE_DESC");
			}
			data.put("HOMEWORKS", homeworkList);//
			data.put("STUDENTS", studentList);
			pd.put("DATA", data);
		}else{
			pd.put("CLASS_ID", "");
		}
		pd.remove("JSON");
		mv.setViewName("sunvote/homework/homework_report");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/student")
	public ModelAndView student() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEACHER_ID", getTeacherID());
		if(pd.get("CURRENT_WEEK") == null && pd.get("START_DATE") == null && pd.get("END_DATE") == null){
			pd.put("CURRENT_WEEK", "0");
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}else if(pd.get("CURRENT_WEEK") != null){
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}
		String studentId = pd.getString("STUDENT_ID") ;
		//pd.remove("STUDENT_ID");
		List<PageData> dataList = homeworkService.report(pd);
		pd.put("DATA", dataList);
		if(pd.get("CLASS_ID") != null){
			List<PageData> studentList = studentService.findByClassId(pd);
			pd.put("STUDENTS", studentList);
		}
		pd.remove("JSON");
		pd.put("STUDENT_ID", studentId);
		mv.setViewName("sunvote/homework/homework_student_report");
		mv.addObject("pd", pd);
		Gson gson = new Gson();
		mv.addObject("data",gson.toJson(pd));
		return mv;
	}
	
	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/student_data", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String studentData() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEACHER_ID", getTeacherID());
		if(pd.get("CURRENT_WEEK") == null && pd.get("START_DATE") == null && pd.get("END_DATE") == null){
			pd.put("CURRENT_WEEK", "0");
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}else if(pd.get("CURRENT_WEEK") != null){
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}
		String studentId = pd.getString("STUDENT_ID") ;
		pd.remove("STUDENT_ID");
		List<PageData> dataList = homeworkService.report(pd);
		pd.put("DATA", dataList);
		if(pd.get("CLASS_ID") != null){
			List<PageData> studentList = studentService.findByClassId(pd);
			pd.put("STUDENTS", studentList);
		}
		pd.remove("JSON");
		pd.put("STUDENT_ID", studentId);
		Gson gson = new Gson();
		return gson.toJson(pd);
	}
	
	
	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/homework_report")
	public ModelAndView homework_report() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEACHER_ID", getTeacherID());
		
		if(pd.get("CURRENT_WEEK") == null && pd.get("START_DATE") == null && pd.get("END_DATE") == null){
			pd.put("CURRENT_WEEK", "0");
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}else if(pd.get("CURRENT_WEEK") != null){
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}
		if(pd.get("HOMEWORK_ID") != null){
			List<PageData> dataList = homeworkService.report(pd);
			pd.put("DATA", dataList);
		}
		if(pd.get("CLASS_ID") != null){
			List<PageData> studentList = studentService.findByClassId(pd);
			pd.put("STUDENTS", studentList);
		}
		
		pd.put("HOMEWORKINFO", homeworkService.findById(pd));
		
		pd.remove("JSON");
		mv.setViewName("sunvote/homework/homework_item_report");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	@RequestMapping(value = "/homework_report_data" , produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String homeworkReportData() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("TEACHER_ID", getTeacherID());
		
		if(pd.get("CURRENT_WEEK") == null && pd.get("START_DATE") == null && pd.get("END_DATE") == null){
			pd.put("CURRENT_WEEK", "0");
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}else if(pd.get("CURRENT_WEEK") != null){
			String currentWeek = pd.getString("CURRENT_WEEK");
			int current = Integer.parseInt(currentWeek);
			pd.put("START_DATE", getWeekStart(current));
			pd.put("END_DATE", getWeekEnd(current));
		}
		if(pd.get("HOMEWORK_ID") != null){
			List<PageData> dataList = homeworkService.report(pd);
			pd.put("DATA", dataList);
		}
		if(pd.get("CLASS_ID") != null){
			List<PageData> studentList = studentService.findByClassId(pd);
			pd.put("STUDENTS", studentList);
		}
		
		pd.remove("JSON");
		Gson gson = new Gson();
		return gson.toJson(pd);
	}



	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "批量删除Homework");
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			homeworkService.deleteHomeworkAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		} else {
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}

	/**
	 * 导出到excel
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/excel")
	public ModelAndView exportExcel() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "导出Homework到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("作业代码"); // 1
		titles.add("作业名称"); // 2
		titles.add("科目ID"); // 3
		titles.add("班级ID"); // 4
		titles.add("年级ID"); // 5
		titles.add("学校ID"); // 6
		titles.add("需要完成时间"); // 7
		titles.add("创建时间"); // 8
		titles.add("修改时间"); // 9
		titles.add("完成次数"); // 10
		titles.add("总分"); // 11
		dataMap.put("titles", titles);
		List<PageData> varOList = homeworkService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("CODE")); // 1
			vpd.put("var2", varOList.get(i).getString("NAME")); // 2
			vpd.put("var3", varOList.get(i).getString("SUBJECT_ID")); // 3
			vpd.put("var4", varOList.get(i).getString("CLASS_ID")); // 4
			vpd.put("var5", varOList.get(i).getString("GRADE_ID")); // 5
			vpd.put("var6", varOList.get(i).getString("SCHOOL_ID")); // 6
			vpd.put("var7", varOList.get(i).getString("COMPLETE_DATE")); // 7
			vpd.put("var8", varOList.get(i).getString("CREATE_DATE")); // 8
			vpd.put("var9", varOList.get(i).getString("MODIFY_DATE")); // 9
			vpd.put("var10", varOList.get(i).get("COMPLETE_COUNT").toString()); // 10
			vpd.put("var11", varOList.get(i).get("ALL_SCORE").toString()); // 11
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv, dataMap);
		return mv;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,
				true));
	}

	/**
	 * 批量删除
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/homereport", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getHomeReport() throws Exception {
		PageData pd = this.getPageData();
		if(pd.get("HOMEWORK_ID") != null && !"".equals(pd.get("HOMEWORK_ID").toString().trim())){
			pd = homeworkService.findById(pd);
			if(pd != null){
				List<PageData> data = homeworkReporService.findByHomeworkID(pd);
				pd.put("STUDENTS", data);
			}else{
				pd.put("HOMEWORK_ID", "no");
			}
		}else{
			pd.put("HOMEWORK_ID", "no data"); 
		}
		Gson gson = new Gson();
		return gson.toJson(pd);
	}
	
	

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/listdata", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listdata(Page page) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = homeworkService.list(page); // 列出Homework列表
		Gson gson = new Gson();
		return gson.toJson(varList);
	}

	@RequestMapping(value = "/savedata", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String savedata() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("HOMEWORK_ID", this.get32UUID());
		homeworkService.save(pd);
		ResponseGson<String> responseGson = new ResponseGson<String>();
		responseGson.setData(pd.getString("HOMEWORK_ID"));
		return responseGson.toJson();
	}

	@RequestMapping(value = "/uploadHomework", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadHomework() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String data = pd.getJsonString();
		ResponseGson<String> responseGson = new ResponseGson<String>();

		Homework homework = Homework.parse(data);

		PageData hpd = new PageData();
		if (homework != null) {
			hpd.put("CODE", get32UUID());
			hpd.put("NAME", homework.getNAME());
			if(homework.getSUBJECT_ID() == null){
				List<PageData> slist = homeworkService.querySubjectId(pd);
				if(slist.size() > 0){
					homework.setSUBJECT_ID(slist.get(0).getString("SUBJECT_ID"));
				}
			}
			hpd.put("SUBJECT_ID", homework.getSUBJECT_ID());
			hpd.put("ALL_SCORE", homework.getALL_SCORE());
			hpd.put("HOMEWORK_DESC", homework.getHOMEWORK_DESC());
			hpd.put("QUESTION_COUNT", homework.getQUESTION_COUNT());
			hpd.put("CREATE_DATE", format.format(new Date()));
			hpd.put("MODIFY_DATE", format.format(new Date()));
			hpd.put("COMPLETE_COUNT", 0);
			hpd.put("TEACHER_ID", homework.getTEACHER_ID());
			hpd.put("COMPLETE_DESC", "");

			if (homework.getCLASSLIST() != null
					&& homework.getCLASSLIST().size() > 0
					&& homework.getQUESTIONS() != null
					&& homework.getQUESTIONS().size() > 0) {
				for (HomeClass homeclass : homework.getCLASSLIST()) {
					hpd.put("CLASS_ID", homeclass.getCLASS_ID());
					hpd.put("COMPLETE_DATE", homeclass.getCOMPLETE_DATE());
					hpd.put("HOMEWORK_ID", this.get32UUID());
					homeworkService.save(hpd);
				}

				for (HomeworkQuestion homeworkQuestion : homework
						.getQUESTIONS()) {
					PageData qpd = new PageData();
					qpd.put("RANK", homeworkQuestion.getRANK());
					qpd.put("CODE", hpd.get("CODE"));
					qpd.put("NAME", homeworkQuestion.getNAME());
					qpd.put("OPTION_NUM", homeworkQuestion.getOPTION_NUM());
					qpd.put("SCORE", homeworkQuestion.getSCORE());
					qpd.put("RIGHT_ANSWER", homeworkQuestion.getRIGHT_ANSWER());
					qpd.put("TYPE", homeworkQuestion.getTYPE());
					qpd.put("HOMEWORKPROBLEM_ID", this.get32UUID());
					qpd.put("HOMEWORK_ID", hpd.get("CODE"));
					homeworkproblemService.save(qpd);
				}

				responseGson.setData(hpd.getString("CODE"));
			} else {
				responseGson.setDataError();
			}
		} else {
			responseGson.setDataError();
		}
		return responseGson.toJson();
	}

	@RequestMapping(value = "/updateHomework", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateHomework() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String data = pd.getJsonString();
		ResponseGson<String> responseGson = new ResponseGson<String>();

		Homework homework = Homework.parse(data);

		PageData hpd = new PageData();
		if (homework != null) {
			if (homework.getHOMEWORK_ID() != null
					&& !"".equals(homework.getHOMEWORK_ID().trim())) {
				hpd.put("HOMEWORK_ID", homework.getHOMEWORK_ID());
				hpd = homeworkService.findById(hpd);
				if(hpd != null){
					hpd.put("NAME", homework.getNAME());
					hpd.put("SUBJECT_ID", homework.getSUBJECT_ID());
					hpd.put("ALL_SCORE", homework.getALL_SCORE());
					hpd.put("HOMEWORK_DESC", homework.getHOMEWORK_DESC());
					hpd.put("QUESTION_COUNT", homework.getQUESTION_COUNT());
					hpd.put("CREATE_DATE", format.format(new Date()));
					hpd.put("MODIFY_DATE", format.format(new Date()));
					hpd.put("COMPLETE_COUNT", 0);
					hpd.put("TEACHER_ID", homework.getTEACHER_ID());
					hpd.put("COMPLETE_DESC", "");
					if(homeworkService.findByCode(hpd).size() > 1){
						hpd.put("CODE", get32UUID());
						for (HomeClass homeclass : homework.getCLASSLIST()) {
							hpd.put("CLASS_ID", homeclass.getCLASS_ID());
							hpd.put("COMPLETE_DATE", homeclass.getCOMPLETE_DATE());
							homeworkService.edit(hpd);
						}
						for (HomeworkQuestion homeworkQuestion : homework
								.getQUESTIONS()) {
							PageData qpd = new PageData();
							qpd.put("RANK", homeworkQuestion.getRANK());
							qpd.put("CODE", hpd.get("CODE"));
							qpd.put("NAME", homeworkQuestion.getNAME());
							qpd.put("OPTION_NUM", homeworkQuestion.getOPTION_NUM());
							qpd.put("SCORE", homeworkQuestion.getSCORE());
							qpd.put("RIGHT_ANSWER",
									homeworkQuestion.getRIGHT_ANSWER());
							qpd.put("TYPE", homeworkQuestion.getTYPE());
							qpd.put("HOMEWORKPROBLEM_ID", this.get32UUID());
							qpd.put("HOMEWORK_ID", hpd.get("CODE"));
							homeworkproblemService.save(qpd);
						}
						responseGson.setData(hpd.getString("CODE"));
					}else{
						for (HomeClass homeclass : homework.getCLASSLIST()) {
							hpd.put("CLASS_ID", homeclass.getCLASS_ID());
							hpd.put("COMPLETE_DATE", homeclass.getCOMPLETE_DATE());
							homeworkService.edit(hpd);
						}
						homeworkproblemService.deleteByCode(hpd);
						for (HomeworkQuestion homeworkQuestion : homework
								.getQUESTIONS()) {
							PageData qpd = new PageData();
							qpd.put("RANK", homeworkQuestion.getRANK());
							qpd.put("CODE", hpd.get("CODE"));
							qpd.put("NAME", homeworkQuestion.getNAME());
							qpd.put("OPTION_NUM", homeworkQuestion.getOPTION_NUM());
							qpd.put("SCORE", homeworkQuestion.getSCORE());
							qpd.put("RIGHT_ANSWER",
									homeworkQuestion.getRIGHT_ANSWER());
							qpd.put("TYPE", homeworkQuestion.getTYPE());
							qpd.put("HOMEWORKPROBLEM_ID", this.get32UUID());
							qpd.put("HOMEWORK_ID", hpd.get("CODE"));
							homeworkproblemService.save(qpd);
						}
						responseGson.setData(hpd.getString("CODE"));
					}
				}else{
					responseGson.setDataError();
				}
			} else {
				responseGson.setDataError();
			}
		} else {
			responseGson.setDataError();
		}
		return responseGson.toJson();
	}
}
