package com.shop.service.app;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.paoding.analysis.analyzer.PaodingAnalyzer;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Goods;
import com.util.JsonFilter;

@Service
public class AppSearchService {
	
	@Autowired
	private HqlDAO hqlDAO;
	

	
	
	//手动索引
	public void createIndex() throws IOException, InterruptedException
	{
		Session session=hqlDAO.getHibernateSession();
		FullTextSession fullTextSession=Search.getFullTextSession(session);
		fullTextSession.createIndexer(Goods.class).startAndWait();
		
		fullTextSession.close();
		/**
		List<Goods> list=session.createQuery("from Goods").list();
		for (Goods goods : list) {
			session.getTransaction().begin();
			Directory directory=FSDirectory.open(new File("c:/index"));
			Analyzer analyzer=new PaodingAnalyzer();
			IndexWriter indexWriter=new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.LIMITED);
			Document document=new Document();
			//document.add(new org.apache.lucene.document.Field("gname", goods.getGname(),Store.YES,Index.UN_TOKENIZED);
			fullTextSession.index(goods);
			session.getTransaction().commit();
		}
		**/
		System.out.println("create index");
	}
	/**
	 * 简介 jianjie
	 * 品牌 gpinpai不可分
	 * 详情  gdetail
	 * 商品名称 gname
	 * 二级商品名称 gttName 
	 * 一级商品名称 gtName
	 * @param keywords
	 * @param page
	 * @param size
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 * @throws InterruptedException
	 */
	public String search(String keywords, int page, int size) throws ParseException, IOException, InterruptedException {
		//this.createIndex();
		File f = new File("ok.ini");
		if (f.exists()==false)
		{
			f.createNewFile();
			createIndex();
		}
		
		Session session=hqlDAO.getHibernateSession();
		FullTextSession fullTextSession=Search.getFullTextSession(session); //包装session
		QueryParser parser=new QueryParser(Version.LUCENE_CURRENT, "gname", new PaodingAnalyzer());
		QueryParser parser2=new QueryParser(Version.LUCENE_CURRENT, "jianjie", new PaodingAnalyzer());
		QueryParser parser3=new QueryParser(Version.LUCENE_CURRENT, "gpinpai", new PaodingAnalyzer());
		QueryParser parser4=new QueryParser(Version.LUCENE_CURRENT, "gdetail", new PaodingAnalyzer());
		QueryParser parser5=new QueryParser(Version.LUCENE_CURRENT, "goodstwotype.gttName", new PaodingAnalyzer());
		QueryParser parser6=new QueryParser(Version.LUCENE_CURRENT, "goodstwotype.goodsonetype.gtName", new PaodingAnalyzer());
		
		//Term term=new Term("gname", keywords);
		//Query query=new TermQuery(term);
		BooleanQuery bq=new BooleanQuery();
		bq.add(parser.parse(keywords), Occur.SHOULD);
		bq.add(parser2.parse(keywords), Occur.SHOULD);
		bq.add(parser3.parse(keywords), Occur.SHOULD);
		bq.add(parser4.parse(keywords), Occur.SHOULD);
		bq.add(parser5.parse(keywords), Occur.SHOULD);
		bq.add(parser6.parse(keywords), Occur.SHOULD);
		
		
		
		FullTextQuery fullTextQuery=fullTextSession.createFullTextQuery(bq, Goods.class);
		Sort sort = new Sort(new SortField("gstatus",  SortField.STRING, true));
		fullTextQuery.setSort(sort);
		int sum=fullTextQuery.getResultSize();
		//System.out.println("总条数："+sum);
		int count=sum%size==0?sum/size:sum/size+1;
		if(page<1) page=1;
		if(page>count) page=count;
		if(sum>0)
		fullTextQuery.setFirstResult((page-1)*size).setMaxResults(size);
		
		List<Goods> list=fullTextQuery.list();
		
		Map map=new HashMap();
		map.put("count", count);
		map.put("goodslist", list);
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		JSONObject obj=new JSONObject();
		obj.putAll(map,config);
		String json=obj.toString();
		//System.out.println("list："+list.size());
		return json;
	}

}
