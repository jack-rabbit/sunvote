package com.fh.controller.software.softwareversion;

import java.io.File;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.controller.sunvote.Myelfun;
import com.fh.entity.Page;
import com.fh.service.software.software.SoftWareManager;
import com.fh.service.software.softwareversion.SoftwareVersionManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：软件管理
 * 创建人：FH Q313596790
 * 创建时间：2018-06-14
 */
@Controller
@RequestMapping(value="/softwareversion")
public class SoftwareVersionController extends BaseController {
	
	String menuUrl = "softwareversion/list.do"; //菜单地址(权限用)
	@Resource(name="softwareversionService")
	private SoftwareVersionManager softwareversionService;
	
	@Resource(name="softwareService")
	private SoftWareManager softwareService;
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam(value="VERSION_PATH",required=false) MultipartFile file, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增SoftwareVersion");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SOFTWAREVERSION_ID", this.get32UUID());	//主键
		if (file != null && pd.getString("SOFTWARE_ID") != null) {
			String path = request.getSession().getServletContext()
					.getRealPath("/uploadFiles/uploadFile/");
			String name = Myelfun.findSoftwareName(pd.getString("SOFTWARE_ID"))
					+ "_" + pd.getString("VERSION_NAME") + "_"
					+ file.getOriginalFilename();
			File pathFile = new File(path);
			pathFile.mkdirs();
			File saveFile = new File(path + File.separator + name);
			if(saveFile.exists()){
				saveFile.delete();
			}
			saveFile.createNewFile();
			file.transferTo(saveFile);
			pd.put("VERSION_PATH", name);
			softwareversionService.save(pd);
			mv.addObject("msg", "success");
		}else{
			mv.addObject("msg", "fail");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除SoftwareVersion");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		softwareversionService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改SoftwareVersion");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		softwareversionService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表SoftwareVersion");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = softwareversionService.list(page);	//列出SoftwareVersion列表
		mv.setViewName("software/softwareversion/softwareversion_list");
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
		mv.setViewName("software/softwareversion/softwareversion_edit");
		List<PageData> softwares = softwareService.listAll(pd);
		mv.addObject("softwares", softwares);
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
		pd = softwareversionService.findById(pd);	//根据ID读取
		mv.setViewName("software/softwareversion/softwareversion_edit");
		List<PageData> softwares = softwareService.listAll(pd);
		mv.addObject("softwares", softwares);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除SoftwareVersion");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			softwareversionService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出SoftwareVersion到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("软件名称");	//1
		titles.add("版本名称");	//2
		titles.add("版本代号");	//3
		titles.add("版本存放路径");	//4
		titles.add("更新描述");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = softwareversionService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("SOFTWARE_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("VERSION_NAME"));	    //2
			vpd.put("var3", varOList.get(i).getString("VERSION_CODE"));	    //3
			vpd.put("var4", varOList.get(i).getString("VERSION_PATH"));	    //4
			vpd.put("var5", varOList.get(i).getString("VERSION_DESC"));	    //5
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
