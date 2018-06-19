package com.fh.controller.api;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.bean.Paper;
import com.fh.bean.Question;
import com.fh.bean.StudentAnswer;
import com.fh.bean.TestPaper;
import com.fh.bean.TestPaperInfo;
import com.fh.controller.base.BaseController;
import com.fh.controller.sunvote.Myelfun;
import com.fh.entity.Page;
import com.fh.service.api.V1Manager;
import com.fh.service.feedback.feedback.FeedbackManager;
import com.fh.service.feedback.problemphenomenon.ProblemPhenomenonManager;
import com.fh.service.software.softwareversion.SoftwareVersionManager;
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
import com.fh.service.sunvote.studenttest.StudentTestManager;
import com.fh.service.sunvote.subject.SubjectManager;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.sunvote.testpaper.TestPaperManager;
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

	@Resource(name = "chapterService")
	private ChapterManager chapterService;

	@Resource(name = "classbasetationService")
	private ClassBasetationManager classbasetationService;

	@Resource(name = "classrosterService")
	private ClassRosterManager classrosterService;

	@Resource(name = "classtypeService")
	private ClassTypeManager classtypeService;

	@Resource(name = "gradeService")
	private GradeManager gradeService;

	@Resource(name = "coursemanagementService")
	private CourseManagementManager coursemanagementService;

	@Resource(name = "keypadService")
	private KeypadManager keypadService;

	@Resource(name = "keypadcheckService")
	private KeypadCheckManager keypadcheckService;

	@Resource(name = "knowledgeService")
	private KnowledgeManager knowledgeService;

	@Resource(name = "knowledgechapterService")
	private KnowledgeChapterManager knowledgechapterService;

	@Resource(name = "paperService")
	private PaperManager paperService;

	@Resource(name = "paperclassteacherService")
	private PaperClassTeacherManager paperclassteacherService;

	@Resource(name = "paperquestionService")
	private PaperQuestionManager paperquestionService;

	@Resource(name = "papertypeService")
	private PaperTypeManager papertypeService;

	@Resource(name = "questionService")
	private QuestionManager questionService;

	@Resource(name = "questiontypeService")
	private QuestionTypeManager questiontypeService;

	@Resource(name = "schoolgradesubjectService")
	private SchoolGradeSubjectManager schoolgradesubjectService;

	@Resource(name = "sclassService")
	private SClassManager sclassService;

	@Resource(name = "studentService")
	private StudentManager studentService;

	@Resource(name = "subjectService")
	private SubjectManager subjectService;

	@Resource(name = "teacherService")
	private TeacherManager teacherService;

	@Resource(name = "testpaperinfoService")
	private TestPaperInfoManager testpaperinfoService;

	@Resource(name = "testpaperService")
	private TestPaperManager testpaperService;

	@Resource(name = "studenttestService")
	private StudentTestManager studenttestService;

	@Resource(name = "feedbackService")
	private FeedbackManager feedbackService;

	@Resource(name = "problemphenomenonService")
	private ProblemPhenomenonManager problemphenomenonService;

	@Resource(name = "v1Service")
	private V1Manager v1Service;
	
	@Resource(name="softwareversionService")
	private SoftwareVersionManager softwareversionService;

	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if (!pd.containsKey("ACCOUT")) {
			pd.put("ACCOUT", pd.get("USERNAME"));
		}
		if (((pd.containsKey("USERNAME") || pd.containsKey("ACCOUT")) && pd
				.containsKey("PASSWORD")) || pd.containsKey("KEYPAD_ID")) {
			PageData pageData = teacherService.getUserInfo(pd);
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

				res.setData(pageData);
				// 填充数据到返回数据中
			} else {
				res.set1Error();
			}
		} else {
			res.set1Error();
		}

		return res.toJson();
	}

	@RequestMapping(value = "/class", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object sclass() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		if (pd.containsKey("ID")) {
			ResponseGson<PageData> res = new ResponseGson();
			PageData pageData = sclassService.findById(pd);
			if (pageData != null && pageData.containsKey("ID")) {
				PageData pt = new PageData();
				pt.put("SCLASS_ID", pageData.get("ID"));
				List<PageData> studentList = v1Service.getClassStudent(pt);
				pageData.put("studentList", studentList);
				res.setData(pageData);
			} else {
				res.set2Error();
			}
			logger.info("class cost time : " + (System.currentTimeMillis() - cur));
			return res.toJson();
		} else {
			ResponseGson<List<PageData>> res = new ResponseGson();
			List<PageData> list = sclassService.listAll(pd);
			res.setData(list);
			logger.info("class cost time : " + (System.currentTimeMillis() - cur));
			return res.toJson();
		}
	}
	
	@RequestMapping(value = "/questiontype", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questiontype() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = questiontypeService.listAll(pd);
		res.setData(list);
		logger.info("questiontype cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/classtype", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object classtype() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = classtypeService.listAll(pd);
		res.setData(list);
		logger.info("classtype cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/grade", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object grade() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		if (!pd.containsKey("SCHOOL_ID")) {
			List<PageData> list = gradeService.listAll(pd);
			res.setData(list);
		} else {
			List<PageData> list = schoolgradesubjectService.listAllGrade(pd);
			res.setData(list);
		}
		logger.info("class cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/subject", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object subject() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		if (!pd.containsKey("SCHOOL_ID")) {
			List<PageData> list = subjectService.listAll(pd);
			res.setData(list);
		} else {
			List<PageData> list = schoolgradesubjectService.listAllSubject(pd);
			res.setData(list);
		}
		logger.info("subject cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	

	@RequestMapping(value = "/keypadscan", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadScan() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();
		String ID = get32UUID();
		pd.put("KEYPADCHECK_ID", ID); // 主键
		pd.put("CREATE_DATE", Tools.date2Str(new Date())); // 创建时间
		try {
			keypadcheckService.save(pd);
			res.setData(ID);
			res.setSuccess();
		} catch (Exception ex) {
			res.setDataError();
		}
		logger.info("keypadScan cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	@RequestMapping(value = "/paper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paper() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		if (pd.containsKey("PAPER_TYPE") && pd.containsKey("USER_ID")) {
			Page page = new Page();
			page.getPd().put("PAPER_TYPE", pd.get("PAPER_TYPE"));
			page.getPd().put("USER_ID", pd.get("USER_ID"));
			if (pd.containsKey("CURRENTPAGE")) {
				String curpage = pd.getString("CURRENTPAGE");
				try {
					page.setCurrentPage(Integer.parseInt(curpage));
				} catch (Exception ex) {
				}
			}
			if (pd.containsKey("SHOWCOUNT")) {
				String showCount = pd.getString("SHOWCOUNT");
				try {
					page.setShowCount(Integer.parseInt(showCount));
				} catch (Exception ex) {
				}
			} else {
				page.setShowCount(100);
			}
			List<PageData> pageList = paperService.listAllByType(page);
			res.setData(pageList);
		} else {
			res.setParmError();
		}
		logger.info("paper cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	@RequestMapping(value = "/paperinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperInfo() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<Paper> res = new ResponseGson<Paper>();
		if (pd.containsKey("PAPER_ID")) {
			try {
				try {
					Paper paper = new Paper();
					PageData ppd = paperService.findById(pd);
					if (ppd != null) {
						paper.setTitle(ppd.getString("TITLE"));
						paper.setExam_time(ppd.getString("EXAM_TIME"));
						paper.setUser_id(ppd.getString("USER_ID"));
						paper.setPaper_type(ppd.getString("PAPER_TYPE"));
						paper.setSubject_id(ppd.getString("SUBJECT_ID"));
						paper.setGrade_id(ppd.getString("GRADE_ID"));
						paper.setScore(ppd.getString("SCORE"));
						paper.setQuestions(new ArrayList<Question>());

						List<PageData> questList = v1Service
								.getTestPaperInfo(pd);
						for (PageData qpd : questList) {
							Question question = new Question();
							question.setAnswer(qpd.getString("ANSWER"));
							question.setQuestion_id(qpd
									.getString("QUESTION_ID"));
							question.setSubject_id(qpd.getString("SUBJECT_ID"));
							question.setChapter_id(qpd.getString("CHAPTER_ID"));
							question.setProblem_type_id(qpd
									.getString("PROBLEM_TYPE_ID"));
							question.setKnowledge_id(qpd
									.getString("KNOWLEDGE_ID"));
							question.setContent(qpd.getString("CONTENT"));
							question.setOption_num(qpd.getString("OPTION_NUM"));
							question.setOption_content(qpd
									.getString("OPTION_CONTENT"));
							question.setDifficulty(qpd.getString("DIFFICULTY"));
							question.setAnalysis(qpd.getString("ANALYSIS"));
							question.setQuestion_from(qpd
									.getString("QUESTION_FROM"));
							question.setScore(qpd.getString("SCORE"));
							question.setPart_score(qpd
									.getString("PART_SCORE"));
							question.setQuestionType(qpd.getString("PROBLEM_TYPE_ID"));
							question.setRank(qpd.getString("RANK"));
							question.setNo_name(qpd.getString("NO_NAME"));
							if ("-1".equals("" + qpd.getString("P_ID"))) {
								PageData pidPd = new PageData();
								pidPd.put("PID", question.getQuestion_id());
								question.setQuestions(new ArrayList<Question>());
								List<PageData> qs = v1Service
										.getQuestionsByPID(pidPd);
								for (PageData q : qs) {
									Question qq = new Question();
									qq.setAnswer(q.getString("ANSWER"));
									qq.setQuestion_id(q
											.getString("QUESTION_ID"));
									qq.setSubject_id(q.getString("SUBJECT_ID"));
									qq.setChapter_id(q.getString("CHAPTER_ID"));
									qq.setProblem_type_id(q
											.getString("PROBLEM_TYPE_ID"));
									qq.setKnowledge_id(q
											.getString("KNOWLEDGE_ID"));
									qq.setContent(q.getString("CONTENT"));
									qq.setOption_num(q.getString("OPTION_NUM"));
									qq.setOption_content(q
											.getString("OPTION_CONTENT"));
									qq.setDifficulty(q.getString("DIFFICULTY"));
									qq.setAnalysis(q.getString("ANALYSIS"));
									qq.setQuestion_from(q
											.getString("QUESTION_FROM"));
									qq.setScore(q.getString("SCORE"));
									qq.setPart_score(q
											.getString("PART_SCORE"));
									qq.setQuestionType(qpd.getString("PROBLEM_TYPE_ID"));
									qq.setRank(q.getString("RANK"));
									qq.setNo_name(q.getString("NO_NAME"));
									question.getQuestions().add(qq);
								}
							}
							if ("-1".equals(qpd.getString("P_ID"))
									|| "0".equals(qpd.getString("P_ID"))) {
								paper.getQuestions().add(question);
							}
						}
						// pd.put("JSON", paper.toJson());
						res.setData(paper);
						logger.info(paper.toJson());

					}
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			} catch (Exception ex) {
				ex.printStackTrace();
				res.setError();
			}
		} else {
			res.setOtherError();
		}
		logger.info("paperInfo cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	@RequestMapping(value = "/paperquestion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperQuestion() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		logger.info("paperquestion cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/question", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object question() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if(pd.containsKey("ID")){
			pd.put("QUESTION_ID", pd.get("ID"));
			PageData data = questionService.findById(pd);
			res.setData(data);
		}else{
			res.setDataError();
		}
		logger.info("question cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/question/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questionAdd() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		pd.put("QUESTION_ID", this.get32UUID());
		questionService.save(pd);
		logger.info("questionAdd cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	@RequestMapping(value = "/uploadpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadpaper() throws Exception {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();

		if (!StringUtils.isEmpty(pd.getJsonString())) {
			logger.info(pd.getJsonString());
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

			int questionNum = 0 ;
			

			List<Question> questions = paper.getQuestions();
			if (questions != null) {
				for (Question question : questions) {
					String questionID = this.get32UUID();
					PageData qPd = new PageData();
					qPd.put("QUESTION_ID", questionID);
					if (question.getQuestions() != null
							&& question.getQuestions().size() > 0) {
						qPd.put("P_ID", "-1");
					} else {
						questionNum ++ ;
						qPd.put("P_ID", "0");
					}
					qPd.put("SUBJECT_ID", paper.getSubject_id());
					qPd.put("CHAPTER_ID", question.getChapter_id());
					qPd.put("PROBLEM_TYPE_ID", question.getProblem_type_id() == null ? "1" :  question.getProblem_type_id());
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
					pqPd.put("PAPER_ID", paperID);
					pqPd.put("QUESTION_ID", questionID);
					pqPd.put("SCORE", question.getScore());
					pqPd.put("PART_SCORE", "0");
					pqPd.put("RANK", question.getRank());
					pqPd.put("NO_NAME", question.getNo_name());
					pqPd.put("PAPERQUESTION_ID", this.get32UUID());
					paperquestionService.save(pqPd);

					if (question.getQuestions() != null) {
						List<Question> qs = question.getQuestions();
						for (Question q : qs) {
							String qID = this.get32UUID();
							PageData cqPd = new PageData();
							cqPd.put("QUESTION_ID", qID);
							cqPd.put("P_ID", questionID);
							cqPd.put("SUBJECT_ID", paper.getSubject_id());
							cqPd.put("CHAPTER_ID", q.getChapter_id());
							cqPd.put("PROBLEM_TYPE_ID", question.getProblem_type_id() == null ? "1" :  question.getProblem_type_id());
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
							cpqPd.put("PAPER_ID", paperID);
							cpqPd.put("QUESTION_ID", qID);
							cpqPd.put("SCORE", q.getScore());
							cpqPd.put("PART_SCORE", "0");
							cpqPd.put("RANK", q.getRank());
							cpqPd.put("NO_NAME", q.getNo_name());
							cpqPd.put("PAPERQUESTION_ID", this.get32UUID());

							paperquestionService.save(cpqPd);
							questionNum ++ ;
						}
					}
				}
			}
			paperPd.put("QUESTION_NUM", "" + questionNum);
			paperService.save(paperPd);

		} else {
			res.setDataError();
		}
		logger.info("uploadpaper cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	// 上传测验成绩
	@RequestMapping(value = "/uploadtestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadTestpaper() {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();
		if (!StringUtils.isEmpty(pd.getJsonString())) {
			logger.info(pd.getJsonString());
			TestPaper testPaper = TestPaper.parse(pd.getJsonString());
			try {
				PageData testPd = new PageData();
				String testPaperId = this.get32UUID();
				testPd.put("TEACHER_ID", testPaper.getTeacherId());
				testPd.put("PAPER_ID", testPaper.getPaperId());
				testPd.put("SCLASS_ID", testPaper.getClassId());
				testPd.put(
						"CREATE_DATE",
						testPaper.getCreateDate() == null ? Tools
								.date2Str(new Date()) : testPaper
								.getCreateDate());
				List<PageData> listData = testpaperService.listAll(testPd);
				if (!(listData != null && listData.size() > 0)) {
					testPd.put("START_DATE", testPaper.getStartDate());
					testPd.put("END_DATE", testPaper.getEndDate());
					testPd.put("NAME", testPaper.getName());
					testPd.put("TESTPAPER_ID", testPaperId);
					testPd.put("OTHER_SCORE", testPaper.getOtherScore());
					testPd.put("HIGHT_SCORE", testPaper.getHighScore());
					testPd.put("LOW_SCORE", testPaper.getLowScore());
					testPd.put("AVG_SCORE", testPaper.getAvgScore());
					testPd.put("REMARK", testPaper.getRemark());
					testpaperService.save(testPd);
					if (testPaper.getStudents() != null) {
						List<PageData> testInfoPdList = new ArrayList();
						PageData testInfoPd = null;
						for (StudentAnswer studentAnswer : testPaper
								.getStudents()) {
							if (studentAnswer.getQuestions() != null) {
								PageData studentPageData = new PageData();
								studentPageData.put("STUDENTTEST_ID",
										get32UUID());
								studentPageData.put("STUDENT_ID",
										studentAnswer.getStudentId());
								studentPageData.put("TEST_ID", testPaperId);
								studentPageData.put("PAPER_ID",
										testPaper.getPaperId());
								studentPageData.put("SCORE",
										studentAnswer.getScore());
								studentPageData.put("CLASS_ID",
										testPaper.getClassId());
								studenttestService.save(studentPageData);

								for (TestPaperInfo testPaperInfo : studentAnswer
										.getQuestions()) {
									testInfoPd = new PageData();
									testInfoPd.put("TESTPAPERINFO_ID",
											this.get32UUID());
									testInfoPd.put("PAPER_ID",
											testPaper.getPaperId());
									testInfoPd.put("STUDENT_ID",
											studentAnswer.getStudentId());
									testInfoPd.put("TEST_ID", testPaperId);
									testInfoPd.put("QUESTION_ID",
											testPaperInfo.getQuestionId());
									testInfoPd.put("ANSWER",
											testPaperInfo.getAnswer());
									testInfoPd.put("RIGHT",
											testPaperInfo.getRight());
									testInfoPd.put("SCORE",
											testPaperInfo.getScore());
									testInfoPd.put("LIKES",
											testPaperInfo.getLikes());
									testInfoPd
											.put("ANSWER_TYPE",
													testPaperInfo
															.getAnswerType() == null ? "1"
															: testPaperInfo
																	.getAnswerType());
									testInfoPd.put("PRESS_TIME",
											testPaperInfo.getPressTime());
									testInfoPd.put("RECEIVER_DATE",
											testPaperInfo.getReceiverDate());
									testInfoPd.put("SUBJECTIVE",
											testPaperInfo.getSubjective());
									testInfoPd.put("NOTE",
											testPaperInfo.getNote());
									testInfoPd.put("MARK_NO",
											testPaperInfo.getMarkNo());
									testInfoPdList.add(testInfoPd);
								}
							}
						}
						testpaperinfoService.batchSave(testInfoPdList);
					}
				}else{
					testPaperId = listData.get(0).getString("TESTPAPER_ID");
				}
				res.setData(testPaperId);
			} catch (Exception e) {
				e.printStackTrace();
				res.setError();
				res.setMessage(e.getMessage());
			}
		} else {
			res.setDataError();
		}
		logger.info("uploadtestpaper cost time:" + (System.currentTimeMillis() - cur));

		return res.toJson();

	}
	
	
	// 上传测验成绩
	@RequestMapping(value = "/uploadupdatetestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadupdateTestpaper() {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();
		if (!StringUtils.isEmpty(pd.getJsonString())) {
			logger.info(pd.getJsonString());
			TestPaper testPaper = TestPaper.parse(pd.getJsonString());
			try {
				PageData testPd = new PageData();
				String testPaperId = this.get32UUID();
				testPd.put("TEACHER_ID", testPaper.getTeacherId());
				testPd.put("PAPER_ID", testPaper.getPaperId());
				testPd.put("SCLASS_ID", testPaper.getClassId());
				testPd.put(
						"CREATE_DATE",
						testPaper.getCreateDate() == null ? Tools
								.date2Str(new Date()) : testPaper
								.getCreateDate());
				List<PageData> listData = testpaperService.listAll(testPd);
				if ((listData != null && listData.size() > 0)) {
					testPaperId = listData.get(0).getString("TESTPAPER_ID");
					testpaperService.deleteList(testPd);
					testPd.put("TEST_ID", testPaperId);
					testpaperinfoService.delete(testPd);
					studenttestService.delete(testPd);
				}
				testPd.put("START_DATE", testPaper.getStartDate());
				testPd.put("END_DATE", testPaper.getEndDate());
				testPd.put("NAME", testPaper.getName());
				testPd.put("TESTPAPER_ID", testPaperId);
				testPd.put("OTHER_SCORE", testPaper.getOtherScore());
				testPd.put("HIGHT_SCORE", testPaper.getHighScore());
				testPd.put("LOW_SCORE", testPaper.getLowScore());
				testPd.put("AVG_SCORE", testPaper.getAvgScore());
				testPd.put("REMARK", testPaper.getRemark());
				testpaperService.save(testPd);
				if (testPaper.getStudents() != null) {
					List<PageData> testInfoPdList = new ArrayList();
					PageData testInfoPd = null;
					for (StudentAnswer studentAnswer : testPaper.getStudents()) {
						if (studentAnswer.getQuestions() != null) {
							PageData studentPageData = new PageData();
							studentPageData.put("STUDENT_ID",
									studentAnswer.getStudentId());
							studentPageData.put("TEST_ID", testPaperId);
							studentPageData.put("PAPER_ID",
									testPaper.getPaperId());
							studentPageData.put("SCORE",
									studentAnswer.getScore());
							studentPageData.put("CLASS_ID",
									testPaper.getClassId());
							studentPageData.put("STUDENTTEST_ID", get32UUID());
							studenttestService.save(studentPageData);

							for (TestPaperInfo testPaperInfo : studentAnswer
									.getQuestions()) {
								testInfoPd = new PageData();
								testInfoPd.put("TESTPAPERINFO_ID",
										this.get32UUID());
								testInfoPd.put("PAPER_ID",
										testPaper.getPaperId());
								testInfoPd.put("STUDENT_ID",
										studentAnswer.getStudentId());
								testInfoPd.put("TEST_ID", testPaperId);
								testInfoPd.put("QUESTION_ID",
										testPaperInfo.getQuestionId());
								testInfoPd.put("ANSWER",
										testPaperInfo.getAnswer());
								testInfoPd.put("RIGHT",
										testPaperInfo.getRight());
								testInfoPd.put("SCORE",
										testPaperInfo.getScore());
								testInfoPd.put("LIKES",
										testPaperInfo.getLikes());
								testInfoPd.put("ANSWER_TYPE", testPaperInfo
										.getAnswerType() == null ? "1"
										: testPaperInfo.getAnswerType());
								testInfoPd.put("PRESS_TIME",
										testPaperInfo.getPressTime());
								testInfoPd.put("RECEIVER_DATE",
										testPaperInfo.getReceiverDate());
								testInfoPd.put("SUBJECTIVE",
										testPaperInfo.getSubjective());
								testInfoPd.put("NOTE", testPaperInfo.getNote());
								testInfoPd.put("MARK_NO",
										testPaperInfo.getMarkNo());
								testInfoPdList.add(testInfoPd);
							}
						}
					}
					testpaperinfoService.batchSave(testInfoPdList);
				}
				res.setData(testPaperId);
			} catch (Exception e) {
				e.printStackTrace();
				res.setError();
				res.setMessage(e.getMessage());
			}
		} else {
			res.setDataError();
		}
		logger.info("uploadtestpaper cost time:"
				+ (System.currentTimeMillis() - cur));

		return res.toJson();

	}

	// 下载测验成绩
	@RequestMapping(value = "/downloadtestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object downloadTestpaper() {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<TestPaper> res = new ResponseGson();

		String paperId = pd.getString("ID");

		if (!StringUtils.isEmpty(paperId)) {
			TestPaper testPaper = new TestPaper();
			try {
				pd.put("TESTPAPER_ID", paperId);
				PageData testPd = testpaperService.findById(pd);
				if (testPd != null) {
					testPaper.setTestpaperId(paperId);
					testPaper.setTeacherId(testPd.getString("TEACHER_ID"));
					testPaper.setName(testPd.getString("NAME"));
					testPaper.setPaperId(testPd.getString("PAPER_ID"));
					testPaper.setClassId(testPd.getString("SCLASS_ID"));
					testPaper.setStartDate(testPd.getString("START_DATE"));
					testPaper.setEndDate(testPd.getString("END_DATE"));
					testPaper.setCreateDate(testPd.getString("CREATE_DATE"));
					testPaper.setOtherScore(testPd.getString("OTHER_SCORE"));
					testPaper.setHighScore(testPd.getString("HIGHT_SCORE"));
					testPaper.setLowScore(testPd.getString("LOW_SCORE"));
					testPaper.setAvgScore(testPd.getString("AVG_SCORE"));
					testPaper.setRemark(testPd.getString("REMARK"));
					PageData testInfof = new PageData();
					testInfof.put("TEST_ID", paperId);

					List<PageData> studentList = studenttestService
							.listAll(testInfof);

					for (PageData sPageData : studentList) {
						StudentAnswer studentAnswer = new StudentAnswer();
						testInfof.put("STDUENT_ID",
								sPageData.getString("STDUENT_ID"));
						studentAnswer.setScore(sPageData.getString("SCORE"));
						List<PageData> list = testpaperinfoService
								.listAll(testInfof);
						for (PageData testInfoPd : list) {
							TestPaperInfo testPaperInfo = new TestPaperInfo();
							testPaperInfo.setTestPaperInfoId(testInfoPd
									.getString("TESTPAPERINFO_ID"));
							testPaperInfo.setQuestionId(testInfoPd
									.getString("QUESTION_ID"));
							testPaperInfo.setAnswer(testInfoPd
									.getString("ANSWER"));
							testPaperInfo.setRight(testInfoPd
									.getString("RIGHT"));
							testPaperInfo.setScore(testInfoPd
									.getString("SCORE"));
							testPaperInfo.setLikes(testInfoPd
									.getString("LIKES"));
							testPaperInfo.setAnswerType(testInfoPd
									.getString("ANSWER_TYPE"));
							testPaperInfo.setPressTime(testInfoPd
									.getString("PRESS_TIME"));
							testPaperInfo.setReceiverDate(testInfoPd
									.getString("RECEIVER_DATE"));
							testPaperInfo.setSubjective(testInfoPd
									.getString("SUBJECTIVE"));
							testPaperInfo.setNote(testInfoPd.getString("NOTE"));
							testPaperInfo.setMarkNo(testInfoPd
									.getString("MARK_NO"));
							testPaperInfo.setRank(testInfoPd.getString("RANK"));
							studentAnswer.getQuestions().add(testPaperInfo);
						}
						testPaper.getStudents().add(studentAnswer);
					}
				}

				res.setData(testPaper);
			} catch (Exception e) {
				e.printStackTrace();
				res.setError();
			}
		}
		logger.info("downloadtestpaper cost time:" + (System.currentTimeMillis() - cur));
		return res.toJson();

	}

	// 下载测验成绩
	@RequestMapping(value = "/testpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object testpaper() {
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<TestPaper>> res = new ResponseGson();
		pd.put("TEACHER_ID", pd.getString("USER_ID"));
		try {
			List<PageData> pageList = testpaperService.listAll(pd);
			List<TestPaper> list = new ArrayList<TestPaper>();
			if (pageList != null) {
				for (PageData testPd : pageList) {
					TestPaper testPaper = new TestPaper();
					testPaper.setTestpaperId(testPd.getString("TESTPAPER_ID"));
					testPaper.setTeacherId(testPd.getString("TEACHER_ID"));
					testPaper.setName(testPd.getString("NAME"));
					testPaper.setPaperId(testPd.getString("PAPER_ID"));
					testPaper.setClassId(testPd.getString("SCLASS_ID"));
					testPaper.setStartDate(testPd.getString("START_DATE"));
					testPaper.setEndDate(testPd.getString("END_DATE"));
					testPaper.setCreateDate(testPd.getString("CREATE_DATE"));
					testPaper.setOtherScore(testPd.getString("OTHER_SCORE"));
					testPaper.setHighScore(testPd.getString("HIGHT_SCORE"));
					testPaper.setLowScore(testPd.getString("LOW_SCORE"));
					testPaper.setAvgScore(testPd.getString("AVG_SCORE"));
					testPaper.setRemark(testPd.getString("REMARK"));
					list.add(testPaper);
				}
			}
			res.setData(list);
		} catch (Exception e) {
			res.setError();
			res.setMessage(e.getMessage());
			e.printStackTrace();
		}
		logger.info("testpaper cost time:" + (System.currentTimeMillis() - cur));
		return res.toJson();

	}
	
	
	@RequestMapping(value = "/schooladmin", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void schoolAdmin(){
		PageData pd = this.getPageData();
		this.getUserID();
	}
	
	@RequestMapping(value = "/newversion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getNewVersion(HttpServletRequest request) throws Exception{
		PageData pd = this.getPageData();
		String softId = pd.getString("SOFTID");
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		ResponseGson<PageData> res = new ResponseGson();
		if(softId != null && !"".equals(softId)){
			pd.put("SOFTWARE_ID", softId);
			PageData result = softwareversionService.findNewVersion(pd);
			if(result != null){
				result.remove("SOFTWAREVERSION_ID");
				result.remove("SOFTWARE_ID");
				result.put("VERSION_PATH",basePath + "uploadFiles/uploadFile/" + result.getString("VERSION_PATH"));
				res.setData(result);
			}else{
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	

	
}
