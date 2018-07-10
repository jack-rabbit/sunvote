package com.fh.controller.software.firm;

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
import com.fh.service.software.firm.FirmManager;
import com.fh.service.software.firmware.FirmwareManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;

/** 
 * 说明：固件管理
 * 创建人：FH Q313596790
 * 创建时间：2018-07-09
 */
@Controller
@RequestMapping(value="/firm")
public class FirmController extends BaseController {
	
	String menuUrl = "firm/list.do"; //菜单地址(权限用)
	@Resource(name="firmService")
	private FirmManager firmService;
	
	@Resource(name="firmwareService")
	private FirmwareManager firmwareService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam(value="FIRM_PATH",required=false) MultipartFile file, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Firm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData(request);
		pd.put("FIRM_ID", this.get32UUID());	//主键
		String path = request.getSession().getServletContext()
				.getRealPath("/uploadFiles/uploadFile/");
		if (file != null) {
			String name = pd.getString("FIRM_ID") + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			File pathFile = new File(path);
			pathFile.mkdirs();
			File saveFile = new File(path + File.separator + name);
			if (saveFile.exists()) {
				saveFile.delete();
			}
			saveFile.createNewFile();
			file.transferTo(saveFile);
			pd.put("FIRM_PATH", name);
		}
		firmService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out,HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Firm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		firmService.delete(pd);
		String path = request.getSession().getServletContext()
				.getRealPath("/uploadFiles/uploadFile/");
		File file = new File(path + File.separator + pd.getString("FIRM_PATH"));
		file.deleteOnExit();
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Firm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		firmService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Firm");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = firmService.list(page);	//列出Firm列表
		mv.setViewName("software/firm/firm_list");
		List<PageData> productList = firmwareService.listAll(pd);
		mv.addObject("productList",productList);
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
		mv.setViewName("software/firm/firm_edit");
		mv.addObject("msg", "save");
		List<PageData> productList = firmwareService.listAll(pd);
		mv.addObject("productList",productList);
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
		pd = firmService.findById(pd);	//根据ID读取
		mv.setViewName("software/firm/firm_edit");
		List<PageData> productList = firmwareService.listAll(pd);
		mv.addObject("productList",productList);
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Firm");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			firmService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Firm到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("产品名称");	//1
		titles.add("固件版本");	//2
		titles.add("固件版本号");	//3
		titles.add("固件路径");	//4
		titles.add("固件描述");	//5
		dataMap.put("titles", titles);
		List<PageData> varOList = firmService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PRODUCT_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("FIRM_VERSION"));	    //2
			vpd.put("var3", varOList.get(i).get("FRIM_CODE").toString());	//3
			vpd.put("var4", varOList.get(i).getString("FIRM_PATH"));	    //4
			vpd.put("var5", varOList.get(i).getString("FIRM_DESC"));	    //5
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
