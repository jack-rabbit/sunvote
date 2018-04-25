package com.fh.controller.api;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.sunvote.basestation.BasestationManager;
import com.fh.service.sunvote.keypad.KeypadManager;
import com.fh.service.sunvote.school.SchoolManager;
import com.fh.util.PageData;

@Controller
@RequestMapping(value="/api")
public class ApiServer extends BaseController {

	@Resource(name="schoolService")
	private SchoolManager schoolService;
	
	@Resource(name="basestationService")
	private BasestationManager basestationService;
	
	@Resource(name="keypadService")
	private KeypadManager keypadService;
	
	
	@RequestMapping(value="/*" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object Default() throws Exception{
		ResponseGson<Void> respone = new ResponseGson();
		respone.setPathError();
		return respone.toJson();
	}
	
	@RequestMapping(value="/school" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolDefault() throws Exception{
		return schoolList();
	}
	
	
	@RequestMapping(value="/school/list" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolList() throws Exception{
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			PageData ret = schoolService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}else{
			List<PageData> ret = schoolService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
	}
	@RequestMapping(value="/school/add" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolAdd() throws Exception{
		PageData pd = this.getPageData();
		ResponseGson<Integer> res = new ResponseGson();
		try {
			if (pd.get("NAME") != null) {
				Integer id = schoolService.save(pd);
				res.setData(id);
			} else {
				res.setDataError();
			}
		}catch(Exception e){
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/school/delete" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolDelete() throws Exception{
		ResponseGson<PageData> res = new ResponseGson();
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try {
				schoolService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/school/update" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object schoolUpdate() throws Exception{
		ResponseGson<PageData> res = new ResponseGson();
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try {
				schoolService.edit(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	
	@RequestMapping(value="/basestation/list" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object basestation() throws Exception{
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			pd.put("BASESTATION_ID", pd.getString("id"));
			PageData ret = basestationService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}else{
			List<PageData> ret = basestationService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
		
	}
	
	@RequestMapping(value="/basestation/add" ,produces="application/json;charset=UTF-8")
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
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/basestation/delete" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object basestationDelete() throws Exception{
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try {
				basestationService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/basestation/update" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object basestationUpdate() throws Exception{
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try {
				basestationService.edit(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/keypad/list" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object keypad() throws Exception{
		PageData pd = this.getPageData();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			PageData ret = keypadService.findById(pd);
			ResponseGson<PageData> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}else{
			List<PageData> ret = keypadService.listAll(pd);
			ResponseGson<List<PageData>> res = new ResponseGson();
			res.setData(ret);
			return res.toJson();
		}
	}
	
	@RequestMapping(value="/keypad/add" ,produces="application/json;charset=UTF-8")
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
	
	@RequestMapping(value="/keypad/delete" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadDelete() throws Exception{
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try {
				keypadService.delete(pd);
			} catch (Exception e) {
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
	@RequestMapping(value="/keypad/update" ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public Object keypadUpdate() throws Exception{
		PageData pd = this.getPageData();
		ResponseGson<PageData> res = new ResponseGson();
		String id = pd.getString("ID");
		if(id != null && !"".equals(id)){
			try{
				keypadService.edit(pd);
			}catch(Exception ex){
				res.setDataError();
			}
		}else{
			res.setDataError();
		}
		return res.toJson();
	}
	
}
