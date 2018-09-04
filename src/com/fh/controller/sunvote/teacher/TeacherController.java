package com.fh.controller.sunvote.teacher;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
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
import com.fh.service.api.V1Manager;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
import com.fh.util.Tools;

/**
 * 说明：教师 创建人：Elvis 创建时间：2018-04-26
 */
@Controller
@RequestMapping(value = "/teacher")
public class TeacherController extends BaseController {

	String menuUrl = "teacher/list.do"; // 菜单地址(权限用)
	@Resource(name = "teacherService")
	private TeacherManager teacherService;

	@Resource(name = "schoolService")
	private SchoolManager schoolService;

	@Resource(name = "userService")
	private UserManager userService;

	@Resource(name = "fhlogService")
	private FHlogManager FHLOG;
	
	@Resource(name = "v1Service")
	private V1Manager v1Service;

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/save")
	public ModelAndView save() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "新增Teacher");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("ID", this.get32UUID());
		teacherService.save(pd);

		pd.put("USER_ID", pd.getString("ID")); // ID 主键
		pd.put("LAST_LOGIN", ""); // 最后登录时间
		pd.put("IP", ""); // IP
		pd.put("STATUS", "0"); // 状态
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");
		pd.put("USERNAME", pd.getString("ACCOUT"));
		pd.put("ROLE_ID", "57bb1e6f138247a0b05cc721a5da1b64");
		pd.put("PASSWORD",
				new SimpleHash("SHA-1", pd.getString("ACCOUT"), pd
						.getString("PASSWORD")).toString()); // 密码加密

		if (null == userService.findByUsername(pd)) { // 判断用户名是否存在
			userService.saveU(pd); // 执行保存
			FHLOG.save(Jurisdiction.getUsername(),
					"新增系统用户：" + pd.getString("USERNAME"));
		}

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
		logBefore(logger, Jurisdiction.getUsername() + "删除Teacher");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return;
		} // 校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("USER_ID", pd.get("ID"));
		teacherService.delete(pd);
		userService.deleteU(pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "修改Teacher");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
			return null;
		} // 校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		teacherService.edit(pd);

		/*
		 * pd.put("USER_ID", pd.getString("ID")); //ID 主键 pd.put("LAST_LOGIN",
		 * ""); //最后登录时间 pd.put("IP", ""); //IP pd.put("STATUS", "0"); //状态
		 * pd.put("SKIN", "default"); pd.put("RIGHTS", ""); pd.put("USERNAME",
		 * pd.getString("ACCOUT")); pd.put("ROLE_ID",
		 * "57bb1e6f138247a0b05cc721a5da1b64"); pd.put("PASSWORD", new
		 * SimpleHash("SHA-1", pd.getString("ACCOUT"),
		 * pd.getString("PASSWORD")).toString()); //密码加密
		 * 
		 * userService.saveU(pd);
		 */

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
	@RequestMapping(value = "/teach_paper")
	public ModelAndView teach_paper(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		String userId = this.getUserID();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("sunvote/teacher/teach_paper");
		pd.put("userId", userId);
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/test_list")
	public ModelAndView test_list(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		String userId = this.getUserID();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userId", userId);
		mv.setViewName("sunvote/teacher/test_list");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/paper_view")
	public ModelAndView paper_view(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		String userId = this.getUserID();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userId", userId);
		mv.setViewName("sunvote/teacher/paper_view");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/paper_view2")
	public ModelAndView paper_view2(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		String userId = this.getUserID();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userId", userId);
		mv.setViewName("sunvote/teacher/paper_view2");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/paper_view1")
	public ModelAndView paper_view1(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		String userId = this.getUserID();
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userId", userId);
		mv.setViewName("sunvote/teacher/paper_view1");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/set_question")
	public ModelAndView set_question(Page page) throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "列表Paper");
		ModelAndView mv = this.getModelAndView();
		String userId = this.getUserID();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("userId", userId);
		mv.setViewName("sunvote/teacher/set_question");
		mv.addObject("pd", pd);
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
		logBefore(logger, Jurisdiction.getUsername() + "列表Teacher");
		// if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		// //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = teacherService.list(page); // 列出Teacher列表
		mv.setViewName("sunvote/teacher/teacher_list");
		mv.addObject("varList", varList);

		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools", schools);

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
		mv.setViewName("sunvote/teacher/teacher_edit");

		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools", schools);

		mv.addObject("msg", "save");
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
		pd = teacherService.findById(pd); // 根据ID读取
		mv.setViewName("sunvote/teacher/teacher_edit");
		List<PageData> schools = schoolService.listAll(pd);
		mv.addObject("schools", schools);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
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
		logBefore(logger, Jurisdiction.getUsername() + "批量删除Teacher");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
			return null;
		} // 校验权限
		PageData pd = new PageData();
		Map<String, Object> map = new HashMap<String, Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if (null != DATA_IDS && !"".equals(DATA_IDS)) {
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			teacherService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername() + "导出Teacher到excel");
		if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
			return null;
		}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("所在学校"); // 1
		titles.add("姓名"); // 2
		titles.add("电话"); // 3
		titles.add("座机电话"); // 4
		titles.add("证件号"); // 5
		titles.add("账号"); // 6
		titles.add("密码"); // 7
		titles.add("性别"); // 8
		titles.add("科目列表"); // 9
		titles.add("教师卡编号"); // 10
		dataMap.put("titles", titles);
		List<PageData> varOList = teacherService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varOList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).get("SCHOOL_ID").toString()); // 1
			vpd.put("var2", varOList.get(i).getString("NAME")); // 2
			vpd.put("var3", varOList.get(i).getString("PHONE")); // 3
			vpd.put("var4", varOList.get(i).getString("SEAT_PHONE")); // 4
			vpd.put("var5", varOList.get(i).getString("CARD_NO")); // 5
			vpd.put("var6", varOList.get(i).getString("ACCOUT")); // 6
			vpd.put("var7", varOList.get(i).getString("PASSWORD")); // 7
			vpd.put("var8", varOList.get(i).get("SEX").toString()); // 8
			vpd.put("var9", varOList.get(i).getString("SUBJECT_IDS")); // 9
			vpd.put("var10", varOList.get(i).getString("KEYPAD_ID")); // 10
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
	@RequestMapping(value = "/info", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object info() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		pd.put("ID", this.geTeacherID());
		PageData pageData = teacherService.findById(pd);
		if (pageData != null && pageData.getString("ID") != null) {
			pageData.put("PASSWORD", "");// 返回参数中不返回密码
			PageData pt = new PageData();
			pt.put("TEACHER_ID", pageData.get("ID"));
			// 在任课表中查找老师教哪些班级，然后查出班级信息
			List<PageData> classInfoList = v1Service
					.getTeacherClassInfo(pt);
			
			pageData.put("classInfoList", classInfoList);
			// 在认可表中查找老师教哪些科目，然后查出科目信息
			List<PageData> subjectList = v1Service
					.getTeacherSubjectInfo(pt);
			// 一个sql语句完成。
			pageData.put("subjectList", subjectList);
			
			pageData.remove("SUBJECT_IDS");
			
			PageData eventPd = new PageData();
			eventPd.put("EVENT_ID", get32UUID());
			eventPd.put("EVENT_NAME", "login");
			eventPd.put("EVENT_USER", pageData.getString("ID"));
			eventPd.put("EVENT_TYPE", "0");
			eventPd.put("EVENT_START_TIME", Tools.date2Str(new Date()));
			if (pd.getString("CLIENT_ID") != null) {
				eventPd.put("CLIENT_ID", pd.getString("CLIENT_ID"));
			} else {
				eventPd.put("CLIENT_ID", "CLIENT");
			}
			res.setData(pageData);
			// 填充数据到返回数据中
		} else {
			res.set1Error();
		}
		
		return res.toJson();
	}

}
