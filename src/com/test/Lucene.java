package com.test;

import com.service.wap.WapSearchService;

public class Lucene {

	public static void main(String[] args) throws Exception{
		WapSearchService searchService = new WapSearchService();
		String json = searchService.search("中通");
		System.out.println(json);
	}
}
