package com.fh.controller.base;


import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fh.entity.Page;
import com.fh.entity.system.User;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.Logger;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

/**
 * 修改时间：2015、12、11
 */
public class BaseController {
	
	protected Logger logger = Logger.getLogger(this.getClass());

	private static final long serialVersionUID = 6357869213649815390L;
	
	/** new PageData对象
	 * @return
	 */
	public PageData getPageData(){
		return new PageData(this.getRequest());
	}
	
	/**得到ModelAndView
	 * @return
	 */
	public ModelAndView getModelAndView(){
		return new ModelAndView();
	}
	
	/**得到request对象
	 * @return
	 */
	public HttpServletRequest getRequest() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request;
	}

	/**得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		return UuidUtil.get32UUID();
	}
	
	/**得到分页列表的信息
	 * @return
	 */
	public Page getPage(){
		return new Page();
	}
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
	
	
	public String getUsername(){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		if(user != null){
			return user.getUSERNAME();
		}
		return "ERROR";
	}
	
	public String getUserID(){
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		if(user != null){
			return user.getUSER_ID();
		}
		return "ERROR";
	}
	
	
	public String getSchoolID(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.SCHOOL_ID);
		return schoolName;
	}
	public String getSchoolName(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.SCHOOL_NAME);
		return schoolName;
	}
	public String getGradeID(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.GRADE_ID);
		return schoolName;
	}
	public String getGradeName(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.GRADE_NAME);
		return schoolName;
	}
	public String getSubjectId(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.SUBJECT_ID);
		return schoolName;
	}
	public String getSubjectName(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.SUBJECT_NAME);
		return schoolName;
	}
	public String getClassId(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.CLASS_ID);
		return schoolName;
	}
	public String getClassName(){
		Session session = Jurisdiction.getSession();
		String schoolName = (String)session.getAttribute(getUsername() + Const.CLASS_NAME);
		return schoolName;
	}
	
}
