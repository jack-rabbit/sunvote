package com.fh.controller.sunvote.pagetemplate;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.bean.Paper;
import com.fh.bean.Question;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.sunvote.pagetemplate.PageTemplateManager;
import com.fh.service.sunvote.schoolgradesubject.SchoolGradeSubjectManager;

/** 
 * 说明：试卷模板管理
 * 创建人：FH Q313596790
 * 创建时间：2018-10-29
 */
@Controller
@RequestMapping(value="/pagetemplate")
public class PageTemplateController extends BaseController {
	
	String menuUrl = "pagetemplate/list.do"; //菜单地址(权限用)
	@Resource(name="pagetemplateService")
	private PageTemplateManager pagetemplateService;
	
	@Resource(name="schoolgradesubjectService")
	private SchoolGradeSubjectManager schoolgradesubjectService;
	
	/**保存
	 * 
	 * 模板内容（数组）
	题型
	小题个数
	每个题目的选项数
	每个题目的分数
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增PageTemplate");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PAGETEMPLATE_ID", this.get32UUID());	//主键
		pagetemplateService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除PageTemplate");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pagetemplateService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改PageTemplate");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pagetemplateService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表PageTemplate");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = pagetemplateService.list(page);	//列出PageTemplate列表
		mv.setViewName("sunvote/pagetemplate/pagetemplate_list");
		mv.addObject("varList", varList);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表PageTemplate");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = pagetemplateService.list(page);	//列出PageTemplate列表
		mv.setViewName("sunvote/pagetemplate/pagetemplate_list2");
		List<PageData>	gradeList = schoolgradesubjectService.listAllGrade(pd);
		List<PageData>	subjectList = schoolgradesubjectService.listAllSubject(pd);
		mv.addObject("varList", varList);
		mv.addObject("gradeList", gradeList);
		mv.addObject("subjectList", subjectList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
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
		mv.setViewName("sunvote/pagetemplate/pagetemplate_edit");
		mv.addObject("msg", "save");
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
		pd = this.getPageData();
		pd = pagetemplateService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/pagetemplate/pagetemplate_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除PageTemplate");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			pagetemplateService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出PageTemplate到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("模板名称");	//1
		titles.add("学校");	//2
		titles.add("科目");	//3
		titles.add("年级");	//4
		titles.add("用户ID");	//5
		titles.add("试卷总分");	//6
		titles.add("模板内容");	//7
		dataMap.put("titles", titles);
		List<PageData> varOList = pagetemplateService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("SCHOOL_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("SUBJECT_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("GRADE_ID"));	    //4
			vpd.put("var5", varOList.get(i).getString("USER_ID"));	    //5
			vpd.put("var6", varOList.get(i).getString("PAGE_SCORE"));	    //6
			vpd.put("var7", varOList.get(i).getString("CONTENT"));	    //7
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@RequestMapping(value="/npaper")
	public ModelAndView newpaper() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"Paper详细信息");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String paperType = pd.getString("PAPER_TYPE") ;
		Paper paper = new Paper();
		paper.setTitle(pd.getString("NAME"));
		paper.setExam_time(pd.getString("TIME"));
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		paper.setUser_id(user.getUSER_ID());
		paper.setPaper_type(paperType == null || "".equals(paperType.trim()) ? "1" :paperType);
		String subjectId = pd.getString("SUBJECT_ID");
		paper.setSubject_id(subjectId == null || "".equals(subjectId.trim())? getSubjectId():subjectId);
		String gradeId = pd.getString("GRADE_ID");
		paper.setGrade_id( gradeId== null || "".equals(gradeId.trim())? getGradeID() : gradeId);
		String schoolId = pd.getString("SCHOOL_ID") ;
		paper.setSchool_id(schoolId == null || "".equals(schoolId.trim())? getSchoolID() : schoolId);
		paper.setQuestions(new ArrayList<Question>());
		
		pd.put("JSON", paper.toJson());
		logger.info(paper.toJson());
		
		String TEMPLATE_ID = pd.getString("TEMPLATE_ID");
		if(TEMPLATE_ID != null && !"".equals(TEMPLATE_ID)){
			pd.put("PAGETEMPLATE_ID", TEMPLATE_ID);
			PageData template = pagetemplateService.findById(pd);
			mv.addObject("TEMPLEATE", template);
		}
		
		if(isChineseLanguageClient()){
			mv.setViewName("sunvote/teacher/creat_template");
		}else{
			mv.setViewName("sunvote/teacher/en_creat_question");
		}
		mv.addObject("pd", pd);
		if(paperType != null && "2".equals(paperType)){
			mv.addObject("JUMP_URL", "/main/admin");
		}else{
			mv.addObject("JUMP_URL", "/main/teacher");
		}
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
