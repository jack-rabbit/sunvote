package com.fh.controller.sunvote.student;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.util.AppUtil;
import com.fh.util.Const;
import com.fh.util.FileUpload;
import com.fh.util.ObjectExcelRead;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.util.PathUtil;
import com.fh.util.Tools;
import com.fh.service.sunvote.classroster.ClassRosterManager;
import com.fh.service.sunvote.student.StudentManager;

/** 
 * 说明：学生管理
 * 创建人：Elvis
 * 创建时间：2018-04-28
 */
@Controller
@RequestMapping(value="/student")
public class StudentController extends BaseController {
	
	String menuUrl = "student/list.do"; //菜单地址(权限用)
	@Resource(name="studentService")
	private StudentManager studentService;
	
	@Resource(name="classrosterService")
	private ClassRosterManager classrosterService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData(); 	 
		studentService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"新增Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String studentID = this.get32UUID();
		pd.put("ID", studentID);
		pd.put("STUDENT_ID", studentID);
		studentService.save(pd);
		
		String termID = pd.getString("TERM_ID");
		String classID = pd.getString("CLASS_ID");
		pd.put("CLASSROSTER_ID", get32UUID());
		pd.put("TEAMID", termID);
		pd.put("SCLASS_ID", classID);
		classrosterService.save(pd);
		
		
		
		mv.addObject("msg","success");
		mv.setViewName("save_result2");
		return mv;
	}
	
	
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goUploadExcel")
	public ModelAndView goUploadExcel()throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.addObject("pd", getPageData());
		
		
		mv.setViewName("sunvote/student/uploadexcel");
		return mv;
	}
	
	
	/**从EXCEL导入到数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/readExcel")
	public ModelAndView readExcel(
			@RequestParam(value="excel",required=false) MultipartFile file
			) throws Exception{
		logBefore(logger,Jurisdiction.getUsername() + "从EXCEL导入到数据库");
		ModelAndView mv = this.getModelAndView();
		PageData tpd = getPageData();
		PageData pd = new PageData();
		String termID = tpd.getString("TERM_ID");
		String classID = tpd.getString("CLASS_ID");
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;								//文件上传路径
			String fileName =  FileUpload.fileUp(file, filePath, "userexcel");							//执行上传
			List<PageData> listPd = (List)ObjectExcelRead.readExcel(filePath, fileName, 0, 0, 0);		//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			if(listPd.size() > 0 ){
				pd= listPd.get(0);
				for(int i = 1 ; i < listPd.size();i++){
					PageData savePd = new PageData();
					PageData temp = listPd.get(i);
					for(int j = 0 ; ;j++){
						if(temp.get("var" + j) == null){
							break ;
						}
						if(temp.get("var" + j) != null && !"".equals(temp.get("var" + j).toString())){
							savePd.put(pd.getString("var" + j).toUpperCase(), temp.get("var" + j));
						}
					}
					if(!savePd.containsKey("ID")){
						if (savePd.values().size() > 0) {
							String studentId = this.get32UUID();
							savePd.put("ID", studentId);
							studentService.save(savePd);

							if (classID != null && termID != null) {
								savePd.put("STUDENT_ID", studentId);
								savePd.put("CLASSROSTER_ID", get32UUID());
								savePd.put("TEAMID", termID);
								savePd.put("SCLASS_ID", classID);
								classrosterService.save(savePd);
							}
						}
						
					}else{
						studentService.edit(savePd);
					}
				}
				
			}
		}
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Student");
		PageData pd = new PageData();
		pd = this.getPageData();
		studentService.delete(pd);
		pd.put("STUDENT_ID", pd.get("ID"));
		classrosterService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		studentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"修改Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		studentService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("KEYWORDS");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = studentService.list(page);	//列出Student列表
		mv.setViewName("sunvote/student/student_list");
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
	public ModelAndView listClassStudent(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Student");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	varList = studentService.datalistclassPage(page);	//列出Student列表
		mv.setViewName("sunvote/student/student_list2");
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
		mv.setViewName("sunvote/student/student_edit");
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
		mv.setViewName("sunvote/student/student_edit2");
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
		PageData pd = this.getPageData();
		pd = studentService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/student/student_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit2")
	public ModelAndView goEdit2()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String classID = pd.getString("CLASS_ID");
		pd = studentService.findById(pd);	//根据ID读取
		pd.put("CLASS_ID", classID);
		mv.setViewName("sunvote/student/student_edit2");
		mv.addObject("msg", "edit2");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Student");
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			studentService.deleteAll(ArrayDATA_IDS);
			classrosterService.deleteAllByStudentID(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Student到excel");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("学生姓名");	//1
		titles.add("学籍号");	//2
		titles.add("学号");	//3
		titles.add("性别");	//4
		titles.add("组号");	//5
		titles.add("签到码");	//6
		titles.add("家长姓名");	//7
		titles.add("家长手机号");	//8
		titles.add("键盘ID");	//9
		titles.add("备注");	//10
		dataMap.put("titles", titles);
		List<PageData> varOList = studentService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("NAME"));	    //1
			vpd.put("var2", varOList.get(i).getString("SNO"));	    //2
			vpd.put("var3", varOList.get(i).getString("NUMBER"));	    //3
			vpd.put("var4", varOList.get(i).get("SEX").toString());	//4
			vpd.put("var5", varOList.get(i).getString("GROUP"));	    //5
			vpd.put("var6", varOList.get(i).getString("SIGN_NO"));	    //6
			vpd.put("var7", varOList.get(i).getString("PARENT_NAME"));	    //7
			vpd.put("var8", varOList.get(i).getString("PARENT_PHONE"));	    //8
			vpd.put("var9", varOList.get(i).getString("KEYPAD_ID"));	    //9
			vpd.put("var10", varOList.get(i).getString("REMARK"));	    //10
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
