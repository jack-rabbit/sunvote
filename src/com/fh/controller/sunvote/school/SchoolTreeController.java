package com.fh.controller.sunvote.school;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/schooltree")
public class SchoolTreeController extends BaseController {

	
	@Resource(name="schoolService")
	private SchoolManager schoolService;
	
	@RequestMapping(value="/tree")
	public ModelAndView save() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		List<PageData> list = schoolService.listAll(pd);
		
		// 学校
		for(PageData schoolPageData : list){
			// 年级
			
			// 班级
			
			//
			
		}
		
		mv.setViewName("sunvote/school/school_main");
		return mv;
	}
	
	
}
