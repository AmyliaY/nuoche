package com.service.wap;

/**
 * 全恒
 */
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
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.aspectj.apache.bcel.classfile.Field;
import org.hibernate.Session;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.annotations.Index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.pojo.Business;
import com.pojo.ServiceType;
import com.util.HibernateSessionFactory;
import com.util.JsonFilter;

@Service
public class WapSearchService {
	
	@Autowired
	private HqlDAO hqlDAO;
	

	
	
	//手动索引
	public void createIndex() throws IOException, InterruptedException
	{
		Session session=hqlDAO.getHibernateSession();
		FullTextSession fullTextSession=Search.getFullTextSession(session);
		fullTextSession.createIndexer(Business.class).startAndWait();
		fullTextSession.createIndexer(com.pojo.Service.class).startAndWait();
		fullTextSession.createIndexer(ServiceType.class).startAndWait();
		
		fullTextSession.close();
		System.out.println("搞定v!!!!!!");
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
	public String search(String keywords/*, int page, int size*/) throws ParseException, IOException, InterruptedException {
		//this.createIndex();
		File f = new File("ok.ini");
		if (f.exists()==false)
		{
			f.createNewFile();
			createIndex();
		}
		
		if(keywords !=null && keywords.length()>0){
			Session session=hqlDAO.getHibernateSession();
			FullTextSession fullTextSession=Search.getFullTextSession(session); //包装session
			QueryParser parser=new QueryParser(Version.LUCENE_CURRENT, "shopname", new PaodingAnalyzer());
			QueryParser parser2=new QueryParser(Version.LUCENE_CURRENT, "shopDesc", new PaodingAnalyzer());
			QueryParser parser3=new QueryParser(Version.LUCENE_CURRENT, "shoptype", new PaodingAnalyzer());
			QueryParser parser4=new QueryParser(Version.LUCENE_CURRENT, "services.serviceType.name", new PaodingAnalyzer());
			QueryParser parser5=new QueryParser(Version.LUCENE_CURRENT, "services.title", new PaodingAnalyzer());
			QueryParser parser6=new QueryParser(Version.LUCENE_CURRENT, "services.serviceDesc", new PaodingAnalyzer());
			
			//Term term=new Term("gname", keywords);
			//Query query=new TermQuery(term);
			BooleanQuery bq=new BooleanQuery();
			bq.add(parser.parse(keywords), Occur.SHOULD);
			bq.add(parser2.parse(keywords), Occur.SHOULD);
			bq.add(parser3.parse(keywords), Occur.SHOULD);
			bq.add(parser4.parse(keywords), Occur.SHOULD);
			bq.add(parser5.parse(keywords), Occur.SHOULD);
			bq.add(parser6.parse(keywords), Occur.SHOULD);
			
			
			
			FullTextQuery fullTextQuery=fullTextSession.createFullTextQuery(bq, Business.class);
			Sort sort = new Sort(new SortField("status",  SortField.STRING, true));
			fullTextQuery.setSort(sort);
			/*int sum=fullTextQuery.getResultSize();
			//System.out.println("总条数："+sum);
			int count=sum%size==0?sum/size:sum/size+1;
			if(page<1) page=1;
			if(page>count) page=count;
			if(sum>0)
			fullTextQuery.setFirstResult((page-1)*size).setMaxResults(size);*/
			
			List<Business> list=fullTextQuery.list();
			//System.out.println(list.size());
			Map map=new HashMap();
			/*map.put("count", count);*/
			map.put("businesslist", list);
			JsonConfig config=new JsonConfig();
			JsonFilter.ignoredSet(config);
			JSONObject obj=new JSONObject();
			obj.putAll(map,config);
			String json=obj.toString();
			System.out.println(json);
			System.out.println("list："+list.size());
			return json;
		}else{
			return null;
		}
		
	}

}
