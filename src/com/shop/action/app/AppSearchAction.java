package com.shop.action.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.lucene.queryParser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.app.AppSearchService;

@Controller
@RequestMapping("/appsearch.do")
public class AppSearchAction {
	@Autowired
	private AppSearchService appSearchService;
	@Autowired
	private HttpServletRequest request;
	@ResponseBody
	@RequestMapping(params="p=search")
	public String search() throws ParseException, IOException, InterruptedException
	{
		int page=Integer.parseInt(request.getParameter("page"));
		int size=Integer.parseInt(request.getParameter("size"));
		
		String keywords=request.getParameter("keyword");
		String json=appSearchService.search(keywords,page,size);
		return json;
	}
}
