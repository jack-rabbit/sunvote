package com.fh.controller.feedback.feedback;

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
import com.fh.service.feedback.feedback.FeedbackManager;
import com.fh.service.system.fhlog.FHlogManager;

/** 
 * 说明：用户反馈模块
 * 创建人：Elvis
 * 创建时间：2018-05-03
 */
@Controller
@RequestMapping(value="/feedback")
public class FeedbackController extends BaseController {
	
	String menuUrl = "feedback/list.do"; //菜单地址(权限用)
	@Resource(name="feedbackService")
	private FeedbackManager feedbackService;
	
	@Resource(name="fhlogService")
	private FHlogManager FHLOG;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Feedback");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROCESSING_DATE", Tools.date2Str(new Date()));
		FHLOG.save(getUsername(), "新增Feedback:");
		feedbackService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Feedback");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		feedbackService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Feedback");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PROCESSING_DATE", Tools.date2Str(new Date()));
		FHLOG.save(getUsername(), "修改Feedback:" + pd.toString());
		feedbackService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Feedback");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = feedbackService.list(page);	//列出Feedback列表
		mv.setViewName("feedback/feedback/feedback_list");
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
		mv.setViewName("feedback/feedback/feedback_edit");
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
		pd = feedbackService.findById(pd);	//根据ID读取
		
		mv.setViewName("feedback/feedback/feedback_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Feedback");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			feedbackService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Feedback到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("学校地址省");	//1
		titles.add("学校地址市");	//2
		titles.add("联系人");	//3
		titles.add("联系电话");	//4
		titles.add("产品序列号");	//5
		titles.add("问题现象");	//6
		titles.add("操作系统");	//7
		titles.add("软件版本");	//8
		titles.add("软件名称");	//9
		titles.add("异常数量");	//10
		titles.add("详细描述");	//11
		titles.add("问题图片");	//12
		titles.add("客户编码");	//13
		titles.add("处理人");	//14
		titles.add("报告日期");	//15
		titles.add("处理时间");	//16
		titles.add("产品类型");	//17
		titles.add("产品型号");	//18
		dataMap.put("titles", titles);
		List<PageData> varOList = feedbackService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SCHOOL_ADDRESS1"));	    //1
			vpd.put("var2", varOList.get(i).getString("SCHOOL_ADDRESS2"));	    //2
			vpd.put("var3", varOList.get(i).getString("CONTACT_PHONE"));	    //3
			vpd.put("var4", varOList.get(i).getString("PHONE_CONTACT"));	    //4
			vpd.put("var5", varOList.get(i).getString("PRODUCT_SEQ"));	    //5
			vpd.put("var6", varOList.get(i).getString("QUESTION_NAME"));	    //6
			vpd.put("var7", varOList.get(i).getString("OS"));	    //7
			vpd.put("var8", varOList.get(i).getString("SOFTWARE_VERSION"));	    //8
			vpd.put("var9", varOList.get(i).getString("SOFTWARE_NAME"));	    //9
			vpd.put("var10", varOList.get(i).getString("EXCEPTION_NUM"));	    //10
			vpd.put("var11", varOList.get(i).getString("DESCRIPTION"));	    //11
			vpd.put("var12", varOList.get(i).getString("PROBLEM_PATH"));	    //12
			vpd.put("var13", varOList.get(i).getString("CUSTOMER_CODE"));	    //13
			vpd.put("var14", varOList.get(i).getString("PERSON_LIABLE"));	    //14
			vpd.put("var15", varOList.get(i).getString("CREATE_DATE"));	    //15
			vpd.put("var16", varOList.get(i).getString("PROCESSING_DATE"));	    //16
			vpd.put("var17", varOList.get(i).getString("PRODUCT_TYPE"));	    //17
			vpd.put("var18", varOList.get(i).getString("PRODUCT_MODEL"));	    //18
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
