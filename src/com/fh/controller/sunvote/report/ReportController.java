package com.fh.controller.sunvote.report;

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
			List<PageData> adminInfos = v1Service.getAdminInfo(tpd);
			List<PageData> subjectInfos = new ArrayList<PageData>();
			for(PageData pad : adminInfos){
				PageData tmpd = new PageData();
				Object gradeId = pad.get("GRADE_ID");
				tmpd.put("SNAME", pad.get("SNAME"));// 学校名称
				tmpd.put("SCHOOL_ID", pad.get("SCHOOL_ID"));//学校ID
				tmpd.put("GRADE_ID", pad.get("GRADE_ID"));//年级id
				tmpd.put("GNAME", pad.get("GNAME"));//年级名称
				tmpd.put("SUBJECT_ID", pad.get("SUBJECT_ID"));// 科目id
				tmpd.put("SCNAME", pad.get("SCNAME"));// 科目名称
				if(gradeId != null && !"".equals(gradeId)){
				}else{
					subjectInfos.add(tmpd);
				}
			}
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
		List<PageData> studentList = studentService.listAllClass(pd);
		
		
		
		// 2查询班级考试
		pd.put("TEST_TYPE", "1");
		List<PageData> testpaperList = testpaperService.listAll(pd);
		mv.addObject("testpaperList", testpaperList);
		info.put("testsize", testpaperList != null ? testpaperList.size() : 0);
		// 查询学生名单及人数
		if(studentList != null && studentList.size() > 0){
			for(PageData studentPageData : studentList){
				studentPageData.put("STUDENT_ID", studentPageData.getString("ID"));
				List<PageData> studentTestList = studenttestService.listAll(studentPageData);
				for(PageData studentTestPageData :studentTestList){
					String score = studentTestPageData.getString("SCORE");
					if(!"0".equals(score)){
						studentPageData.put(studentTestPageData.getString("TEST_ID"), studentTestPageData.getString("SCORE"));
					}else{
						studentPageData.put(studentTestPageData.getString("TEST_ID"), "--");
					}
				}
				int totalScore = 0 ;
				int getScore = 0 ;
				for(PageData testPaperPageData:testpaperList){
					String totalScoreStr = testPaperPageData.getString("TOTAL_SCORE");
					if(totalScoreStr != null){
						try{
							totalScore += Integer.parseInt(totalScoreStr);
						}catch(Exception ex){
							logger.info(ex);
						}
					}
					String getScoreStr = studentPageData.getString(testPaperPageData.getString("TESTPAPER_ID"));
					if(getScoreStr != null){
						try{
							getScore += Integer.parseInt(getScoreStr);
						}catch(Exception ex){
							logger.info(ex);
						}
					}
				}
				studentPageData.put("TOTALSCORE", totalScore);
				studentPageData.put("GETSCORE", getScore);
				
			}
		}
		// 课程平均得分率
		// 课程总分
		mv.addObject("studentList", studentList);
		info.put("STUDENT_NUM", studentList != null ? studentList.size() : 0);
		mv.addObject("info", info);
		mv.addObject("start_date", pd.get("START_DATE"));
		mv.addObject("end_date", pd.get("END_DATE"));
		mv.addObject("pd", pd);
		mv.setViewName("sunvote/teacher/teacher_report_1");
		return mv;
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
		mv.setViewName("sunvote/teacher/stduent_report");
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
//		pd.put("CLASS_ID", pd.get("CLASSID"));
		List<PageData> studentList = studentService.listAllClass(pd);
		if ("teacher".equals(getRole())) {
			pd.put("TEACHER_ID", getUserID());
		}
		List<PageData> testpaperList = testpaperService.listAll(pd);
		pd.put("ID", pd.get("CLASS_ID"));
		PageData classPageData = sclassService.findById(pd);
		float totalScore = 0 ;
		float avgScore = 0;
		for(PageData testPaperPageData:testpaperList){
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
		float allGetScore = 0;
		float maxScore = 0 ;
		// 查询学生名单及人数
		if(studentList != null && studentList.size() > 0){
			for(PageData studentPageData : studentList){
				PageData search = new PageData();
				search.put("STUDENT_ID", studentPageData.getString("ID"));
				if(pd.containsKey("START_DATE")){
					search.put("START_DATE", pd.getString("START_DATE"));
				}
				if(pd.containsKey("END_DATE")){
					search.put("END_DATE", pd.getString("END_DATE"));
				}
				if("teacher".equals(getRole())){
					search.put("TEACHER_ID", getUserID());
				}
				if(pd.containsKey("SUBJECT_ID")){
					search.put("SUBJECT_ID", pd.getString("SUBJECT_ID"));
				}
				List<PageData> studentTestList = studenttestService.reportListData(search);
				studentPageData.put("testList", studentTestList);
				
				float getScore = 0 ;
				for(PageData studentTestPageData:studentTestList){
					String getScoreStr = studentTestPageData.getString("SCORE");
					if(getScoreStr != null){
						try{
							getScore += Float.parseFloat(getScoreStr);
						}catch(Exception ex){
							logger.info(ex);
						}
					}
					
					studentTestPageData.getString("TEST_ID");
					
				}
//				studentPageData.put("TOTALSCORE", totalScore);
				studentPageData.put("GETSCORE", getScore);
				studentPageData.remove("GROUPID");
				studentPageData.remove("REMARK");
				studentPageData.remove("PARENT_PHONE");
				studentPageData.remove("PARENT_NAME");
				studentPageData.remove("NUMBER");
				studentPageData.remove("SIGN_NO");
				studentPageData.remove("KEYPAD_ID");
				studentPageData.remove("SNO");
				studentPageData.remove("SEX");
				
				allGetScore += getScore;
				if(getScore > maxScore){
					maxScore = getScore ;
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
		
		// 查询班级学生
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
		}
	
		
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
						return n1.compareToIgnoreCase(n2);
					}
				}
				return  o2score - o1score > 0 ? 1 : -1;
			}
			
		});
		
		classPageData.put("studentNum", studentList.size());
		mv.addObject("classInfo", classPageData);
		mv.addObject("testpaperInfo", testpaperPd);
		mv.addObject("questionInfo", questionList);
		mv.addObject("studentInfo", studentList);
		
		mv.setViewName("sunvote/teacher/teacher_report_test");
		return mv;
	}
	
}
