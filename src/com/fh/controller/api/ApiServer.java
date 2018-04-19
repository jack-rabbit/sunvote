package com.fh.controller.api;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.sunvote.basestation.BasestationManager;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.google.gson.Gson;

@Controller
@RequestMapping(value="/api")
public class ApiServer extends BaseController {

	@Resource(name="schoolService")
	private SchoolManager schoolService;
	
	@Resource(name="basestationService")
	private BasestationManager basestationService;
	
	
	@RequestMapping(value="/school" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object school() throws Exception{
		PageData pd = this.getPageData();
		String id = pd.getString("id");
		if(id != null && !"".equals(id)){
			pd.put("SCHOOL_ID", pd.getString("id"));
			PageData ret = schoolService.findById(pd);
			Gson gson = new Gson();
			return gson.toJson(ret);
		}else{
			List<PageData> ret = schoolService.listAll(pd);
			Gson gson = new Gson();
			return gson.toJson(ret);
		}
		
	}
	
	@RequestMapping(value="/basestation" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object basestation() throws Exception{
		PageData pd = this.getPageData();
		String id = pd.getString("id");
		if(id != null && !"".equals(id)){
			pd.put("BASESTATION_ID", pd.getString("id"));
			PageData ret = basestationService.findById(pd);
			Gson gson = new Gson();
			return gson.toJson(ret);
		}else{
			List<PageData> ret = basestationService.listAll(pd);
			Gson gson = new Gson();
			return gson.toJson(ret);
		}
		
	}
}
