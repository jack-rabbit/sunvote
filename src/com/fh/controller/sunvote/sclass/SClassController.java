package com.fh.controller.sunvote.sclass;

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

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.sunvote.basestation.BasestationManager;
import com.fh.service.sunvote.classtype.ClassTypeManager;
import com.fh.service.sunvote.grade.GradeManager;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.service.sunvote.sclass.SClassManager;
import com.fh.service.system.fhlog.FHlogManager;

/** 
 * 说明：班级
 * 创建人：Elvis
 * 创建时间：2018-04-25
 */
@Controller
@RequestMapping(value="/sclass")
public class SClassController extends BaseController {
	
	String menuUrl = "sclass/list.do"; //菜单地址(权限用)
	@Resource(name="sclassService")
	private SClassManager sclassService;
	
	@Resource(name="schoolService")
	private SchoolManager schoolService;
	
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	
	@Resource(name="gradeService")
	private GradeManager gradeService;
	
	@Resource(name="classtypeService")
	private ClassTypeManager classtypeService;
	
	@Resource(name="basestationService")
	private BasestationManager basestationService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增SClass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", get32UUID());
		sclassService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除SClass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		sclassService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SClass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		sclassService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表SClass");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		mv.setViewName("sunvote/sclass/sclass_list");
		List<PageData>	varList = sclassService.list(page);	//列出SClass列表
		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools",schools);
		List<PageData> basestations = basestationService.listAll(pd);
		mv.addObject("basestations",basestations);
		List<PageData> grades = gradeService.listAll(pd);
		mv.addObject("grades", grades);
		List<PageData> classTypes = classtypeService.listAll(pd);
		mv.addObject("classTypes", classTypes);
		mv.addObject("varList", varList);
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
		mv.setViewName("sunvote/sclass/sclass_edit");
		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools",schools);
		List<PageData> basestations = basestationService.listAll(pd);
		mv.addObject("basestations",basestations);
		List<PageData> grades = gradeService.listAll(pd);
		mv.addObject("grades", grades);
		List<PageData> classTypes = classtypeService.listAll(pd);
		mv.addObject("classTypes", classTypes);
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
		pd = sclassService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/sclass/sclass_edit");
		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools",schools);
		List<PageData> basestations = basestationService.listAll(pd);
		mv.addObject("basestations",basestations);
		List<PageData> grades = gradeService.listAll(pd);
		mv.addObject("grades", grades);
		List<PageData> classTypes = classtypeService.listAll(pd);
		mv.addObject("classTypes", classTypes);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除SClass");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			sclassService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出SClass到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("所属学校");	//1
		titles.add("所属年级");	//2
		titles.add("班级类型");	//3
		titles.add("班级名称");	//4
		titles.add("班级编码");	//5
		titles.add("班级基站");	//6
		dataMap.put("titles", titles);
		List<PageData> varOList = sclassService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SCHOOL_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("GRADE_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("CLASS_TYPE"));	    //3
			vpd.put("var4", varOList.get(i).getString("CLASS_NAME"));	    //4
			vpd.put("var5", varOList.get(i).getString("CLASS_CODE"));	    //5
			vpd.put("var6", varOList.get(i).getString("BASESTATION_ID"));	    //6
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
