package com.fh.controller.api;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import Decoder.BASE64Decoder;

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
import com.fh.util.Tools;

@Controller
@RequestMapping(value = "/api")
public class ApiServer extends BaseController {

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

	@RequestMapping(value = "/school", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolDefault() throws Exception {
		return schoolList();
	}

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
		ResponseGson<Integer> res = new ResponseGson();
		try {
			if (pd.get("NAME") != null) {
				Integer id = schoolService.save(pd);
				res.setData(id);
			} else {
				res.setDataError();
			}
		} catch (Exception e) {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/school/delete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolDelete() throws Exception {
		ResponseGson<PageData> res = new ResponseGson();
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				schoolService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/school/update", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolUpdate() throws Exception {
		ResponseGson<PageData> res = new ResponseGson();
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				schoolService.edit(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/basestation/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object basestation() throws Exception {
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			pd.put("BASESTATION_ID", pd.getString("id"));
			PageData ret = basestationService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		} else {
			List<PageData> ret = basestationService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}

	}

	@RequestMapping(value = "/basestation/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object basestationAdd() throws Exception {
		ResponseGson<PageData> res = new ResponseGson();
		PageData pd = this.getPageData();
		if (pd.getString("NAME") != null) {
			try {
				basestationService.edit(pd);
			} catch (Exception ex) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/basestation/delete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object basestationDelete() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				basestationService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/basestation/update", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object basestationUpdate() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				basestationService.edit(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/keypad/list", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypad() throws Exception {
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			PageData ret = keypadService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		} else {
			List<PageData> ret = keypadService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
	}

	@RequestMapping(value = "/keypad/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadAdd() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		try {
			keypadService.save(pd);
		} catch (Exception ex) {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/keypad/delete", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadDelete() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				keypadService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/keypad/update", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadUpdate() throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				keypadService.edit(pd);
			} catch (Exception ex) {
				res.setDataError();
			}
		} else {
			res.setDataError();
		}
		return res.toJson();
	}

	@RequestMapping(value = "/feedback/add", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object feedbackAdd(MultipartFile file, HttpServletRequest request)
			throws Exception {
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String path = request.getSession().getServletContext()
				.getRealPath("/images");
		File pathFile = new File(path);
		if(!pathFile.exists()){
			pathFile.mkdirs();
		}
		logger.info(path);
		if (file != null) {
			String fileName = file.getOriginalFilename();
			File dir = new File(path, Tools.date2Str(new Date()) + fileName);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			file.transferTo(dir);

			pd.put("PROBLEM_PATH", dir.getAbsolutePath());
			logger.info(dir.getAbsolutePath());
		} else {
			if (pd.get("PROBLEM_PATH") != null) {
				String imgStr = pd.getString("PROBLEM_PATH");
				String[] content = imgStr.split(";base64,");
				if (content.length >= 2) {
					String fileType = ".file";
					if (content[0].contains("image")) {
						fileType = content[0].substring(11,content[0].length());
					}
					String filename = "fb_"	+ System.currentTimeMillis() + "." + fileType ;
					File dir = new File(path + File.separator + filename );
					if (!dir.exists()) {
						dir.createNewFile();
					}
					generateImage(content[1], dir.getAbsolutePath());
					pd.put("PROBLEM_PATH", filename);
				}
			}
		}
		String id = pd.getString("ID");
		if (id != null && !"".equals(id)) {
			try {
				logger.info(pd);
				feedbackService.edit(pd);
			} catch (Exception ex) {
				res.setDataError();
			}
		} else {
			pd.put("CREATE_DATE", Tools.date2Str(new Date()));
			try {
				feedbackService.save(pd);
			} catch (Exception ex) {
				res.setDataError();
			}
		}
		return res.toJson();
	}

	@RequestMapping(value = "/problem", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object problem() throws Exception {
		PageData pd = getPageData();
		List<PageData> ret = null;
		if (pd.get("TYPE") != null && !"".equals(pd.get("TYPE"))) {
			ret = problemphenomenonService.listAllByType(pd);
		} else {
			ret = problemphenomenonService.listAll(pd);
		}
		ResponseGson<List<PageData>> res = new ResponseGson();
		res.setData(ret);
		return res.toJson();
	}

	public static boolean generateImage(String imgStr, String path) {
		if (imgStr == null)
			return false;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			byte[] b = decoder.decodeBuffer(imgStr);
			// 处理数据
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {
					b[i] += 256;
				}
			}
			OutputStream out = new FileOutputStream(path);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
}
