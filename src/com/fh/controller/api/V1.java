package com.fh.controller.api;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fh.bean.Paper;
import com.fh.bean.Point;
import com.fh.bean.Question;
import com.fh.bean.StudentAnswer;
import com.fh.bean.TestPaper;
import com.fh.bean.TestPaperInfo;
import com.fh.controller.base.BaseController;
import com.fh.controller.sunvote.Myelfun;
import com.fh.service.api.V1Manager;
import com.fh.service.feedback.feedback.FeedbackManager;
import com.fh.service.feedback.problemphenomenon.ProblemPhenomenonManager;
import com.fh.service.software.softwareversion.SoftwareVersionManager;
import com.fh.service.sunvote.attachkeyboard.AttachKeyboardManager;
import com.fh.service.sunvote.basestation.BasestationManager;
import com.fh.service.sunvote.cache.CacheManager;
import com.fh.service.sunvote.chapter.ChapterManager;
import com.fh.service.sunvote.classbasetation.ClassBasetationManager;
import com.fh.service.sunvote.classroster.ClassRosterManager;
import com.fh.service.sunvote.classtype.ClassTypeManager;
import com.fh.service.sunvote.coursemanagement.CourseManagementManager;
import com.fh.service.sunvote.event.EventManager;
import com.fh.service.sunvote.grade.GradeManager;
import com.fh.service.sunvote.keypad.KeypadManager;
import com.fh.service.sunvote.keypadcheck.KeypadCheckManager;
import com.fh.service.sunvote.knowledge.KnowledgeManager;
import com.fh.service.sunvote.knowledgechapter.KnowledgeChapterManager;
import com.fh.service.sunvote.networkstatistics.NetworkStatisticsManager;
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
import com.fh.service.sunvote.teachingmaterial.TeachingMaterialManager;
import com.fh.service.sunvote.testpaper.TestPaperManager;
import com.fh.service.sunvote.testpaperinfo.TestPaperInfoManager;
import com.fh.service.sunvote.textbook.TextbookManager;
import com.fh.service.system.user.UserManager;
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

	@Resource(name = "softwareversionService")
	private SoftwareVersionManager softwareversionService;

	@Resource(name = "attachkeyboardService")
	private AttachKeyboardManager attachkeyboardService;

	@Resource(name = "networkstatisticsService")
	private NetworkStatisticsManager networkstatisticsService;

	@Resource(name = "eventService")
	private EventManager eventService;

	@Resource(name = "userService")
	private UserManager userService;

	@Resource(name = "teachingmaterialService")
	private TeachingMaterialManager teachingmaterialService;
	
	@Resource(name = "textbookService")
	private TextbookManager textbookService;

	@Resource(name = "cacheService")
	private CacheManager cacheService;

	/**
	 * 登录
	 * 可以通过账号密码登录、
	 * 可以通过教师卡登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		event("apilogin");
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if (!pd.containsKey("ACCOUT")) {
			pd.put("ACCOUT", pd.get("USERNAME"));
		}
		if (((pd.containsKey("USERNAME") || (pd.containsKey("ACCOUT") && pd
				.get("ACCOUT") != null)) && pd.containsKey("PASSWORD"))
				|| pd.containsKey("KEYPAD_ID")) {
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
				eventPd.put("EVENT_IP", getRemoteIp());
				eventService.save(eventPd);

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
	
	/**
	 * 登录
	 * 可以通过账号密码登录、
	 * 可以通过教师卡登录
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/userinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object userinfo() throws Exception {
		event("userinfo");
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
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
			eventPd.put("EVENT_IP", getRemoteIp());
			eventService.save(eventPd);
			
			res.setData(pageData);
			// 填充数据到返回数据中
		} else {
			res.set1Error();
		}
		
		return res.toJson();
	}

	/**
	 * 查询班级
	 * 班级及班级学生详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/class", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object sclass() throws Exception {
		event("sclass");
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
				pt.put("CLASS_ID", pageData.get("ID"));
				List<PageData> keyboards = attachkeyboardService
						.listAllClassId(pt);
				pageData.put("keyboards", keyboards);
				res.setData(pageData);
			} else {
				res.set2Error();
			}
			logger.info("class cost time : "
					+ (System.currentTimeMillis() - cur));
			return res.toJson();
		} else {
			ResponseGson<List<PageData>> res = new ResponseGson();
			List<PageData> list = sclassService.listAll(pd);
			res.setData(list);
			logger.info("class cost time : "
					+ (System.currentTimeMillis() - cur));
			return res.toJson();
		}
	}

	/**
	 * 问题类型
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/questiontype", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questiontype() throws Exception {
		event("questiontype");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = questiontypeService.listAll(pd);
		res.setData(list);
		logger.info("questiontype cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 班级类型
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classtype", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object classtype() throws Exception {
		event("classtype");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = classtypeService.listAll(pd);
		res.setData(list);
		logger.info("classtype cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 *  年级
	 *  年级类型
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/grade", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object grade() throws Exception {
		event("grade");
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

	/**
	 * 科目
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subject", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object subject() throws Exception {
		event("subject");
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
	
	/**
	 * 科目
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subjectname", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object subjectName() throws Exception {
		event("subjectName");
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

	/**
	 * 键盘扫描
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/keypadscan", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadScan() throws Exception {
		event("keypadScan");
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
		logger.info("keypadScan cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * showcount 数量 currentpage 当前页码
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/paper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paper() throws Exception {
		event("paper");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		if (pd.containsKey("PAPER_TYPE") && pd.containsKey("USER_ID")) {
			String CURRENTPAGE = pd.getString("CURRENTPAGE");
			String SHOWCOUNT = pd.getString("SHOWCOUNT");
			if(CURRENTPAGE != null && SHOWCOUNT != null && !"".equals(CURRENTPAGE.trim()) && !"".equals(SHOWCOUNT.trim())){
				int currentPage = Integer.parseInt(CURRENTPAGE);
				int showcount = Integer.parseInt(SHOWCOUNT);
				currentPage = (currentPage > 0 ? currentPage -1 : 0) * showcount;
				pd.put("CURRENTPAGE", "" + currentPage);
			}
			List<PageData> pageList = paperService.listAllByType(pd);
			res.setData(pageList);
		} else {
			res.setDataError();
		}
		logger.info("paper cost time : " + (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 试卷详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/paperinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperInfo() throws Exception {
		event("paperInfo");
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
							question.setPart_score(qpd.getString("PART_SCORE"));
							question.setQuestionType(qpd
									.getString("PROBLEM_TYPE_ID"));
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
									qq.setPart_score(q.getString("PART_SCORE"));
									qq.setQuestionType(qpd
											.getString("PROBLEM_TYPE_ID"));
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
		logger.info("paperInfo cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
/*	*//**
	 * 试卷详细信息
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/paperinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperInfo() throws Exception {
		event("paperInfo");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson<PageData>();
		if (pd.containsKey("PAPER_ID")) {
			try {
				try {
					PageData ppd = paperService.findById(pd);
					if (ppd != null) {
						List<PageData> questList = v1Service
								.getTestPaperInfo(pd);
						ppd.put("QUESTIONS", questList);
						for (PageData qpd : questList) {
							
							String optionContent = qpd
									.getString("OPTION_CONTENT");
							if (optionContent != null
									&& optionContent.startsWith("[")
									&& optionContent.endsWith("]")) {
								String[] options = optionContent.substring(1,
										optionContent.length() - 1).split(",");
								qpd.put("OPTION_CONTENT", options);
							} else {
								qpd.put("OPTION_CONTENT",
										new String[] { optionContent });
							}
							if ("-1".equals("" + qpd.getString("P_ID"))) {
								PageData pidPd = new PageData();
								pidPd.put("PID", qpd.getString("QUESTION_ID"));
								List<PageData> qs = v1Service
										.getQuestionsByPID(pidPd);
								for (PageData pcd : qs) {
									String optionContent1 = pcd
											.getString("OPTION_CONTENT");
									if (optionContent1 != null
											&& optionContent1.startsWith("[")
											&& optionContent1.endsWith("]")) {
										String[] options = optionContent1
												.substring(
														1,
														optionContent1.length() - 1)
														.split(",");
										pcd.put("OPTION_CONTENT", options);
									} else {
										pcd.put("OPTION_CONTENT",
												new String[] { optionContent1 });
									}
									String[] keys = new String[pcd.keySet().size()];
									pcd.keySet().toArray(keys);
									Iterator map1it = pcd.entrySet().iterator();
									for (String key : keys) {
										pcd.put(key.toLowerCase(),pcd.get(key));
										pcd.remove(key.toUpperCase());
									}
								}
								qpd.put("QUESTIONS", qs);
							}
							
							String[] keys = new String[qpd.keySet().size()];
							qpd.keySet().toArray(keys);
							for (String key : keys) {
								qpd.put(key.toLowerCase(), qpd.get(key));
								qpd.remove(key.toUpperCase());
							}
							
						}
						String[] keys = new String[ppd.keySet().size()];
						ppd.keySet().toArray(keys);
						for (String key : keys) {
							ppd.put(key.toLowerCase(), ppd.get(key));
							ppd.remove(key.toUpperCase());
						}
						// pd.put("JSON", paper.toJson());
						res.setData(ppd);
						logger.info(res.toJson());
						
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
		logger.info("paperInfo cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
*/	/**
	 * 试卷详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/paperinfo2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperInfo2() throws Exception {
		event("paperInfo2");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson<PageData>();
		if (pd.containsKey("PAPER_ID")) {
			try {
				try {
					PageData ppd = paperService.findById(pd);
					if (ppd != null) {
						List<PageData> questList = v1Service
								.getTestPaperInfo(pd);
						ppd.put("QUESTIONS", questList);
						for (PageData qpd : questList) {
							
							String optionContent = qpd
									.getString("OPTION_CONTENT");
							if (optionContent != null
									&& optionContent.startsWith("[")
									&& optionContent.endsWith("]")) {
								String[] options = optionContent.substring(1,
										optionContent.length() - 1).split(",");
								qpd.put("OPTION_CONTENT", options);
							} else {
								qpd.put("OPTION_CONTENT",
										new String[] { optionContent });
							}
							if ("-1".equals("" + qpd.getString("P_ID"))) {
								PageData pidPd = new PageData();
								pidPd.put("PID", qpd.getString("QUESTION_ID"));
								List<PageData> qs = v1Service
										.getQuestionsByPID(pidPd);
								for (PageData pcd : qs) {
									String optionContent1 = pcd
											.getString("OPTION_CONTENT");
									if (optionContent1 != null
											&& optionContent1.startsWith("[")
											&& optionContent1.endsWith("]")) {
										String[] options = optionContent1
												.substring(
														1,
														optionContent1.length() - 1)
														.split(",");
										pcd.put("OPTION_CONTENT", options);
									} else {
										pcd.put("OPTION_CONTENT",
												new String[] { optionContent1 });
									}
								}
								qpd.put("QUESTIONS", qs);
							}
							
						
							
						}
						res.setData(ppd);
						logger.info(res.toJson());
						
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
		logger.info("paperInfo cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	/**
	 * 试卷详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/testpaperinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object testpaperinfo() throws Exception {
		event("testpaperinfo");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String paperId = pd.getString("ID");
		if (!StringUtils.isEmpty(paperId)) {
			try {
				pd.put("TESTPAPER_ID", paperId);
				PageData testPd = testpaperService.findById(pd);
				if (testPd != null) {
					PageData testInfof = new PageData();
					testInfof.put("PAPER_ID", testPd.getString("PAPER_ID"));
					testInfof.put("TEST_ID", paperId);
					List<PageData> list = testpaperinfoService.listTestPaperQuestionIDs(testInfof);
					for(PageData pqd : list){
						PageData tpqd = questionService.findById(pqd);
						pqd.putAll(tpqd);
						pqd.remove("P_ID");
						pqd.remove("SUBJECT_ID");
						pqd.remove("PROBLEM_TYPE_ID");
						pqd.remove("CHAPTER_ID");
						pqd.remove("TEACHER_ID");
						pqd.remove("SCHOOL_ID");
						pqd.remove("SUG_SCORE");
						pqd.remove("SUG_PART_SCORE");
						pqd.remove("USER_ID");
						pqd.remove("CREATE_DATE");
						pqd.remove("QUESTION_FROM");
						pqd.remove("REMARK");
						pqd.put("TEST_ID", paperId);
						List<PageData> listinfo = testpaperinfoService.listTestPaperQuestionIDinfo(pqd);
						List<PageData> answerInfos = new ArrayList<PageData>();
						List<String> answerList = new ArrayList<String>();
						for(PageData pid : listinfo){
							String answer = pid.getString("ANSWER");
							PageData answerPd = null;
							if(answerInfos.size() > 0){
								answerPd = answerInfos.get(answerInfos.size() -1);
								if(!answer.equals(answerPd.getString("ANSWER"))){
									answerPd = new PageData();
									answerPd.put("ANSWER", answer);
									answerPd.put("ISRIGHT", pid.getString("RIGHT"));
									answerInfos.add(answerPd);
									answerList.add(answer);
								}
							}else{
								answerPd = new PageData();
								answerPd.put("ANSWER", answer);
								answerPd.put("ISRIGHT", pid.getString("RIGHT"));
								answerInfos.add(answerPd);
								answerList.add(answer);
							}
							String strCount = answerPd.getString("COUNT");
							int count = 0 ;
							if(strCount != null){
								try{
								count = Integer.parseInt(strCount);
								}catch(NumberFormatException ex){}
							}
							count ++ ;
							answerPd.put("COUNT", count);
						}
						String questionNumStr = pqd.getString("OPTION_NUM");
						int questionNum = Integer.parseInt(questionNumStr);
						for(int i = 0 ; i < questionNum ;i++){
							if((!answerList.contains("" + (char)('A' + i))) && !(answerList.contains("" + (char)('a' + i)))){
								PageData answerPd = new PageData();
								answerPd.put("ANSWER", "" + (char)('A' + i));
								answerPd.put("ISRIGHT", pqd.get("ANSWER").equals(('A' + i)) ? "1" : "0");
								answerPd.put("COUNT", 0);
								answerInfos.add(answerPd);
							}
						}
						Collections.sort(answerInfos, new Comparator<PageData>(){

							@Override
							public int compare(PageData p1, PageData p2) {
								return p1.getString("ANSWER").compareToIgnoreCase(p2.getString("ANSWER"));
							}
							
						});
						pqd.put("ANSWERINFO", answerInfos);
						pqd.remove("TEST_ID");
					}
					for(PageData pad:list){
						String optionContent = pad.getString("OPTION_CONTENT");
						if(optionContent != null && optionContent.startsWith("[") && optionContent.endsWith("]")){
							String[] options = optionContent.substring(1, optionContent.length() -1).split(",");
							pad.put("OPTION_CONTENT", options);
						}else{
							pad.put("OPTION_CONTENT", new String[]{optionContent});
						}
					}
					testPd.put("QUESTIONS", list);
				
				}

				res.setData(testPd);
			} catch (Exception e) {
				e.printStackTrace();
				res.setError();
			}
		}
		logger.info("testpaperinfo cost time:"
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}
	
	/**
	 * 试卷详细信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/questionintestreportinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questionInTestReportInfo() throws Exception {
		event("questionInTestReportInfo");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		if (pd.getString("QUESTION_ID") != null) {
			String questionId = pd.getString("QUESTION_ID");
			PageData pqd = new PageData();
			pqd.put("QUESTION_ID", questionId);
			PageData tpqd = questionService.findById(pqd);
			if (tpqd != null) {
				pqd.putAll(tpqd);
				pqd.remove("P_ID");
				pqd.remove("SUBJECT_ID");
				pqd.remove("PROBLEM_TYPE_ID");
				pqd.remove("CHAPTER_ID");
				pqd.remove("TEACHER_ID");
				pqd.remove("SCHOOL_ID");
				pqd.remove("SUG_SCORE");
				pqd.remove("SUG_PART_SCORE");
				pqd.remove("USER_ID");
				pqd.remove("CREATE_DATE");
				pqd.remove("QUESTION_FROM");
				pqd.remove("REMARK");
				String optionContent = pqd.getString("OPTION_CONTENT");
				if (optionContent != null && optionContent.startsWith("[")
						&& optionContent.endsWith("]")) {
					String[] options = optionContent.substring(1,
							optionContent.length() - 1).split(",");
					pqd.put("OPTION_CONTENT", options);
				} else {
					pqd.put("OPTION_CONTENT", new String[] { optionContent });
				}
				if (pd.getString("TEST_ID") != null) {
					pqd.put("TEST_ID", pd.getString("TEST_ID"));
				}
				List<PageData> listinfo = testpaperinfoService
						.listTestPaperQuestionIDinfo(pqd);
				List<PageData> answerInfos = new ArrayList<PageData>();
				for (PageData pid : listinfo) {
					String answer = pid.getString("ANSWER");
					PageData answerPd = null;
					if (answerInfos.size() > 0) {
						answerPd = answerInfos.get(answerInfos.size() - 1);
						if (!answer.equals(answerPd.getString("ANSWER"))) {
							answerPd = new PageData();
							answerPd.put("ANSWER", answer);
							answerPd.put("ISRIGHT", pid.getString("RIGHT"));
							answerInfos.add(answerPd);
						}
					} else {
						answerPd = new PageData();
						answerPd.put("ANSWER", answer);
						answerPd.put("ISRIGHT", pid.getString("RIGHT"));
						answerInfos.add(answerPd);
					}
					String strCount = answerPd.getString("COUNT");
					int count = 0;
					if (strCount != null) {
						try {
							count = Integer.parseInt(strCount);
						} catch (NumberFormatException ex) {
						}
					}
					count++;
					answerPd.put("COUNT", count);
				}
				pqd.put("ANSWERINFO", answerInfos);
				res.setData(pqd);
			}else{
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		logger.info("questionInTestReportInfo cost time:"
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 试卷简要信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/paperbriefinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperBriefInfo() throws Exception {
		event("paperBriefInfo");
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
							question.setQuestion_id(qpd
									.getString("QUESTION_ID"));
							if ("-1".equals("" + qpd.getString("P_ID"))) {
								PageData pidPd = new PageData();
								pidPd.put("PID", question.getQuestion_id());
								question.setQuestions(new ArrayList<Question>());
								List<PageData> qs = v1Service
										.getQuestionsByPID(pidPd);
								for (PageData q : qs) {
									Question qq = new Question();
									qq.setQuestion_id(q
											.getString("QUESTION_ID"));
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
		logger.info("paperBriefInfo cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toBrifJson();
	}

	
	/**
	 * 试卷问题
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/paperquestion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object paperQuestion() throws Exception {
		event("paperQuestion");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		logger.info("paperquestion cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 问题
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/question", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object question() throws Exception {
		event("question");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = new ArrayList<PageData>();
		if (pd.containsKey("ID")) {
			String ids = pd.getString("ID");
			String[] id = ids.split(",");
			for (String i : id) {
				pd.put("QUESTION_ID", i);
				PageData data = questionService.findById(pd);
				String optionContent = data.getString("OPTION_CONTENT");
				if(optionContent != null && optionContent.startsWith("[") && optionContent.endsWith("]")){
					String[] options = optionContent.substring(1, optionContent.length() -1).split(",");
					data.put("OPTION_CONTENT", options);
				}else{
					data.put("OPTION_CONTENT", new String[]{optionContent});
				}
				if (data != null) {
					list.add(data);
				}
			}
			res.setData(list);
		} else {
			res.setDataError();
		}
		logger.info("question cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 查询知识点名称
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/knowledgename", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object knowledgename() throws Exception {
		event("knowledgename");
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = new ArrayList<PageData>();
		PageData pd = getPageData();
		if (pd.get("ID") != null) {
			String ids = pd.getString("ID");
			String[] id = ids.split(",");
			for (String i : id) {
				pd.put("KNOWLEDGE_ID", i);
				PageData data = knowledgeService.findById(pd);
				if (data != null) {
					PageData t = new PageData();
					t.put("KNOWLEDGE_ID", data.get("KNOWLEDGE_ID"));
					t.put("NAME", data.get("NAME"));
					list.add(t);
				}
			}
			res.setData(list);
		}
		;
		return res;
	}

	/**
	 * 章节名称
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/chaptername", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object chaptername() throws Exception {
		event("chaptername");
		ResponseGson<List<PageData>> res = new ResponseGson();
		List<PageData> list = new ArrayList<PageData>();
		PageData pd = getPageData();
		if (pd.get("ID") != null) {
			String ids = pd.getString("ID");
			String[] id = ids.split(",");
			for (String i : id) {
				pd.put("ID", i);
				PageData data = chapterService.findById(pd);
				if (data != null) {
					PageData t = new PageData();
					t.put("ID", data.get("ID"));
					t.put("NAME", data.get("NAME"));
					list.add(t);
				}
			}
			res.setData(list);
		}
		;
		return res;
	}

	/**
	 * 试题添加
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/question/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questionAdd() throws Exception {
		event("questionAdd");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		pd.put("QUESTION_ID", this.get32UUID());
		questionService.save(pd);
		logger.info("questionAdd cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/***
	 * 上传试卷
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadpaper() throws Exception {
		event("uploadpaper");
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

			int questionNum = 0;

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
						questionNum++;
						qPd.put("P_ID", "0");
					}
					qPd.put("SUBJECT_ID", paper.getSubject_id());
					qPd.put("CHAPTER_ID", question.getChapter_id());
					qPd.put("PROBLEM_TYPE_ID",
							question.getProblem_type_id() == null ? "1"
									: question.getProblem_type_id());
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
							cqPd.put("PROBLEM_TYPE_ID", question
									.getProblem_type_id() == null ? "1"
									: question.getProblem_type_id());
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
							questionNum++;
						}
					}
				}
			}
			paperPd.put("QUESTION_NUM", "" + questionNum);
			paperService.save(paperPd);

		} else {
			res.setDataError();
		}
		logger.info("uploadpaper cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 上传试卷，不上传试题详细信息。试题从已有数据库中组卷
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/publishpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object publishPaper() throws Exception {
		event("publishpaper");
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
			paperPd.put("CLASS_ID", paper.getClass_id());
			paperPd.put("SCORE", paper.getScore());
			paperPd.put("PAPER_STATE", "0");
			paperPd.put("REMARK", "");
			String schoolID = Myelfun.getUserID(paper.getUser_id());
			paperPd.put("SCHOOL_ID", schoolID);
			paperPd.put("CREATE_DATE", Tools.date2Str(new Date()));
			paperPd.put("MODIFY_DATE", Tools.date2Str(new Date()));
			List<Question> questions = paper.getQuestions();
			int questionNum = questions.size();
			if (questions != null) {
				for (Question question : questions) {
					PageData pqPd = new PageData();
					pqPd.put("PAPER_ID", paperID);
					pqPd.put("QUESTION_ID", question.getQuestion_id());
					pqPd.put("SCORE", question.getScore());
					pqPd.put("PART_SCORE", "0");
					pqPd.put("RANK", question.getRank());
					pqPd.put("NO_NAME", question.getNo_name());
					pqPd.put("PAPERQUESTION_ID", this.get32UUID());
					pqPd.put("P_ID", "0");
					paperquestionService.save(pqPd);

				}
			}
			paperPd.put("QUESTION_NUM", "" + questionNum);
			paperService.save(paperPd);

		} else {
			res.setDataError();
		}
		logger.info("publishpaper cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 上传知识点
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadpoint", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadpoint() throws Exception {
		event("uploadpoint");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();

		if (!StringUtils.isEmpty(pd.getJsonString())) {
			try {
				ResponseGson<List<Point>> req = ResponseGson.parse(
						pd.getJsonString(), Point.class);
				List<Point> list = req.getData();
				if (list != null && list.size() > 0) {
					for (Point point : list) {
						savePoint(point, null);
					}
				}
			} catch (Exception e) {
				res.setError();
			}
		} else {
			res.setDataError();
		}
		logger.info("uploadpoint cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 *  上传测验成绩
	 * @return
	 */
	@RequestMapping(value = "/uploadtestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadTestpaper() {
		event("uploadTestpaper");
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
				testPd.put("TEST_TYPE", testPaper.getTest_type() != null ? testPaper.getTest_type() :"101");
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
				} else {
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
		logger.info("uploadTestpaper cost time:"
				+ (System.currentTimeMillis() - cur));

		return res.toJson();

	}

	/**
	 *  上传测验成绩
	 * @return
	 */
	@RequestMapping(value = "/uploadupdatetestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadupdateTestpaper() {
		event("uploadupdateTestpaper");
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
				testPd.put("TEST_TYPE", testPaper.getTest_type() != null ? testPaper.getTest_type() :"101");
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
				testPd.put("TOTAL_SCORE", testPaper.getTotalScore());
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
		logger.info("uploadupdatetestpaper cost time:"
				+ (System.currentTimeMillis() - cur));

		return res.toJson();

	}
	
	/**
	 *  上传测验成绩
	 * @return
	 */
	@RequestMapping(value = "/uploadupdatetestpaper2", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadupdateTestpaper2() {
		event("uploadupdateTestpaper2");
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
				testPd.put("TEST_TYPE", testPaper.getTest_type() != null ? testPaper.getTest_type() :"101");
				testPd.put("START_DATE", testPaper.getStartDate());
				testPd.put("END_DATE", testPaper.getEndDate());
				testPd.put("NAME", testPaper.getName());
				testPd.put("TESTPAPER_ID", testPaperId);
				testPd.put("OTHER_SCORE", testPaper.getOtherScore());
				testPd.put("HIGHT_SCORE", testPaper.getHighScore());
				testPd.put("LOW_SCORE", testPaper.getLowScore());
				testPd.put("AVG_SCORE", testPaper.getAvgScore());
				testPd.put("TOTAL_SCORE", testPaper.getTotalScore());
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
										testPaperInfo.getPaperId());
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
								testInfoPd.put("RANDOM", testPaperInfo.getRandom());
								testInfoPd.put("RANK", testPaperInfo.getRank());
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
		logger.info("uploadupdatetestpaper cost time:"
				+ (System.currentTimeMillis() - cur));
		
		return res.toJson();
		
	}

	/**
	 * 查询知识点
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/point", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object point() throws Exception {
		event("point");
		ResponseGson<List<PageData>> res = new ResponseGson();

		PageData pd = getPageData();
		String key = this.getRequestKey(pd, "point");
		PageData pagedata = new PageData();
		pagedata.put("KEY", key);
		if (!"".equals(key.trim())) {
			PageData ret = cacheService.findById(pagedata);
			if (ret != null && ret.get("CACHE") != null) {
				return ret.get("CACHE");
			}
		}
		List<PageData> list = knowledgeService.listAllknowledge(pd);
		String depth = pd.getString("DEPTH");
		int end = 3;
		if (depth != null) {
			try {
				end = Integer.parseInt(depth);
			} catch (Exception e) {

			}
		}
		roundPointData(list, 1, end);
		res.setData(list);
		String str = res.toJson();
		str = str.replaceAll("[^\\u0000-\\uFFFF]", "");
		pagedata.put("CACHE", str);
		cacheService.save(pagedata);
		return str;
	}

	/**
	 * 知识点递归查询
	 * @param list 查询知识点及子知识点
	 * @param dept 深度
	 * @param end 层深
	 * @throws Exception
	 */
	private void roundPointData(List<PageData> list, int dept, int end)
			throws Exception {
		if (list != null) {
			for (PageData pd : list) {
				pd.put("P_ID", pd.getString("KNOWLEDGE_ID"));
				if (pd.getString("P_ID") != null
						&& !"".equals(pd.getString("P_ID")) && dept < end) {
					List<PageData> ret = knowledgeService.listAllknowledge(pd);
					if (ret != null && ret.size() > 0) {
						roundPointData(ret, dept + 1, end);
						pd.put("CHILDREN", ret);
					}
				}
				pd.remove("P_ID");
			}
		}
	}

	/**
	 * 章节递归查询
	 * @param list 章节
	 * @param dept 深度
	 * @param end 递归深度
	 * @throws Exception
	 */
	private void roundChapterData(List<PageData> list, int dept, int end)
			throws Exception {
		if (list != null) {
			for (PageData pd : list) {
				pd.put("P_ID", pd.getString("ID"));
				if (dept < end) {
					if (pd.getString("P_ID") != null
							&& !"".equals(pd.getString("P_ID"))) {
						List<PageData> ret = chapterService.listAllChapter(pd);
						if (ret != null && ret.size() > 0) {
							roundChapterData(ret, dept + 1, end);
							pd.put("CHILDREN", ret);
						}
					}
				}
				pd.remove("P_ID");
				pd.remove("TEACHINGMATERIAL_ID");
			}
		}
	}

	/**
	 *  下载测验成绩
	 * @return
	 */
	@RequestMapping(value = "/downloadtestpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object downloadTestpaper() {
		event("downloadTestpaper");
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
		logger.info("downloadtestpaper cost time:"
				+ (System.currentTimeMillis() - cur));
		return res.toJson();

	}

	/**
	 * 
	 *  下载测验成绩
	 * @return
	 */
	@RequestMapping(value = "/testpaper", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object testpaper() {
		event("testpaper");
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

	/***
	 * 
	 */
	@RequestMapping(value = "/schooladmin", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public void schoolAdmin() {
		event("schoolAdmin");
		PageData pd = this.getPageData();
		this.getUserID();
	}

	
	/***
	 * 网络
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/network", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object network() throws Exception {
		event("network");
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		PageData spd = networkstatisticsService.findByClientID(pd);
		String seqStr = pd.getString("SEQ");
		if (seqStr != null && pd.getString("CLIENT_ID") != null
				&& pd.getString("SESSION_ID") != null) {
			int seq = Integer.parseInt(seqStr);
			if (spd != null) {
				int successCount = Integer.parseInt(spd
						.getString("SUCCESS_COUNT"));
				spd.put("SUCCESS_COUNT", ++successCount + "");
				int fail = seq - successCount;
				if (fail < 0) {
					fail = 0;
				}
				spd.put("FAIL_COUNT", fail + "");
				networkstatisticsService.edit(spd);
				spd.remove("NETWORKSTATISTICS_ID");
				spd.remove("CLIENT_ID");
				spd.remove("SESSION_ID");
				res.setData(spd);
			} else {
				pd.put("NETWORKSTATISTICS_ID", get32UUID());
				pd.put("SUCCESS_COUNT", "1");
				pd.put("CLIENT_IP", getRemoteIp());
				int fail = seq - 1;
				if (fail < 0) {
					fail = 0;
				}
				pd.put("FAIL_COUNT", fail + "");
				networkstatisticsService.save(pd);
				pd.remove("JSON");
				pd.remove("CLIENT_ID");
				pd.remove("SESSION_ID");
				pd.remove("SEQ");
				pd.remove("NETWORKSTATISTICS_ID");
				res.setData(pd);
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	/**
	 * 获取远端ip地址
	 * @return
	 */
	public String getRemoteIp() {
		HttpServletRequest request = getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {
			ip = request.getRemoteAddr();
		} else {
			ip = request.getHeader("x-forwarded-for");
		}
		return ip;
	}

	/**
	 * 查询新版本信息
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/newversion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object getNewVersion(HttpServletRequest request) throws Exception {
		event("getNewVersion");
		PageData pd = this.getPageData();
		String softId = pd.getString("SOFTID");
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName()
				+ ":" + request.getServerPort() + path + "/";
		ResponseGson<PageData> res = new ResponseGson();
		if (softId != null && !"".equals(softId)) {
			pd.put("SOFTWARE_ID", softId);
			PageData result = softwareversionService.findNewVersion(pd);
			if (result != null) {
				result.remove("SOFTWAREVERSION_ID");
				result.remove("SOFTWARE_ID");
				result.put("VERSION_PATH", basePath + "uploadFiles/uploadFile/"
						+ result.getString("VERSION_PATH"));
				res.setData(result);
			} else {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	/**
	 * 获取教材版本
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/teachingmaterial", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object teachingmaterial() throws Exception {
		PageData pd = getPageData();
		ResponseGson<List<PageData>> ret = new ResponseGson<List<PageData>>();
		List<PageData> lpd = new ArrayList<PageData>();
		List<PageData> list = teachingmaterialService.listAll(pd);
		String subjectID = pd.getString("SUBJECT_ID");
		if (subjectID != null && !"".equals(subjectID)) {
			for (PageData pad : list) {
				String subis = pad.getString("SUBJECT_ID");
				if (subis != null) {
					String[] subs = subis.split(",");
					if (subs != null) {
						for (String sub : subs) {
							if (subjectID.trim().equals(sub.trim())) {
								pad.remove("SUBJECT_ID");
								pad.put("VERSION_CODE",
										pad.getString("VERSION_CODE"));
								lpd.add(pad);
								break;
							}
						}
					}
				}
			}
		} else {
			for (PageData pad : list) {
				pad.remove("SUBJECT_ID");
				pad.put("VERSION_CODE", pad.getString("VERSION_CODE"));
				lpd.add(pad);
			}
		}
		ret.setData(lpd);
		return ret.toJson();
	}
	
	@RequestMapping(value = "/textbook", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object textbook() throws Exception {
		PageData pd = getPageData();
		ResponseGson<List<PageData>> ret = new ResponseGson<List<PageData>>();
		List<PageData> list = textbookService.listAll(pd);
		ret.setData(list);
		return ret.toJson();
	}

	/**
	 * 获取教材版本
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/chapter", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object chapter() throws Exception {
		PageData pd = getPageData();
		String key = this.getRequestKey(pd, "chapter");
		PageData pagedata = new PageData();
		pagedata.put("KEY", key);
		if (!"".equals(key.trim())) {
			PageData ret = cacheService.findById(pagedata);
			if (ret != null && ret.get("CACHE") != null) {
				return ret.get("CACHE");
			}
		}
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		List<PageData> list = chapterService.listAllChapter(pd);
		String depth = pd.getString("DEPTH");
		int end = 3;
		if (depth != null) {
			try {
				end = Integer.parseInt(depth);
			} catch (Exception e) {

			}
		}
		roundChapterData(list, 1, end);
		res.setData(list);
		String str = res.toJson();
		pagedata.put("CACHE", str);
		cacheService.save(pagedata);
		return str;
	}

	/**
	 * 获取试题
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/questions", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object questions() throws Exception {
		PageData pd = getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		String teachingmaterialId = pd.getString("TEACHINGMATERIAL_ID");
		String chapterId = pd.getString("CHAPTER_ID");
		if (teachingmaterialId != null && !teachingmaterialId.equals("")
				&& chapterId == null) {
			PageData chapterPd = new PageData();
			chapterPd.put("TEACHINGMATERIAL_ID", teachingmaterialId);
			List<PageData> chapterList = chapterService
					.listAllChapter(chapterPd);
			roundChapterData(chapterList, 1, 3);
			List<String> ids = getIds(chapterList, "ID");
			pd.put("CHAPTER_IDS", ids);
		} else {
			List<String> ids = new ArrayList<String>();
			if (chapterId != null && !"".equals(chapterId.trim())) {
				ids.add(chapterId);
			}
			pd.put("CHAPTER_IDS", ids);
		}
		pd.remove("CHAPTER_ID");
		String knowledge = pd.getString("KNOWLEDGE_ID");
		if (knowledge != null && !"".equals(knowledge.trim())) {
			PageData knowPd = new PageData();
			knowPd.put("P_ID", knowledge);
			List<PageData> knowlist = knowledgeService.listAllknowledge(knowPd);
			roundPointData(knowlist, 1, 3);
			List<String> ids = getIds(knowlist, "KNOWLEDGE_ID");
			ids.add(knowledge);
			pd.put("KNOWLEDGE_IDS", ids);
			pd.remove("KNOWLEDGE_ID");
		}
		int pageNumI = 0 ;
		int count = 30 ;
		String pageNum = pd.getString("PAGENUM");
		String countStr = pd.getString("COUNT");
		if(pageNum != null && !"".equals(pageNum) && countStr != null && !"".equals(countStr)){
			pageNumI = Integer.parseInt(pageNum);
			count = Integer.parseInt(countStr);
			if(pageNumI >= 1){
				pageNumI = (pageNumI -1 ) * count; 
			}else{
				pageNumI = 0 ;
			}
			pd.put("PAGENUM", "" + pageNumI);
			pd.put("COUNT", "" + count);
		}
		List<PageData> list = questionService.listAllquestion(pd);
		for(PageData pad:list){
			String optionContent = pad.getString("OPTION_CONTENT");
			if(optionContent != null && optionContent.startsWith("[") && optionContent.endsWith("]")){
				String[] options = optionContent.substring(1, optionContent.length() -1).split(",");
				pad.put("OPTION_CONTENT", options);
			}else{
				pad.put("OPTION_CONTENT", new String[]{optionContent});
			}
		}
		res.setData(list);
		return res.toJson();
	}

	/**
	 * 随机获取试题
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/randquestions", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object randquestions() throws Exception {
		PageData pd = getPageData();
		ResponseGson<List<PageData>> res = new ResponseGson<List<PageData>>();
		String teachingmaterialId = pd.getString("TEACHINGMATERIAL_ID");
		String chapterId = pd.getString("CHAPTER_ID");
		if (teachingmaterialId != null && !teachingmaterialId.equals("")
				&& chapterId == null) {
			PageData chapterPd = new PageData();
			chapterPd.put("TEACHINGMATERIAL_ID", teachingmaterialId);
			List<PageData> chapterList = chapterService
					.listAllChapter(chapterPd);
			roundChapterData(chapterList, 1, 3);
			List<String> ids = getIds(chapterList, "ID");
			pd.put("CHAPTER_IDS", ids);
		} else {
			List<String> ids = new ArrayList<String>();
			if (chapterId != null && !"".equals(chapterId.trim())) {
				ids.add(chapterId);
			}
			pd.put("CHAPTER_IDS", ids);
		}
		pd.remove("CHAPTER_ID");
		String knowledge = pd.getString("KNOWLEDGE_ID");
		if (knowledge != null && !"".equals(knowledge.trim())) {
			PageData knowPd = new PageData();
			knowPd.put("P_ID", knowledge);
			List<PageData> knowlist = knowledgeService.listAllknowledge(knowPd);
			roundPointData(knowlist, 1, 3);
			List<String> ids = getIds(knowlist, "KNOWLEDGE_ID");
			ids.add(knowledge);
			pd.put("KNOWLEDGE_IDS", ids);
			pd.remove("KNOWLEDGE_ID");
		}
		List<PageData> list = questionService.listAllRandquestion(pd);
		for(PageData pad:list){
			String optionContent = pad.getString("OPTION_CONTENT");
			if(optionContent != null && optionContent.startsWith("[") && optionContent.endsWith("]")){
				String[] options = optionContent.substring(1, optionContent.length() -1).split(",");
				pad.put("OPTION_CONTENT", options);
			}else{
				pad.put("OPTION_CONTENT", new String[]{optionContent});
			}
		}
		res.setData(list);
		return res.toJson();
	}

	/**
	 * 
	 * @param chapterList
	 * @param key
	 * @return
	 */
	public List<String> getIds(List<PageData> chapterList, String key) {
		List<String> ids = new ArrayList<String>();
		if (chapterList != null && chapterList.size() > 0) {
			for (PageData pd : chapterList) {
				String chapterid = pd.getString(key);
				if (chapterid != null && !"".equals(chapterid)) {
					ids.add(chapterid);
				}
				Object obj = pd.get("CHILDREN");
				if (obj != null && (obj instanceof List)) {
					@SuppressWarnings("unchecked")
					List<PageData> list = (List<PageData>) obj;
					List<String> ret = getIds(list, key);
					if (ret != null && ret.size() > 0) {
						ids.addAll(ret);
					}
				}
			}
		}

		return ids;

	}

	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/tempcreateUser", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object tempCreateUser() throws Exception {
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
		}

		// ID, TEACHER_ID, CLASS_ID, SUBJECT_ID, START_DATE, END_DATE, GRADE_ID,
		// TERM_ID, REMARK
		pd.put("TEACHER_ID", pd.get("ID"));
		pd.put("CLASS_ID", "bc33389101ec46e6b7d47daa8adf58ac");
		pd.put("SUBJECT_ID", "1");
		pd.put("GRADE_ID", "1");
		pd.put("TERM_ID", "0d8ea2efdef74accbd0d00e9bc07dfbb");
		coursemanagementService.save(pd);

		return "{'res':'success'}";
	}

	/**
	 * 
	 * @param apiName
	 */
	private void event(String apiName) {
		PageData eventPd = new PageData();
		eventPd.put("EVENT_ID", get32UUID());
		eventPd.put("EVENT_NAME", apiName);
		eventPd.put("EVENT_USER", getUsername());
		eventPd.put("EVENT_TYPE", "-1");
		eventPd.put("EVENT_START_TIME", Tools.date2Str(new Date()));
		eventPd.put("CLIENT_ID", "SERVER");
		eventPd.put("EVENT_IP", getRemoteIp());
		try {
			eventService.save(eventPd);
		} catch (Exception e) {

		}
	}

	static int index = 0;

	/**
	 * 
	 * @param point
	 * @param pid
	 */
	private void savePoint(Point point, String pid) {
		List<Point> children = point.getChildren();
		if (children != null && children.size() > 0) {
			for (Point p : children) {
				savePoint(p, point.getCode());
			}
		}
		PageData pageData = new PageData();
		pageData.put("KNOWLEDGE_ID", point.getCode());
		pageData.put("NAME", point.getName());
		pageData.put("P_ID", pid);
		pageData.put("RANK", ++index);
		try {
			knowledgeService.save(pageData);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadbook", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadbook() throws Exception {
		event("uploadbook");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<String> res = new ResponseGson();

		if (!StringUtils.isEmpty(pd.getJsonString())) {
			try {
				ResponseGson<List<Point>> req = ResponseGson.parse(
						pd.getJsonString(), Point.class);
				List<Point> list = req.getData();
				if (list != null && list.size() > 0) {
					for (Point point : list) {
						saveBook(point);
					}
				}
			} catch (Exception e) {
				res.setError();
			}
		} else {
			res.setDataError();
		}
		logger.info("uploadpoint cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 
	 * @param point
	 */
	private void saveBook(Point point) {

		PageData pd = new PageData();
		pd.put("ID", point.getCode());
		pd.put("NAME", point.getName());
		pd.put("SUBJECT_ID", point.getSubjectCode());
		try {
			teachingmaterialService.save(pd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uploadyuncelianquestion", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object uploadyuncelianquestion() throws Exception {
		event("uploadyuncelianquestion");
		long cur = System.currentTimeMillis();
		PageData pd = this.getPageData();
		ResponseGson<Object> res = new ResponseGson();

		if (!StringUtils.isEmpty(pd.getJsonString())) {
			try {
				ResponseGson<Object> req = ResponseGson.parse(pd
						.getJsonString());
				Object data = req.getData();
				if (data instanceof List) {
					List<Object> list = (List) data;
					for (Object obj : list) {
						if (obj instanceof Map) {
							Map map = (Map) obj;

							PageData pageData = new PageData();
							pageData.put("QUESTION_ID", map.get("id"));
							Object cateObj = map.get("cate");
							if (cateObj != null) {
								String cate = cateObj.toString();
								float catef = Float.parseFloat(cate);
								pageData.put("QUESTION_TYPE_ID", (int) catef);
							}
							Object contentObj = map.get("content");
							if (contentObj != null) {
								String content = contentObj.toString();
								content = replaceWebUrl(content);
								pageData.put("CONTENT", content);
							}
							Object subjectCodeObj = map.get("subjectCode");
							if (subjectCodeObj != null) {
								String subjectCode = subjectCodeObj.toString();
								pageData.put("SUBJECT_ID", subjectCode);
							}
							Object optionsObj = map.get("options");
							if (optionsObj instanceof List) {
								List ss = (List) optionsObj;
								pageData.put("OPTION_CONTENT",
										optionsObj.toString());
								pageData.put("OPTION_NUM", "" + ss.size());
							}
							Object answersObj = map.get("answers");
							if (answersObj instanceof List) {
								List answers = (List) answersObj;
								StringBuilder sb = new StringBuilder();
								for (Object as : answers) {
									sb.append(as.toString());
								}
								pageData.put("ANSWER", sb.toString());
							}
							Object difficulty = map.get("difficulty");
							try {
								if (difficulty != null) {
									float fdifficulty = Float
											.parseFloat(difficulty.toString());
									pageData.put("DIFFICULTY",
											(int) fdifficulty);
								}
							} catch (Exception ex) {
								ex.printStackTrace();
							}
							Object discussObj = map.get("discuss");
							if (discussObj != null) {
								String discuss = discussObj.toString();
								discuss = replaceWebUrl(discuss);
								pageData.put("REMARK", discuss);
							}
							Object analyseObj = map.get("analyse");
							if (analyseObj != null) {
								String analyse = analyseObj.toString();
								analyse = replaceWebUrl(analyse);
								pageData.put("ANALYSIS", analyse);
							}
							Object methodObj = map.get("method");
							if (methodObj != null) {
								String method = methodObj.toString();
								method = replaceWebUrl(method);
								pageData.put("METHOD", method);
							}
							Object points = map.get("points");
							StringBuilder sb = new StringBuilder();
							if (points instanceof List) {
								List pointsList = (List) points;
								for (Object pObject : pointsList) {
									if (pObject instanceof Map) {
										Map pMap = (Map) pObject;
										sb.append(pMap.get("code")).append(",");
									}
								}

								if (sb.toString().length() > 1) {
									sb.deleteCharAt(sb.length() - 1);
								}
								pageData.put("KNOWLEDGE_ID", sb.toString());
							}
							pageData.put("QUESTION_FROM", "101");
							try {
								questionService.save(pageData);
							} catch (Exception e) {
								logger.error("save fail:" + map.get("id"), e);
							}
						}
					}
				}
			} catch (Exception e) {
				res.setError();
			}
		} else {
			res.setDataError();
		}
		logger.info("uploadyuncelianquestion cost time : "
				+ (System.currentTimeMillis() - cur));
		return res.toJson();
	}

	/**
	 * 
	 * @param content
	 * @return
	 */
	private String replaceWebUrl(String content) {
		if (content != null) {
			content = content.replaceAll(
					"http://image.yuncelian.com/1/analysis/",
					"http://image.yuncelian.com/1/analysis/");
		}
		return content;
	}

	/**
	 * 
	 * @param pd
	 * @param methodName
	 * @return
	 */
	public String getRequestKey(PageData pd, String methodName) {
		StringBuilder key = new StringBuilder();
		key.append(methodName).append("{");
		if (pd != null) {
			Iterator iterator = pd.keySet().iterator();
			while (iterator.hasNext()) {
				Object obj = iterator.next();
				key.append(obj.toString()).append(":")
						.append(pd.get(obj).toString()).append(";");
			}
		}
		key.append("}");

		return key.toString();
	}
	
	
	/**
	 * 根据ID，获取科目中文名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subjectename", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public  String findSubjectEName() throws Exception{
		PageData pageData = this.getPageData();
		ResponseGson<String> res = new ResponseGson<String>();
		pageData = subjectService.findById(pageData);
		if(pageData != null){
			res.setData(pageData.getString("ENAME"));
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	/**
	 * 根据ID或者科目英文名称
	 * @param type
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subjectcname", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public  String findSubjectCName() throws Exception{
		ResponseGson<String> res = new ResponseGson<String>();
		PageData pageData = new PageData();
		StringBuilder sb = new StringBuilder();
		String type  = this.getPageData().getString("ID");
		if(type.contains(",")){
			String[] types = type.split(",");
			for (String t : types) {
				pageData.put("ID", t);
				pageData = subjectService.findById(pageData);
				if (pageData != null) {
					sb.append(pageData.getString("CNAME") + ";  ");
				}
			}
			sb.delete(sb.length() -3, sb.length());
		}else{
			pageData.put("ID", type);
			pageData = subjectService.findById(pageData);
			if (pageData != null) {
				sb.append(pageData.getString("CNAME"));
			}
		}
		res.setData(sb.toString());
		return res.toJson();
	}
	
	/**
	 * 根据ID班级名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/classname", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public  String findClassName() throws Exception {
		ResponseGson<String> res = new ResponseGson<String>();
		PageData pageData = this.getPageData();
		pageData = sclassService.findById(pageData);
		String className = "" ;
		if(pageData != null){
			className = pageData.getString("CLASS_NAME");
		}else{
			res.setDataError();
		}
		res.setData(className);
		return res.toJson();
		
	}
	
	/**
	 * 根据ID班级名称
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/qstudentinfo", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public  String qstudentinfo() throws Exception {
		ResponseGson<List<PageData>> res = new ResponseGson();
		PageData pageData = this.getPageData();
		if (pageData.containsKey("TEST_ID")
				&& pageData.containsKey("QUESTION_ID")) {
			List<PageData> list = v1Service.getQuestionWrongInfo(pageData);
			res.setData(list);
		}else{
			res.setDataError();
		}
		return res.toJson();
		
	}
	
	@RequestMapping(value = "/uploadfile", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String uploadFile(@RequestParam(value="file",required=false)MultipartFile file, HttpServletRequest request) throws Exception{
		ResponseGson<String> res = new ResponseGson<String>();
		if (file != null) {
			String path = request.getSession().getServletContext()
					.getRealPath("/uploadFiles/uploadFile/");
			String name = System.currentTimeMillis() + file.getOriginalFilename();
			File pathFile = new File(path);
			pathFile.mkdirs();
			File saveFile = new File(path + File.separator + name);
			if(saveFile.exists()){
				saveFile.delete();
			}
			saveFile.createNewFile();
			file.transferTo(saveFile);
			path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + path + "/";
			res.setData("/uploadFiles/uploadFile/" + name);
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	
	
}
