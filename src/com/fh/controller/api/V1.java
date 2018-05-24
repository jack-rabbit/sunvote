package com.fh.controller.api;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.api.V1Manager;
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
import com.fh.util.PageData;
import com.fh.util.Tools;

@Controller
@RequestMapping(value = "/api/v1")
public class V1 extends BaseController {
	
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
	
	@Resource(name="questionService")
	private QuestionManager questionService;
	
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
	
	@Resource(name = "v1Service")
	private V1Manager v1Service ;
	
	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if(!pd.containsKey("ACCOUT")){
			pd.put("ACCOUT", pd.get("USERNAME"));
		}
		if(((pd.containsKey("USERNAME") || pd.containsKey("ACCOUT")) && pd.containsKey("PASSWORD")) || pd.containsKey("KEYPAD_ID")){
			PageData pageData = teacherService.getUserInfo(pd);
			if(pageData != null && pageData.getString("ID") != null){
				pageData.put("PASSWORD", "");//返回参数中不返回密码
				PageData pt = new PageData();
				pt.put("TEACHER_ID", pageData.get("ID"));
				// 在任课表中查找老师教哪些班级，然后查出班级信息
				List<PageData> classInfoList = v1Service.getTeacherClassInfo(pt);
				
				pageData.put("classInfoList", classInfoList);
				// 在认可表中查找老师教哪些科目，然后查出科目信息
				List<PageData> subjectList = v1Service.getTeacherSubjectInfo(pt);
				// 一个sql语句完成。
				pageData.put("subjectList", subjectList);
				
				pageData.remove("SUBJECT_IDS");
				
				res.setData(pageData);
				// 填充数据到返回数据中
			}else{
				res.set1Error();
			}
		}else{
			res.set1Error();
		}
		
		return res.toJson();
	}
	
	@RequestMapping(value = "/class", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object sclass() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if (pd.containsKey("ID")) {
			PageData pageData = sclassService.findById(pd);
			if (pageData != null && pageData.containsKey("ID")) {
				PageData pt = new PageData();
				pt.put("SCLASS_ID", pageData.get("ID"));
				List<PageData> studentList = v1Service
						.getClassStudent(pt);
				pageData.put("studentList", studentList);
				res.setData(pageData);
			} else {
				res.set2Error();
			}
		}else{
			res.set2Error();
		}
		return res.toJson();
	}
		
	@RequestMapping(value = "/keypadscan", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadScan() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		pd.put("KEYPADCHECK_ID", get32UUID());	//主键
		pd.put("CREATE_DATE", Tools.date2Str(new Date()));	//创建时间
		try{
			keypadcheckService.save(pd);
			res.setSuccess();
		}catch(Exception ex){
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value = "/paper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paper() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		if(pd.containsKey("PAPER_TYPE") && pd.containsKey("USER_ID")){
			Page page = new Page();
			page.getPd().put("PAPER_TYPE", pd.get("PAPER_TYPE"));
			page.getPd().put("USER_ID", pd.get("USER_ID"));
			if(pd.containsKey("CURRENTPAGE")){
				String curpage = pd.getString("CURRENTPAGE");
				try{
					page.setCurrentPage(Integer.parseInt(curpage));
				}catch(Exception ex){}
			}
			if(pd.containsKey("SHOWCOUNT")){
				String showCount = pd.getString("SHOWCOUNT");
				try{
					page.setShowCount(Integer.parseInt(showCount));
				}catch(Exception ex){}
			}else{
				page.setShowCount(100);
			}
			List<PageData> pageList = paperService.listAllByType(page);
			res.setData(pageList);
		}
		return res.toJson();
	}
	
	@RequestMapping(value = "/testpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object testpaper() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		if(pd.containsKey("PAPER_ID")){
			try{
				List<PageData> questList = v1Service.getTestPaperInfo(pd);
				res.setData(questList);
			}catch(Exception ex){
				res.setOtherError();
			}
		}else{
			res.setOtherError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value = "/paperquestion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperQuestion() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		
		return res.toJson();
	}

}
