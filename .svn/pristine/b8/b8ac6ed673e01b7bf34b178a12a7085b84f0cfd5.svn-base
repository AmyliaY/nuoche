package com.action.wap;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.lucene.queryParser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.service.wap.WapSearchService;

/**
 * 
 * @author 
 *
 */

@Controller
@RequestMapping("/searchbusiness.do")
public class WapSearchAction {
	@Autowired
	private WapSearchService wxSearchService;
	@Autowired
	private HttpServletRequest request;
	
	@ResponseBody
	@RequestMapping(params="p=searchbusiness")
	public String search() throws ParseException, IOException, InterruptedException
	{
		/*int page=Integer.parseInt(request.getParameter("page"));
		int size=Integer.parseInt(request.getParameter("size"));*/
		
		
		String keyword=request.getParameter("keyword");
		String json=wxSearchService.search(keyword/*,page,size*/);
		return json;
	}
}
