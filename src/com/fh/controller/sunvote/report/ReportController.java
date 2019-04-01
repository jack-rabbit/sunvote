package com.fh.controller.sunvote.report;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.api.ResponseGson;
import com.fh.controller.base.BaseController;
import com.fh.service.api.V1Manager;
import com.fh.service.sunvote.sclass.SClassManager;
import com.fh.service.sunvote.student.StudentManager;
import com.fh.service.sunvote.studenttest.StudentTestManager;
import com.fh.service.sunvote.subject.SubjectManager;
import com.fh.service.sunvote.teacher.TeacherManager;
import com.fh.service.sunvote.testpaper.TestPaperManager;
import com.fh.service.sunvote.testpaperinfo.TestPaperInfoManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/report")
public class ReportController extends BaseController {
	
	@Resource(name="sclassService")
	private SClassManager sclassService;
	
	@Resource(name="studentService")
	private StudentManager studentService;
	
	@Resource(name="testpaperService")
	private TestPaperManager testpaperService;
	
	@Resource(name="studenttestService")
	private StudentTestManager studenttestService;
	
	@Resource(name="testpaperinfoService")
	private TestPaperInfoManager testpaperinfoService;
	
	@Resource(name = "v1Service")
	private V1Manager v1Service;
	
	@Resource(name = "teacherService")
	private TeacherManager teacherService;
	
	@Resource(name="subjectService")
	private SubjectManager subjectService;
	
	

	@RequestMapping(value="/report")
	public ModelAndView report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"班级报表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		pd.put("SCLASS_ID", pd.get("CLASSID"));
		pd.put("ID", pd.get("CLASSID"));
		pd.put("TEST_TYPE", "1");
		String role = pd.getString("ROLE");
		if( role != null && "admin".equals(role)){
			PageData tpd = new PageData();
			tpd.put("ID", getUserID());
			PageData adminInfos = v1Service.getAdminInfo(tpd);
			List<PageData> subjectInfos = new ArrayList<PageData>();
//			for(PageData pad : adminInfos){
//				PageData tmpd = new PageData();
//				Object gradeId = pad.get("GRADE_ID");
//				tmpd.put("SNAME", pad.get("SNAME"));// 学校名称
//				tmpd.put("SCHOOL_ID", pad.get("SCHOOL_ID"));//学校ID
//				tmpd.put("GRADE_ID", pad.get("GRADE_ID"));//年级id
//				tmpd.put("GNAME", pad.get("GNAME"));//年级名称
//				tmpd.put("SUBJECT_ID", pad.get("SUBJECT_ID"));// 科目id
//				tmpd.put("SCNAME", pad.get("SCNAME"));// 科目名称
//				if(gradeId != null && !"".equals(gradeId)){
//				}else{
//					subjectInfos.add(tmpd);
//				}
//			}
			mv.addObject("subjectInfos", subjectInfos);
		}else{
			pd.put("TEACHER_ID", getUserID());
		}
		// 1 查询班级信息
		PageData classPageData = sclassService.findById(pd);
		PageData info = new PageData();
		info.put("CLASS_NAME", classPageData.getString("CLASS_NAME"));
		info.put("CLASS_CODE", classPageData.getString("CLASS_CODE"));
		info.put("CLASS_ID", classPageData.getString("ID"));
		pd.put("CLASS_ID", pd.get("CLASSID"));
		// 2查询班级考试
		pd.put("TEST_TYPE", "1");
		// modify 根據班級查詢班級報表
		List<PageData> reportData = v1Service.classReport(pd);
		List<PageData> testpaperList = new ArrayList();
		List<PageData> studentList = new ArrayList();
		PageData studentPd = null;
		double totalScore = 0 ;
		double getScore = 0 ;
		for(PageData item : reportData){
			
			// 学生列表
			if(studentPd != null && item.get("STUDENT_ID").equals(studentPd.get("STUDENT_ID"))){
				//
				String score = item.getString("SCORE");
				if(!"0".equals(score)){
					studentPd.put(item.get("TEST_ID"), item.get("SCORE"));
				}else{
					studentPd.put(item.get("TEST_ID"), "--");
				}
				String totalScoreStr = item.getString("TOTAL_SCORE");
				if(totalScoreStr != null){
					try{
						totalScore = new BigDecimal(totalScoreStr).add(new BigDecimal(Double.toString(totalScore))).doubleValue();
					}catch(Exception ex){
						logger.info(ex);
					}
				}
				if(score != null){
					try{
						getScore = new BigDecimal(score).add(new BigDecimal(Double.toString(getScore))).doubleValue();
					}catch(Exception ex){
						logger.info(ex);
					}
				}
			}else{
				if(studentPd != null){
					studentPd.put("TOTALSCORE", totalScore);
					studentPd.put("GETSCORE", getScore);
					studentList.add(studentPd);
					totalScore = 0 ;
					getScore = 0 ;
				}
				studentPd = new PageData();
				studentPd.put("STUDENT_ID", item.get("STUDENT_ID"));
				studentPd.put("NAME", item.get("NAME"));
				String score = item.getString("SCORE");
				if(!"0".equals(score)){
					studentPd.put(item.get("TEST_ID"), item.get("SCORE"));
				}else{
					studentPd.put(item.get("TEST_ID"), "--");
				}
				String totalScoreStr = item.getString("TOTAL_SCORE");
				if(totalScoreStr != null){
					try{
						totalScore = new BigDecimal(totalScoreStr).add(new BigDecimal(Double.toString(totalScore))).doubleValue();
					}catch(Exception ex){
						logger.info(ex);
					}
				}
				if(score != null){
					try{
						getScore = new BigDecimal(score).add(new BigDecimal(Double.toString(getScore))).doubleValue();
					}catch(Exception ex){
						logger.info(ex);
					}
				}
				
			}
			PageData clone = new PageData(item);
			// 试卷列表
			if(!contain(testpaperList, clone, "TEST_ID")){
				clone.put("TESTPAPER_ID", clone.get("TEST_ID"));
				clone.put("NAME", clone.get("PAPER_NAME"));
				testpaperList.add(clone);
			}
			
		}
		if(studentPd != null){
			studentPd.put("TOTALSCORE", totalScore);
			studentPd.put("GETSCORE", getScore);
			studentList.add(studentPd);
			totalScore = 0 ;
			getScore = 0 ;
		}
		
