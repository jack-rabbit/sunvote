package com.fh.controller.sunvote.report;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.api.ResponseGson;
import com.fh.controller.base.BaseController;
import com.fh.service.sunvote.sclass.SClassManager;
import com.fh.service.sunvote.student.StudentManager;
import com.fh.service.sunvote.studenttest.StudentTestManager;
import com.fh.service.sunvote.testpaper.TestPaperManager;
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
	
	

	@RequestMapping(value="/report")
	public ModelAndView report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"班级报表");
		ModelAndView mv = this.getModelAndView();
		PageData pd = getPageData();
		pd.put("SCLASS_ID", pd.get("CLASSID"));
		pd.put("ID", pd.get("CLASSID"));
		// 1 查询班级信息
		PageData classPageData = sclassService.findById(pd);
		PageData info = new PageData();
		info.put("CLASS_NAME", classPageData.getString("CLASS_NAME"));
		info.put("CLASS_CODE", classPageData.getString("CLASS_CODE"));
		info.put("CLASS_ID", classPageData.getString("ID"));
		pd.put("CLASS_ID", pd.get("CLASSID"));
		List<PageData> studentList = studentService.listAllClass(pd);
		// 2查询班级考试
		List<PageData> testpaperList = testpaperService.listAll(pd);
		mv.addObject("testpaperList", testpaperList);
		info.put("testsize", testpaperList != null ? testpaperList.size() : 0);
		// 查询学生名单及人数
		if(studentList != null && studentList.size() > 0){
			for(PageData studentPageData : studentList){
				studentPageData.put("STUDENT_ID", studentPageData.getString("ID"));
				List<PageData> studentTestList = studenttestService.listAll(studentPageData);
				for(PageData studentTestPageData :studentTestList){
					studentPageData.put(studentTestPageData.getString("TEST_ID"), studentTestPageData.getString("SCORE"));
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
		mv.setViewName("sunvote/teacher/teacher_report_1");
		return mv;
	}
	
	@RequestMapping(value="/teacher_report")
	public ModelAndView teacher_report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"教师报表");
		ModelAndView mv = this.getModelAndView();
		return mv;
	}
	
	@RequestMapping(value="/student_report")
	public ModelAndView student_report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"学生成绩报表");
		ModelAndView mv = this.getModelAndView();
		
		PageData pd = getPageData();
		pd.put("CLASS_ID", pd.get("CLASSID"));
		List<PageData> studentList = studentService.listAllClass(pd);
		
		mv.addObject("studentList", studentList);
		mv.setViewName("");
		return mv;
	}
	
	@RequestMapping(value = "/student_report_data", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object student_report_data() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"学生报表数据");
		PageData pd = getPageData();
		ResponseGson<List<PageData>> ret = new ResponseGson();
		pd.put("CLASS_ID", pd.get("CLASSID"));
		List<PageData> studentList = studentService.listAllClass(pd);
		List<PageData> testpaperList = testpaperService.listAll(pd);
		
		int totalScore = 0 ;
		for(PageData testPaperPageData:testpaperList){
			String totalScoreStr = testPaperPageData.getString("TOTAL_SCORE");
			if(totalScoreStr != null){
				try{
					totalScore += Integer.parseInt(totalScoreStr);
				}catch(Exception ex){
					logger.info(ex);
				}
			}
			
		}
		int allGetScore = 0;
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
				List<PageData> studentTestList = studenttestService.reportListData(search);
				studentPageData.put("testList", studentTestList);
				
				int getScore = 0 ;
				for(PageData studentTestPageData:studentTestList){
					String getScoreStr = studentTestPageData.getString("SCORE");
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
				studentPageData.remove("GROUPID");
				studentPageData.remove("REMARK");
				studentPageData.remove("PARENT_PHONE");
				studentPageData.remove("PARENT_NAME");
				studentPageData.remove("NUMBER");
				studentPageData.remove("SIGN_NO");
				studentPageData.remove("KEYPAD_ID");
				studentPageData.remove("SNO");
				
				allGetScore += getScore;
				
			}
		}
		ret.setData(studentList);
		
		return ret.toJson();
	}
	
	@RequestMapping(value="/test_report")
	public ModelAndView paper_report() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"测试试卷报表");
		ModelAndView mv = this.getModelAndView();
		return mv;
	}
	
}
