package com.fh.controller.api;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
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


@Controller
@RequestMapping(value = "/api/v")
public class V extends BaseController {
	
	@Resource(name = "schoolService")
	private SchoolManager schoolService;
	
	@RequestMapping(value = "/school/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolList() throws Exception {
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			PageData ret = schoolService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			
			return res.toJson();
		} else {
			List<PageData> ret = schoolService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
	}
	@RequestMapping(value = "/school/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolAdd() throws Exception {
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			PageData ret = schoolService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		} else {
			List<PageData> ret = schoolService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
	}

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
	

}