		Collections.sort(testpaperList,new Comparator<PageData>(){

			@Override
			public int compare(PageData o1, PageData o2) {
				String o1GetScore = o1.getString("CREATE_DATE");
				String o2GetScore = o2.getString("CREATE_DATE");
				return - o1GetScore.compareToIgnoreCase(o2GetScore);
			}
			
		});
		
		mv.addObject("testpaperList", testpaperList);
		info.put("testsize", testpaperList != null ? testpaperList.size() : 0);
		
		mv.addObject("studentList", studentList);
		info.put("STUDENT_NUM", studentList != null ? studentList.size() : 0);
		mv.addObject("info", info);
		mv.addObject("start_date", pd.get("START_DATE"));
		mv.addObject("end_date", pd.get("END_DATE"));
		mv.addObject("pd", pd);
		if(isChineseLanguageClient()){
			mv.setViewName("sunvote/teacher/teacher_report_1");
		}else{
			mv.setViewName("sunvote/teacher/en_teacher_report_1");
		}
		return mv;
	}
	
	private boolean contain(List<PageData> source, PageData aim,String key){
		for(PageData tp : source){
			if(tp.get(key) != null && tp.get(key).equals(aim.get(key))){
				return true;
			}
		}
		return false;
	}
	
	@RequestMapping(value="/teacher_report")
	public ModelAndView teacher_report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"教师报表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		mv.addObject("start_date", pd.get("START_DATE"));
		mv.addObject("end_date", pd.get("END_DATE"));
		return mv;
	}
	
	@RequestMapping(value="/student_report")
	public ModelAndView student_report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"学生成绩报表");
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = getPageData();
		String url = "report/student_report_data?class_id=" +pd.getString("CLASS_ID");
		if(pd.getString("SUBJECT_ID") != null){
			url += "&SUBJECT_ID=" + pd.getString("SUBJECT_ID");
		}
		mv.addObject("URL",url);
		if(isChineseLanguageClient()){
			mv.setViewName("sunvote/teacher/stduent_report");
		}else{
			mv.setViewName("sunvote/teacher/en_stduent_report");
		}
		mv.addObject("start_date", pd.get("START_DATE"));
		mv.addObject("end_date", pd.get("END_DATE"));
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value = "/student_report_data", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object student_report_data() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"学生报表数据");
		PageData pd = getPageData();
		ResponseGson<PageData> ret = new ResponseGson();
		if ("teacher".equals(getRole())) {
			pd.put("TEACHER_ID", getUserID());
		}
		pd.put("TEST_TYPE", "1");
		List<PageData> dataList = studenttestService.reportClassListData(pd);
		List<PageData> studentList = new ArrayList();
		List<PageData> studentTestList = new ArrayList();
		PageData studentPd = null;
		float getScore = 0f ;
		float allGetScore = 0;
		float maxScore = 0 ;
		for(PageData tmp : dataList){
			if(studentPd != null && tmp.get("ID").equals(studentPd.get("ID"))){
				String getScoreStr = tmp.getString("SCORE");
				float score = 0 ;
				if(getScoreStr != null){
					try{
						score = Float.parseFloat(getScoreStr);
					}catch(Exception ex){
						logger.info(ex);
					}
				}
				getScore += score;
				allGetScore += score;
				tmp.put("NAME", tmp.get("TNAME"));
				studentTestList.add(tmp);
			}else{
				if(studentPd != null){
					if(getScore > maxScore){
						maxScore = getScore ;
					}
					studentPd.put("GETSCORE", getScore);
					studentPd.put("testList", studentTestList);
					studentList.add(studentPd);
				}
				studentPd = new PageData();
				studentTestList = new ArrayList();
				getScore = 0 ;
				String getScoreStr = tmp.getString("SCORE");
				float score = 0 ;
				if(getScoreStr != null){
					try{
						score = Float.parseFloat(getScoreStr);
					}catch(Exception ex){
						logger.info(ex);
					}
				}
				getScore += score;
				allGetScore += score;
				studentPd.put("NAME", tmp.get("NAME"));
				studentPd.put("ID", tmp.get("ID"));
				tmp.put("NAME", tmp.get("TNAME"));
				studentTestList.add(tmp);
				
			}
		}
		if(studentPd != null){
			studentPd.put("GETSCORE", getScore);
			studentPd.put("testList", studentTestList);
			studentList.add(studentPd);
		}
		pd.put("ID", pd.get("CLASS_ID"));
		PageData classPageData = sclassService.findById(pd);
		float totalScore = 0 ;
		float avgScore = 0;
		for(PageData testPaperPageData:studentTestList){
			String totalScoreStr = testPaperPageData.getString("TOTAL_SCORE");
			if(totalScoreStr != null){
				try{
					totalScore += Float.parseFloat(totalScoreStr);
				}catch(Exception ex){
					logger.info(ex);
				}
			}
			String avgScoreStr = testPaperPageData.getString("AVG_SCORE");
			if(avgScoreStr != null){
				try{
					avgScore += Float.parseFloat(avgScoreStr);
				}catch(Exception ex){
					logger.info(ex);
				}
			}
			
		}
		
		classPageData.remove("SCHOOL_ID");
		classPageData.remove("GRADE_ID");
		classPageData.remove("BASESTATION_ID");
		classPageData.put("studentList", studentList);
		classPageData.put("AVG_SCORE", avgScore);
		classPageData.put("TOTAL_SCORE", totalScore);
		classPageData.put("MAX_SCORE", maxScore);
		ret.setData(classPageData);
		
		return ret.toJson();
	}
	
	@RequestMapping(value="/test_report")
	public ModelAndView paper_report() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		
		// 查询班级信息
		pd.put("ID", pd.get("CLASS_ID"));
		PageData classPageData = sclassService.findById(pd);
		
		// 查询测试试卷信息
		pd.put("TESTPAPER_ID", pd.get("TESTID"));
		PageData testpaperPd = testpaperService.findById(pd);
		
		PageData teacherPd = new PageData();
		teacherPd.put("ID", testpaperPd.get("TEACHER_ID"));
		teacherPd = teacherService.findById(teacherPd);
		
		PageData subjectPd = new PageData();
		subjectPd.put("ID", testpaperPd.get("SUBJECT_ID"));
		subjectPd = subjectService.findById(subjectPd);
		
		pd.put("TEST_ID", pd.get("TESTID"));
		List<PageData> detail = testpaperinfoService.reportTestPaperDetail(pd);
		
		List<PageData> studentList = new ArrayList();
