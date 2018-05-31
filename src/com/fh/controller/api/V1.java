package com.fh.controller.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.bean.Paper;
import com.fh.bean.Question;
import com.fh.controller.base.BaseController;
import com.fh.controller.sunvote.Myelfun;
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
		}else{
			res.setParmError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value = "/testpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object testpaper() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<Paper> res = new ResponseGson<Paper>();
		if(pd.containsKey("PAPER_ID")){
			try{
				Paper paper = new Paper();
				PageData ppd = paperService.findById(pd);
				if(ppd != null){
				paper.setTitle(ppd.getString("TITLE"));
				paper.setExam_time(ppd.getString("EXAM_TIME"));
				paper.setTitle(ppd.getString("USER_ID"));
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
					if("-1".equals(qpd.getString("PID"))){
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
					paper.getQuestions().add(question);
				}
				
				
				res.setData(paper);
				}
			}catch(Exception ex){
				ex.printStackTrace();
				res.setError();
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

	
	@RequestMapping(value = "/uploadpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadpaper() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();
		
		if(!StringUtils.isEmpty(pd.getJsonString())){
			Paper paper = Paper.parse(pd.getJsonString());
			PageData paperPd = new PageData();
			String paperID = this.get32UUID();
			res.setData(paperID);
			paperPd.put("PAPER_ID", paperID);	
			paperPd.put("TITLE", paper.getTitle());	
			paperPd.put("USER_ID", paper.getUser_id());	
			paperPd.put("PAPER_TYPE", paper.getPaper_type());	
			paperPd.put("SUBJECT_ID", paper.getSubject_id());	
			paperPd.put("GRADE_ID", paper.getGrade_id());	
			paperPd.put("EXAM_TIME", paper.getExam_time());	
			paperPd.put("SCORE", paper.getScore());	
			paperPd.put("PAPER_STATE", "0");	
			paperPd.put("REMARK", "");	
			String schoolID = Myelfun.getUserID(paper.getUser_id());
			paperPd.put("SCHOOL_ID", schoolID);
			paperPd.put("CREATE_DATE", Tools.date2Str(new Date()));	
			paperPd.put("MODIFY_DATE", Tools.date2Str(new Date()));	
			
			paperService.save(paperPd);
			
			List<Question> questions = paper.getQuestions();
			if(questions != null){
				for(Question question : questions){
					String questionID = this.get32UUID();
					PageData qPd = new PageData();
					qPd.put("QUESTION_ID", questionID);
					if(question.getQuestions() != null && question.getQuestions().size() > 0){
						qPd.put("P_ID", "-1");
					}else{
						qPd.put("P_ID", "0");
					}
					qPd.put("SUBJECT_ID", paper.getSubject_id());
					qPd.put("CHAPTER_ID", question.getChapter_id());
					qPd.put("PROBLEM_TYPE_ID", question.getProblem_type_id());
					qPd.put("TEACHER_ID", paper.getUser_id());
					qPd.put("SCHOOL_ID", schoolID);
					qPd.put("KNOWLEDGE_ID", question.getKnowledge_id());
					qPd.put("CONTENT", question.getContent());
					qPd.put("OPTION_NUM", question.getOption_num());
					qPd.put("OPTION_CONTENT", question.getOption_content());
					qPd.put("ANSWER", question.getAnswer());
					qPd.put("DIFFICULTY", question.getDifficulty());
					qPd.put("ANALYSIS", question.getAnalysis());
					qPd.put("QUESTION_FROM", question.getQuestion_from());
					qPd.put("SUG_SCORE", question.getScore());
					qPd.put("SUG_PART_SCORE", question.getPart_score());
					qPd.put("USER_ID", paper.getUser_id());
					qPd.put("CREATE_DATE", Tools.date2Str(new Date()));
					qPd.put("REMARK", "");
					questionService.save(qPd);
					
					PageData pqPd = new PageData();
					pqPd.put("PAPER_ID",paperID);
					pqPd.put("QUESTION_ID",questionID);
					pqPd.put("SCORE",question.getScore());
					pqPd.put("PART_SCORE","0");
					pqPd.put("RANK",question.getRank());
					pqPd.put("NO_NAME",question.getNo_name());
					pqPd.put("PAPERQUESTION_ID",this.get32UUID());
					paperquestionService.save(pqPd);
					
					
					if(question.getQuestions() != null){
						List<Question> qs = question.getQuestions();
						for(Question q : qs){
							String qID = this.get32UUID();
							PageData cqPd = new PageData();
							cqPd.put("QUESTION_ID", qID);
							cqPd.put("P_ID", questionID);
							cqPd.put("SUBJECT_ID", paper.getSubject_id());
							cqPd.put("CHAPTER_ID", q.getChapter_id());
							cqPd.put("PROBLEM_TYPE_ID", q.getProblem_type_id());
							cqPd.put("TEACHER_ID", paper.getUser_id());
							cqPd.put("SCHOOL_ID", schoolID);
							cqPd.put("KNOWLEDGE_ID", q.getKnowledge_id());
							cqPd.put("CONTENT", q.getContent());
							cqPd.put("OPTION_NUM", q.getOption_num());
							cqPd.put("OPTION_CONTENT", q.getOption_content());
							cqPd.put("ANSWER", q.getAnswer());
							cqPd.put("DIFFICULTY", q.getDifficulty());
							cqPd.put("ANALYSIS", q.getAnalysis());
							cqPd.put("QUESTION_FROM", q.getQuestion_from());
							cqPd.put("SUG_SCORE", q.getScore());
							cqPd.put("SUG_PART_SCORE", q.getSug_part_score());
							cqPd.put("USER_ID", paper.getUser_id());
							cqPd.put("CREATE_DATE", Tools.date2Str(new Date()));
							cqPd.put("REMARK", "");
							
							questionService.save(cqPd);
							
							PageData cpqPd = new PageData();
							cpqPd.put("PAPER_ID",paperID);
							cpqPd.put("QUESTION_ID",qID);
							cpqPd.put("SCORE",q.getScore());
							cpqPd.put("PART_SCORE","0");
							cpqPd.put("RANK",q.getRank());
							cpqPd.put("NO_NAME",q.getNo_name());
							cpqPd.put("PAPERQUESTION_ID",this.get32UUID());
							
							paperquestionService.save(cpqPd);
						}
					}
				}
			}
			
		}else{
			res.setDataError();
		}
		
		return res.toJson();
	}

}
