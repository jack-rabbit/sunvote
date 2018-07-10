package com.fh.controller.software.firmware;

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
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.Tools;
import com.fh.service.software.firmware.FirmwareManager;

/** 
 * 说明：固件管理
 * 创建人：FH Q313596790
 * 创建时间：2018-07-09
 */
@Controller
@RequestMapping(value="/firmware")
public class FirmwareController extends BaseController {
	
	String menuUrl = "firmware/list.do"; //菜单地址(权限用)
	@Resource(name="firmwareService")
	private FirmwareManager firmwareService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save(@RequestParam(value="PRODUCT_IMAGE",required=false) MultipartFile[] files, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Firmware");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData(request);
		pd.put("FIRMWARE_ID", this.get32UUID());	//主键
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));
		String path = request.getSession().getServletContext()
				.getRealPath("/uploadFiles/uploadFile/");
		int index = 0 ;
		String FIRM_PATH = "" ;
		if (files != null) {
			for (MultipartFile file : files) {
				if (file != null) {
					String name = pd.getString("FIRMWARE_ID")+ "_"	+ index	+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
					File pathFile = new File(path);
					pathFile.mkdirs();
					File saveFile = new File(path + File.separator + name);
					if (saveFile.exists()) {
						saveFile.delete();
					}
					saveFile.createNewFile();
					file.transferTo(saveFile);
					FIRM_PATH += name + ";";
				}
				index++;
			}
		}
		
		pd.put("PRODUCT_IMAGE", FIRM_PATH);
		firmwareService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Firmware");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		firmwareService.delete(pd);
		String path = request.getSession().getServletContext()
				.getRealPath("/uploadFiles/uploadFile/");
		String fileList = pd.getString("PRODUCT_IMAGE");
		String[] fileName = fileList.split(";");
		for(String fName:fileName){
			File file = new File(path + File.separator + fName);
			file.deleteOnExit();
		}
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(@RequestParam(value="PRODUCT_IMAGE",required=false) MultipartFile[] files, HttpServletRequest request) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Firmware");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String path = request.getSession().getServletContext()
				.getRealPath("/uploadFiles/uploadFile/");
		int index = 0 ;
		String FIRM_PATH = "" ;
		if (files != null) {
			for (MultipartFile file : files) {
				System.out.println("filename:" + file.getSize());
				if (file != null && file.getSize() != 0) {
					String name = pd.getString("FIRMWARE_ID")
							+ "_"
							+ index
							+ file.getOriginalFilename()
									.substring(
											file.getOriginalFilename()
													.lastIndexOf("."));
					File pathFile = new File(path);
					pathFile.mkdirs();
					File saveFile = new File(path + File.separator + name);
					if (saveFile.exists()) {
						saveFile.delete();
					}
					saveFile.createNewFile();
					file.transferTo(saveFile);
					FIRM_PATH += name + ";";
				}else{
					String imagePath = pd.getString("PRODUCT_IMAGE" + index);
					if(imagePath != null){
						FIRM_PATH += imagePath + ";";
					}else{
						FIRM_PATH += ";";
					}
				}
				index++;
			}
		}
		pd.put("PRODUCT_IMAGE", FIRM_PATH);
		firmwareService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Firmware");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("KEYWORDS");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("KEYWORDS", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = firmwareService.list(page);	//列出Firmware列表
		mv.setViewName("software/firmware/firmware_list");
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
		mv.setViewName("software/firmware/firmware_edit");
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
		pd = firmwareService.findById(pd);	//根据ID读取
		String PRODUCT_IMAGE = pd.getString("PRODUCT_IMAGE");
		String[] PRODUCT_IMAGEs = PRODUCT_IMAGE.split(";");
		pd.put("PRODUCT_IMAGE", PRODUCT_IMAGEs);
		mv.setViewName("software/firmware/firmware_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Firmware");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			firmwareService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Firmware到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("产品名称");	//1
		titles.add("货品编号");	//2
		titles.add("应用行业");	//3
		titles.add("产品状态");	//4
		titles.add("产品规格");	//5
		titles.add("产品功能");	//6
		titles.add("产品性能");	//7
		titles.add("适配硬件");	//8
		titles.add("适配软件");	//9
		titles.add("产品认证");	//10
		titles.add("注意事项");	//11
		titles.add("产品照片");	//12
		dataMap.put("titles", titles);
		List<PageData> varOList = firmwareService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("PRODUCT_NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("PRODUCT_NO"));	    //2
			vpd.put("var3", varOList.get(i).getString("INDUSTRY"));	    //3
			vpd.put("var4", varOList.get(i).getString("PRODUCT_STATE"));	    //4
			vpd.put("var5", varOList.get(i).getString("PRODUCT_SPEC"));	    //5
			vpd.put("var6", varOList.get(i).getString("PRODUCT_FUNC"));	    //6
			vpd.put("var7", varOList.get(i).getString("PRODUCT_PERF"));	    //7
			vpd.put("var8", varOList.get(i).getString("ADAPTABLE_HARDWARE"));	    //8
			vpd.put("var9", varOList.get(i).getString("ADAPTABLE_SOFTWARE"));	    //9
			vpd.put("var10", varOList.get(i).getString("PRODUCT_CERT"));	    //10
			vpd.put("var11", varOList.get(i).getString("REMARK"));	    //11
			vpd.put("var12", varOList.get(i).getString("PRODUCT_IMAGE"));	    //12
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
