package com.fh.entity;

import com.fh.util.Const;
import com.fh.util.PageData;
import com.fh.util.Tools;

public class Page {
	
	private int showCount; //每页显示记录数
	private int totalPage;		//总页数
	private int totalResult;	//总记录数
	private int currentPage;	//当前页
	private int currentResult;	//当前记录起始索引
	private boolean entityOrField;	//true:需要分页的地方，传入的参数就是Page实体；false:需要分页的地方，传入的参数所代表的实体拥有Page属性
	private String pageStr;		//最终页面显示的底部翻页导航，详细见：getPageStr();
	private PageData pd = new PageData();
	

	
	public Page(){
		try {
			this.showCount = Integer.parseInt(Tools.readTxtFile(Const.PAGE));
		} catch (Exception e) {
			this.showCount = 15;
		}
	}
	
	public int getTotalPage() {
		if(totalResult%showCount==0)
			totalPage = totalResult/showCount;
		else
			totalPage = totalResult/showCount+1;
		return totalPage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getTotalResult() {
		return totalResult;
	}
	
	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}
	
	public int getCurrentPage() {
		if(currentPage<=0)
			currentPage = 1;
		if(currentPage>getTotalPage())
			currentPage = getTotalPage();
		return currentPage;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	private String total = "共" ;
	private String articles = "条";
	private String frist = "首页" ;
	private String previous = "上一页";
	private String next = "下一页";
	private String tail = "尾页" ;
	private String jump = "跳转" ;
	private String pageNumber = "页码";
	private String displayNumber = "显示条数" ;
	public void setLangIsChina(boolean is){
		if(is){
			total = "共" ;
			articles = "条";
			frist = "首页" ;
			previous = "上一页";
			next = "下一页";
			tail = "尾页" ;
			jump = "跳转" ;
			pageNumber = "页码";
			displayNumber = "显示条数" ;
		}else{
			total = "" ;
			articles = " articles";
			frist = "Frist" ;
			previous = "Previous";
			next = "Next";
			tail = "Last" ;
			jump = "Goto" ;
			pageNumber = "PageNo.";
			displayNumber = "Display Number" ;
		}
	}
	//拼接分页 页面及JS函数
	public String getPageStr() {
		StringBuffer sb = new StringBuffer();
		if(totalResult>0){
			sb.append("	<ul class=\"pagination pull-right no-margin\">\n");
			if(currentPage==1){
				sb.append("	<li><a>" + total +totalResult+articles + "</a></li>\n");
				sb.append("	<li><span style='padding:0'><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:80px;text-align:center;float:left\" placeholder=\"" + pageNumber + "\"/></span></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">" + jump + "</a></li>\n");
				sb.append("	<li><a>" + frist + "</a></li>\n");
				sb.append("	<li><a>" + previous + "</a></li>\n");
			}else{
				sb.append("	<li><a>"+ total +"<font color=red>"+totalResult+"</font>" + articles + "</a></li>\n");
				sb.append("	<li><input type=\"number\" value=\"\" id=\"toGoPage\" style=\"width:80px;text-align:center;float:left\" placeholder=\"" + pageNumber + "\"/></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"toTZ();\"  class=\"btn btn-mini btn-success\">" + jump + "</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage(1)\">" + frist + "</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(currentPage-1)+")\">" + previous + "</a></li>\n");
			}
			int showTag = 5;//分页标签显示数量
			int startTag = 1;
			if(currentPage>showTag){
				startTag = currentPage-1;
			}
			int endTag = startTag+showTag-1;
			for(int i=startTag; i<=totalPage && i<=endTag; i++){
				if(currentPage==i)
					sb.append("<li class=\"active\"><a><font color='white'>"+i+"</font></a></li>\n");
				else
					sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+i+")\">"+i+"</a></li>\n");
			}
			if(currentPage==totalPage){
				sb.append("	<li><a>" + next + "</a></li>\n");
				sb.append("	<li><a>" + tail + "</a></li>\n");
			}else{
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+(currentPage+1)+")\">" + next + "</a></li>\n");
				sb.append("	<li style=\"cursor:pointer;\"><a onclick=\"nextPage("+totalPage+")\">" + tail + "</a></li>\n");
			}
			sb.append("	<li><a>" + total +totalResult+articles + "</a></li>\n");
			sb.append("	<li><span class=\"enter\"><select title='" + displayNumber + "' style=\"width:55px;float:left;height:32px;margin-top:1px;border:0\" onchange=\"changeCount(this.value)\">\n");
			sb.append("	<option value='"+showCount+"'>"+showCount+"</option>\n");
			sb.append("	<option value='10'>10</option>\n");
			sb.append("	<option value='20'>20</option>\n");
			sb.append("	<option value='30'>30</option>\n");
			sb.append("	<option value='40'>40</option>\n");
			sb.append("	<option value='50'>50</option>\n");
			sb.append("	<option value='60'>60</option>\n");
			sb.append("	<option value='70'>70</option>\n");
			sb.append("	<option value='80'>80</option>\n");
			sb.append("	<option value='90'>90</option>\n");
			sb.append("	<option value='99'>99</option>\n");
			sb.append("	</select></span>\n");
			sb.append("	</li>\n");
			
			sb.append("</ul>\n");
			sb.append("<script type=\"text/javascript\">\n");
			
			//换页函数
			sb.append("function nextPage(page){");
			sb.append("\n if(top && top.jzts)\n{\n top.jzts();\n}\n");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"showCount":"page.showCount")+"="+showCount+"\";\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + page + \"&" +(entityOrField?"showCount":"page.showCount")+"="+showCount+"\";\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//调整每页显示条数
			sb.append("function changeCount(value){");
			sb.append(" \n if(top && top.jzts)\n{\n top.jzts();\n}\n");
			sb.append("	if(true && document.forms[0]){\n");
			sb.append("		var url = document.forms[0].getAttribute(\"action\");\n");
			sb.append("		if(url.indexOf('?')>-1){url += \"&"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"1&" +(entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.forms[0].action = url;\n");
			sb.append("		document.forms[0].submit();\n");
			sb.append("	}else{\n");
			sb.append("		var url = document.location+'';\n");
			sb.append("		if(url.indexOf('?')>-1){\n");
			sb.append("			if(url.indexOf('currentPage')>-1){\n");
			sb.append("				var reg = /currentPage=\\d*/g;\n");
			sb.append("				url = url.replace(reg,'currentPage=');\n");
			sb.append("			}else{\n");
			sb.append("				url += \"1&"+(entityOrField?"currentPage":"page.currentPage")+"=\";\n");
			sb.append("			}\n");
			sb.append("		}else{url += \"?"+(entityOrField?"currentPage":"page.currentPage")+"=\";}\n");
			sb.append("		url = url + \"&" +(entityOrField?"showCount":"page.showCount")+"=\"+value;\n");
			sb.append("		document.location = url;\n");
			sb.append("	}\n");
			sb.append("}\n");
			
			//跳转函数 
			sb.append("function toTZ(){");
			sb.append("var toPaggeVlue = document.getElementById(\"toGoPage\").value;");
			sb.append("if(toPaggeVlue == ''){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("if(isNaN(Number(toPaggeVlue))){document.getElementById(\"toGoPage\").value=1;return;}");
			sb.append("nextPage(toPaggeVlue);");
			sb.append("}\n");
			sb.append("</script>\n");
		}
		pageStr = sb.toString();
		return pageStr;
	}
	
	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
	
	public int getShowCount() {
		return showCount;
	}
	
	public void setShowCount(int showCount) {
		
		this.showCount = showCount;
	}
	
	public int getCurrentResult() {
		currentResult = (getCurrentPage()-1)*getShowCount();
		if(currentResult<0)
			currentResult = 0;
		return currentResult;
	}
	
	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}
	
	public boolean isEntityOrField() {
		return entityOrField;
	}
	
	public void setEntityOrField(boolean entityOrField) {
		this.entityOrField = entityOrField;
	}
	
	public PageData getPd() {
		return pd;
	}

	public void setPd(PageData pd) {
		this.pd = pd;
	}
	
	
}