//		List<Integer> questionList = new ArrayList<Integer>();
		PageData questionList = new PageData();
		List<PageData> tqList = new ArrayList<PageData>();
		PageData tmp = null;
		float getScore = 0 ;
		for(PageData tpd : detail){
			if(tmp != null && tpd.get("ID").equals(tmp.get("ID"))){
				try{
					getScore += Float.parseFloat(tpd.getString("SCORE"));
				}catch(Exception ex){};
				tqList.add(tpd);
				if(questionList.get(tpd.get("RANK")) != null){
					if("1".equals(tpd.get("RIGHT"))){
						Integer num = (Integer)questionList.get(tpd.get("RANK"));
						questionList.put(tpd.get("RANK"), num+1);
					}
				}else{
					if("1".equals(tpd.get("RIGHT"))){
						questionList.put(tpd.get("RANK"), 1);
					}else{
						questionList.put(tpd.get("RANK"), 0);
					}
				}
			}else{
				if(tmp != null){
					tmp.put("GETSCORE", getScore);
					studentList.add(tmp);
				}
				getScore = 0 ;
				tmp = new PageData();
				tqList = new ArrayList<PageData>();
				tmp.put("NAME", tpd.get("NAME"));
				tmp.put("KEYPAD_ID", tpd.get("KEYPAD_ID"));
				tmp.put("NUMBER", tpd.get("NUMBER"));
				tmp.put("ID", tpd.get("ID"));
				tqList.add(tpd);
				tmp.put("detail", tqList);
				try{
					getScore += Float.parseFloat(tpd.getString("SCORE"));
				}catch(Exception ex){};
				if(questionList.get(tpd.get("RANK")) != null){
					if("1".equals(tpd.get("RIGHT"))){
						Integer num = (Integer)questionList.get(tpd.get("RANK"));
						questionList.put(tpd.get("RANK"), num+1);
					}
				}else{
					if("1".equals(tpd.get("RIGHT"))){
						questionList.put(tpd.get("RANK"), 1);
					}else{
						questionList.put(tpd.get("RANK"), 0);
					}
				}
			}
		}
		if(tmp != null){
			tmp.put("GETSCORE", getScore);
			studentList.add(tmp);
		}
		
		/*// 查询班级学生
		List<PageData> studentList = studentService.listAllClass(pd);
		List<Integer> questionList = new ArrayList<Integer>();
		for(PageData studentPd : studentList){
			
			// 查询答题情况
			studentPd.put("TEST_ID", pd.getString("TESTID"));
			studentPd.put("STUDENT_ID", studentPd.getString("ID"));
			List<PageData> detail = testpaperinfoService.reportPaperDetail(studentPd);
			studentPd.put("detail", detail);
			if(questionList.size() < 1){
				for(int i = 0 ; i < detail.size(); i++){
					questionList.add(0);
				}
			}
			float score = 0 ;
			for(int i = 0 ; i < detail.size(); i++){
				PageData pad = detail.get(i);
				if ("1".equals(pad.getString("RIGHT"))) {
					questionList.set(i, questionList.get(i) + 1);
				}
				String scoreStr = pad.getString("SCORE");
				
				try{
					score += Float.parseFloat(scoreStr);
				}catch(Exception ex){
					ex.printStackTrace();
				}
				
			}
			studentPd.put("GETSCORE", score);
		}*/
	
		
		Collections.sort(studentList,new Comparator<PageData>(){

			@Override
			public int compare(PageData o1, PageData o2) {
				String o1GetScore = o1.getString("GETSCORE");
				String o2GetScore = o2.getString("GETSCORE");
				float o1score = 0 ;
				float o2score = 0 ;
				try{
					o1score = Float.parseFloat(o1GetScore);
				}catch(Exception e){
					o1score = -1 ;
				}
				try{
					o2score = Float.parseFloat(o2GetScore);
				}catch(Exception e){
					o2score = -1 ;
				}
				if(o2score - o1score == 0){
					String n1 =  o1.getString("NUMBER");
					String n2 =  o2.getString("NUMBER");
					if(n1 != null && n2 != null){
						return Integer.parseInt(n1) - Integer.parseInt(n2);
					}
				}
				return  o2score - o1score > 0 ? 1 : -1;
			}
			
		});
		for(int i = 0 ; i < studentList.size(); i++){
			PageData tpd1 = studentList.get(i);
			if(i == 0){
				tpd1.put("RANK_NUM", (i+1));
			}else{
				PageData tpd2 = studentList.get(i-1);
				String o1GetScore = tpd1.getString("GETSCORE");
				String o2GetScore = tpd2.getString("GETSCORE");
				float o1score = 0 ;
				float o2score = 0 ;
				try{
					o1score = Float.parseFloat(o1GetScore);
				}catch(Exception e){
					o1score = -1 ;
				}
				try{
					o2score = Float.parseFloat(o2GetScore);
				}catch(Exception e){
					o2score = -1 ;
				}
				if(o2score - o1score == 0){
					tpd1.put("RANK_NUM",tpd2.get("RANK_NUM"));
				}else{
					tpd1.put("RANK_NUM", (i+1));
				}
			}
		}
		
		classPageData.put("studentNum", studentList.size());
		
		if("teacher".equals(getRole())){
			mv.addObject("display", false);
		}else{
			mv.addObject("display", true);
		}
		
		mv.addObject("classInfo", classPageData);
		mv.addObject("testpaperInfo", testpaperPd);
		mv.addObject("questionInfo", questionList);
		mv.addObject("studentInfo", studentList);
		mv.addObject("teacherPd", teacherPd);
		mv.addObject("subjectPd", subjectPd);
		if(isChineseLanguageClient()){
			mv.setViewName("sunvote/teacher/teacher_report_test");
		}else{
			mv.setViewName("sunvote/teacher/en_teacher_report_test");
		}
		return mv;
	}
	
}
