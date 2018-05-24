package com.fh.controller.sunvote.question;

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
import com.fh.service.feedback.problemphenomenon.ProblemPhenomenonManager;
import com.fh.service.sunvote.basestation.BasestationManager;
import com.fh.service.sunvote.chapter.ChapterManager;
import com.fh.service.sunvote.classbasetation.ClassBasetationManager;
import com.fh.service.sunvote.classroster.ClassRosterManager;
import com.fh.service.sunvote.classtype.ClassTypeManager;
import com.fh.service.sunvote.coursemanagement.CourseManagementManager;
import com.fh.service.sunvote.grade.GradeManager;
import com.fh.service.sunvote.keypad.KeypadManager;
import com.fh.service.sunvote.keypadcheck.KeypadCheckManager;
import com.fh.service.sunvote.knowledge.KnowledgeManager;
import com.fh.service.sunvote.knowledgechapter.KnowledgeChapterManager;
import com.fh.service.sunvote.paper.PaperManager;
import com.fh.service.sunvote.paperclassteacher.PaperClassTeacherManager;
import com.fh.service.sunvote.paperquestion.PaperQuestionManager;
import com.fh.service.sunvote.papertype.PaperTypeManager;
import com.fh.service.sunvote.question.QuestionManager;
import com.fh.service.sunvote.questiontype.QuestionTypeManager;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.service.sunvote.schoolgradesubject.SchoolGradeSubjectManager;
import com.fh.service.sunvote.sclass.SClassManager;
import com.fh.service.sunvote.student.StudentManager;
import com.fh.service.sunvote.subject.SubjectManager;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.sunvote.testpaperinfo.TestPaperInfoManager;

/** 
 * 说明：题目表
 * 创建时间：2018-05-16
 */
@Controller
@RequestMapping(value="/question")
public class QuestionController extends BaseController {
	
	
	
	String menuUrl = "question/list.do"; //菜单地址(权限用)
	@Resource(name="questionService")
	private QuestionManager questionService;
	
	@Resource(name = "schoolService")
	private SchoolManager schoolService;

	@Resource(name = "basestationService")
	private BasestationManager basestationService;
	
	@Resource(name="chapterService")
	private ChapterManager chapterService;
	
	@Resource(name="classbasetationService")
	private ClassBasetationManager classbasetationService;
	
	@Resource(name="classrosterService")
	private ClassRosterManager classrosterService;
	
	@Resource(name="classtypeService")
	private ClassTypeManager classtypeService;
	
	@Resource(name="gradeService")
	private GradeManager gradeService;
	
	@Resource(name="coursemanagementService")
	private CourseManagementManager coursemanagementService;

	@Resource(name = "keypadService")
	private KeypadManager keypadService;
	
	@Resource(name="keypadcheckService")
	private KeypadCheckManager keypadcheckService;
	
	@Resource(name="knowledgeService")
	private KnowledgeManager knowledgeService;
	
	@Resource(name="knowledgechapterService")
	private KnowledgeChapterManager knowledgechapterService;
	
	@Resource(name="paperService")
	private PaperManager paperService;
	
	@Resource(name="paperclassteacherService")
	private PaperClassTeacherManager paperclassteacherService;
	
	@Resource(name="paperquestionService")
	private PaperQuestionManager paperquestionService;
	
	@Resource(name="papertypeService")
	private PaperTypeManager papertypeService;
	
	@Resource(name="questiontypeService")
	private QuestionTypeManager questiontypeService;
	
	@Resource(name="schoolgradesubjectService")
	private SchoolGradeSubjectManager schoolgradesubjectService;
	
	@Resource(name="sclassService")
	private SClassManager sclassService;
	
	@Resource(name="studentService")
	private StudentManager studentService;
	
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	
	@Resource(name="teacherService")
	private TeacherManager teacherService;
	
	@Resource(name="testpaperinfoService")
	private TestPaperInfoManager testpaperinfoService;

	@Resource(name = "feedbackService")
	private FeedbackManager feedbackService;

	@Resource(name = "problemphenomenonService")
	private ProblemPhenomenonManager problemphenomenonService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Question");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("QUESTION_ID", this.get32UUID());	//主键
		questionService.save(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"删除Question");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		questionService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Question");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		questionService.edit(pd);
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
		logBefore(logger, Jurisdiction.getUsername()+"列表Question");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = questionService.list(page);	//列出Question列表
		mv.setViewName("sunvote/question/question_list");
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
		mv.setViewName("sunvote/question/question_edit");
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
		pd = questionService.findById(pd);	//根据ID读取
		mv.setViewName("sunvote/question/question_edit");
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
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Question");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			questionService.deleteAll(ArrayDATA_IDS);
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
		logBefore(logger, Jurisdiction.getUsername()+"导出Question到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("父ID");	//1
		titles.add("所属科目");	//2
		titles.add("所属章节");	//3
		titles.add("题目类型");	//4
		titles.add("出题老师");	//5
		titles.add("所属学校");	//6
		titles.add("知识点");	//7
		titles.add("题目内容");	//8
		titles.add("选项个数");	//9
		titles.add("选项内容");	//10
		titles.add("标准答案");	//11
		titles.add("难度系数");	//12
		titles.add("题目解析");	//13
		titles.add("题目来源");	//14
		titles.add("建议试题总分");	//15
		titles.add("建议部分分");	//16
		titles.add("用户ID");	//17
		titles.add("创建时间");	//18
		titles.add("备注");	//19
		dataMap.put("titles", titles);
		List<PageData> varOList = questionService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("P_ID"));	    //1
			vpd.put("var2", varOList.get(i).getString("SUBJECT_ID"));	    //2
			vpd.put("var3", varOList.get(i).getString("CHAPTER_ID"));	    //3
			vpd.put("var4", varOList.get(i).getString("PROBLEM_TYPE_ID"));	    //4
			vpd.put("var5", varOList.get(i).getString("TEACHER_ID"));	    //5
			vpd.put("var6", varOList.get(i).getString("SCHOOL_ID"));	    //6
			vpd.put("var7", varOList.get(i).getString("KNOWLEDGE_ID"));	    //7
			vpd.put("var8", varOList.get(i).getString("CONTENT"));	    //8
			vpd.put("var9", varOList.get(i).get("OPTION_NUM").toString());	//9
			vpd.put("var10", varOList.get(i).getString("OPTION_CONTENT"));	    //10
			vpd.put("var11", varOList.get(i).getString("ANSWER"));	    //11
			vpd.put("var12", varOList.get(i).getString("DIFFICULTY"));	    //12
			vpd.put("var13", varOList.get(i).getString("ANALYSIS"));	    //13
			vpd.put("var14", varOList.get(i).getString("QUESTION_FROM"));	    //14
			vpd.put("var15", varOList.get(i).getString("SUG_SCORE"));	    //15
			vpd.put("var16", varOList.get(i).getString("SUG_PART_SCORE"));	    //16
			vpd.put("var17", varOList.get(i).getString("USER_ID"));	    //17
			vpd.put("var18", varOList.get(i).getString("CREATE_DATE"));	    //18
			vpd.put("var19", varOList.get(i).getString("REMARK"));	    //19
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
