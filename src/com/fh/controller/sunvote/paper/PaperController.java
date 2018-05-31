package com.fh.controller.sunvote.paper;

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
import com.fh.service.api.V1Manager;
import com.fh.service.sunvote.paper.PaperManager;
import com.fh.service.sunvote.paperquestion.PaperQuestionManager;

/** 
 * 说明：试卷
 * 创建时间：2018-05-17
 */
@Controller
@RequestMapping(value="/paper")
public class PaperController extends BaseController {
	
	String menuUrl = "paper/list.do"; //菜单地址(权限用)
	@Resource(name="paperService")
	private PaperManager paperService;
	
	@Resource(name="paperquestionService")
	private PaperQuestionManager paperquestionService;
	
	@Resource(name = "v1Service")
	private V1Manager v1Service ;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("PAPER_ID", this.get32UUID());	//主键
		paperService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/newpaper")
	public ModelAndView newPaper() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Paper");
		ModelAndView mv = this.getModelAndView();
	
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Paper");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		String[] ArrayDATA_IDS = new String[]{pd.getString("PAPER_ID")};
		paperquestionService.deleteAllPaper(ArrayDATA_IDS);
		paperService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Paper");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		paperService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Paper");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = paperService.list(page);	//列出Paper列表
		mv.setViewName("sunvote/paper/paper_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@RequestMapping(value="/iteminfo")
	public ModelAndView iteminfo() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"Paper详细信息");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		if(pd.containsKey("PAPER_ID")){
			try{
				Paper paper = new Paper();
				PageData ppd = paperService.findById(pd);
				if(ppd != null){
				paper.setTitle(ppd.getString("TITLE"));
				paper.setExam_time(ppd.getString("EXAM_TIME"));
				paper.setUser_id(ppd.getString("USER_ID"));
				paper.setPaper_type(ppd.getString("PAPER_TYPE"));
				paper.setSubject_id(ppd.getString("SUBJECT_ID"));
				paper.setGrade_id(ppd.getString("GRADE_ID"));
				paper.setScore(ppd.getString("SCORE"));
				paper.setQuestions(new ArrayList<Question>());
				
				List<PageData> questList = v1Service.getTestPaperInfo(pd);
				for(PageData qpd : questList){
					Question question = new Question();
					question.setAnswer(qpd.getString("ANSWER"));
					question.setQuestion_id(qpd.getString("QUESTION_ID"));
					question.setSubject_id(qpd.getString("SUBJECT_ID"));
					question.setChapter_id(qpd.getString("CHAPTER_ID"));
					question.setProblem_type_id(qpd.getString("PROBLEM_TYPE_ID"));
					question.setKnowledge_id(qpd.getString("KNOWLEDGE_ID"));
					question.setContent(qpd.getString("CONTENT"));
					question.setOption_num(qpd.getString("OPTION_NUM"));
					question.setOption_content(qpd.getString("OPTION_CONTENT"));
					question.setDifficulty(qpd.getString("DIFFICULTY"));
					question.setAnalysis(qpd.getString("ANALYSIS"));
					question.setQuestion_from(qpd.getString("QUESTION_FROM"));
					question.setSug_score(qpd.getString("SUG_SCORE"));
					question.setSug_part_score(qpd.getString("SUG_PART_SCORE"));
					question.setRank(qpd.getString("RANK"));
					question.setNo_name(qpd.getString("NO_NAME"));
					if("-1".equals("" + qpd.getString("P_ID"))){
						PageData pidPd = new PageData();
						pidPd.put("PID", question.getQuestion_id());
						question.setQuestions(new ArrayList<Question>());
						List<PageData> qs = v1Service.getQuestionsByPID(pidPd);
						for(PageData q : qs){
							Question qq = new Question();
							qq.setAnswer(q.getString("ANSWER"));
							qq.setQuestion_id(q.getString("QUESTION_ID"));
							qq.setSubject_id(q.getString("SUBJECT_ID"));
							qq.setChapter_id(q.getString("CHAPTER_ID"));
							qq.setProblem_type_id(q.getString("PROBLEM_TYPE_ID"));
							qq.setKnowledge_id(q.getString("KNOWLEDGE_ID"));
							qq.setContent(q.getString("CONTENT"));
							qq.setOption_num(q.getString("OPTION_NUM"));
							qq.setOption_content(q.getString("OPTION_CONTENT"));
							qq.setDifficulty(q.getString("DIFFICULTY"));
							qq.setAnalysis(q.getString("ANALYSIS"));
							qq.setQuestion_from(q.getString("QUESTION_FROM"));
							qq.setSug_score(q.getString("SUG_SCORE"));
							qq.setSug_part_score(q.getString("SUG_PART_SCORE"));
							qq.setRank(q.getString("RANK"));
							qq.setNo_name(q.getString("NO_NAME"));
							question.getQuestions().add(qq);
						}
					}
					if("-1".equals(qpd.getString("P_ID")) || "0".equals(qpd.getString("P_ID"))){
						paper.getQuestions().add(question);
					}
				}
				pd.put("JSON", paper.toJson());
				logger.info(paper.toJson());
				
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		mv.setViewName("sunvote/teacher/creat_question");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	@RequestMapping(value="/npaper")
	public ModelAndView newpaper() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"Paper详细信息");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Paper paper = new Paper();
		paper.setTitle(pd.getString("NAME"));
		paper.setExam_time(pd.getString("TIME"));
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		paper.setUser_id(user.getUSER_ID());
		paper.setPaper_type("1");
		paper.setSubject_id("1");
		paper.setGrade_id("1");
		paper.setQuestions(new ArrayList<Question>());
		pd.put("JSON", paper.toJson());
		logger.info(paper.toJson());
		
		mv.setViewName("sunvote/teacher/creat_question");
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list2")
	public ModelAndView list2(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Paper");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = paperService.list(page);	//列出Paper列表
		mv.setViewName("sunvote/paper/paper_list2");
		
		for(PageData p:varList){
			String examTime = p.getString("EXAM_TIME");
			if(examTime != null){
				try{
					int et = Integer.parseInt(examTime);
					String min = (et / 60 ) + "" ;
					if(min.length() < 2){
						min = "0" + min ;
					}
					String sec = (et % 60 ) + "" ;
					if(sec.length() < 2){
						sec = "0" + sec ;
					}
					if(et > 60){
						examTime = min + ":" + sec; 
					}else{
						examTime = "00:" +  sec; 
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			if(examTime == null){
				examTime = "00:00";
			}
			p.put("EXAM_TIME", examTime);
		}
		
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
		mv.setViewName("sunvote/paper/paper_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAddTest")
	public ModelAndView goAddTest()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("sunvote/paper/paper_edit2");
		mv.addObject("msg", "newpaper");
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
		pd = paperService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/paper/paper_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Paper");
//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			paperService.deleteAll(ArrayDATA_IDS);
			paperquestionService.deleteAllPaper(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Paper到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("试卷标题");	//1
		titles.add("出卷老师");	//2
		titles.add("试卷类型");	//3
		titles.add("科目");	//4
		titles.add("年级");	//5
		titles.add("学校");	//6
		titles.add("创建时间");	//7
		titles.add("修改时间");	//8
		titles.add("建议考试时长");	//9
		titles.add("试卷状态");	//10
		titles.add("备注");	//11
		dataMap.put("titles", titles);
		List<PageData> varOList = paperService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("TITLE"));	    //1
			vpd.put("var2", varOList.get(i).getString("USER_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("PAPER_TYPE"));	    //3
			vpd.put("var4", varOList.get(i).getString("SUBJECT_ID"));	    //4
			vpd.put("var5", varOList.get(i).getString("GRADE_ID"));	    //5
			vpd.put("var6", varOList.get(i).getString("SCHOOL_ID"));	    //6
			vpd.put("var7", varOList.get(i).getString("CREATE_DATE"));	    //7
			vpd.put("var8", varOList.get(i).getString("MODIFY_DATE"));	    //8
			vpd.put("var9", varOList.get(i).getString("EXAM_TIME"));	    //9
			vpd.put("var10", varOList.get(i).getString("PAPER_STATE"));	    //10
			vpd.put("var11", varOList.get(i).getString("REMARK"));	    //11
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
