package com.shop.service.app;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.hibernate.cfg.Configuration;
import org.hibernate.search.FullTextSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CollectionsDAO;
import com.dao.GoodsDAO;
import com.dao.HqlDAO;
import com.dao.ShoppingcatDAO;
import com.dao.UserinfoDAO;
import com.pojo.Address;
import com.pojo.Area;
import com.pojo.City;
import com.pojo.Collections;
import com.pojo.Goods;
import com.pojo.Goodsorderdetail;
import com.pojo.Shoppingcat;
import com.pojo.Userinfo;
import com.util.JsonFilter;

@Service
public class AppGoodsService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private CollectionsDAO collectionsDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private ShoppingcatDAO shoppingcatDAO;

	public String fenye(Userinfo userinfo,int size, int page) {

		String hqlsum = "select count(*) from Goods where gstatus=1 ";
		int sum = (int) hqlDAO.unique(hqlsum);
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page == count)
			page = count;
		String hql = "from Goods where gstatus=1 order by gtime desc";
		List<Goods> goodslist = hqlDAO.pageQuery(hql, size, page);

		
		if (goodslist != null)
			for (Goods goods : goodslist) {
				if (userinfo != null && userinfo.getUsersType() == 1)
					goods.setPrice(goods.getGvipprice());
				else
					goods.setPrice(goods.getGprice());
				//goods.setYoufei(yunfei);
			}

		// --------------------------------------------------------------------
		Map map = new HashMap();
		map.put("count", count);
		map.put("goodslist", goodslist);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj = new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}

	public String goodsdetail(Userinfo userinfo, int id) {
		String hql = "from Goodsimages where goods.gid=?";
		List list = hqlDAO.query(hql, id);
		Goods goods = goodsDAO.findById(id);
		if (userinfo != null && userinfo.getUsersType() == 1)
			goods.setPrice(goods.getGvipprice());
		else
			goods.setPrice(goods.getGprice());

		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		Map map = new HashMap();
		map.put("list", list);
		map.put("goods", goods);
		JSONObject obj = new JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}

	public String getAllCollection(Userinfo userinfo, int page) {
		int id = userinfo.getUsersId();
		String hql = "from Collections where userinfo.usersId=?";
		List<Collections> list = hqlDAO.pageQuery(hql, 8, page, id);
		for (Collections c : list) {
			Goods g = c.getGoods();
			if (userinfo.getUsersType() == 1)
				g.setPrice(g.getGvipprice());
			else
				g.setPrice(g.getGprice());
		}
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONArray.fromObject(list, config).toString();
		return json;
	}

	public boolean deleteCollGoods(int id) {
		Collections collections = collectionsDAO.findById(id);
		if (collections != null) {
			System.out.println(collections.getCoId());
			collectionsDAO.delete(collections);
			return true;
		}
		return false;
	}

	public void addCollection(int userid, int gid) {
		String hql = "from Collections where userinfo.usersId=? and goods.gid=?";
		List list = hqlDAO.findByHQL(hql, userid, gid);
		Userinfo userinfo = userinfoDAO.findById(userid);
		Goods goods = goodsDAO.findById(gid);
		Collections collections = new Collections();
		collections.setUserinfo(userinfo);
		collections.setGoods(goods);
		collections.setCoTime(new Timestamp(System.currentTimeMillis()));
		collectionsDAO.save(collections);
	}

	public String addCat(int userid, int gid, int catnum) {
		Userinfo userinfo = userinfoDAO.findById(userid);
		Goods goods = goodsDAO.findById(gid);
		String hql = "from Shoppingcat where userinfo.usersId=? and goods.gid=?";
		List<Shoppingcat> list = hqlDAO.findByHQL(hql, userid, gid);
		Shoppingcat shoppingcat = new Shoppingcat();
		if (list.size() > 0) {
			shoppingcat = list.get(0);
			int s = shoppingcat.getScatNum();
			shoppingcat.setScatTime(new Timestamp(System.currentTimeMillis()));
			shoppingcat.setScatNum(catnum + s);
			shoppingcatDAO.save(shoppingcat);
			return "1";
		} else {
			shoppingcat.setUserinfo(userinfo);
			shoppingcat.setGoods(goods);
			shoppingcat.setScatTime(new Timestamp(System.currentTimeMillis()));
			shoppingcat.setScatNum(catnum);
			shoppingcatDAO.save(shoppingcat);
			return "2";
		}
	}

	public String findByIdColl(int userid, int gid) {
		String hql = "from Collections where userinfo.usersId=? and goods.gid=?";
		List list = hqlDAO.findByHQL(hql, userid, gid);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONArray.fromObject(list, config).toString();
		return json;
	}

	public void deleteColl(int userid, int gid) {
		String hql = "from Collections where userinfo.usersId=? and goods.gid=?";
		List list = hqlDAO.findByHQL(hql, userid, gid);
		if (list.size() > 0) {
			Collections collections = (Collections) list.get(0);
			collectionsDAO.delete(collections);
		}
	}

	public String catNumber(int userid) {
		String hqlsum = "select count(*) from Shoppingcat where userinfo.usersId=?";
		int sum = (int) hqlDAO.unique(hqlsum, userid);
		Map map = new HashMap();
		map.put("sum", sum);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = com.alibaba.fastjson.JSONObject.toJSONString(map);
		return json;
	}

	public void editZcGoodsNum(int gid, int num, String viewid) {
		System.out.println(num);
		Goods goods = goodsDAO.findById(gid);
		if (goods != null) {
			int thisnum = goods.getGsellnum();
			int thiscollnum = goods.getGcollectionsnum();
			goods.setGcollectionsnum(thiscollnum + num);
			if (viewid == "crowdfunding-order.html") // 众筹页面
			{
				goods.setGsellnum(thisnum + num);
			}
			goodsDAO.save(goods);
		}
	}

	public String getGoodsId(String gname) {
		Goods goods = null;
		List list = goodsDAO.findByGname(gname);
		if (list.size() > 0)
			goods = (Goods) list.get(0);
		return goods.getGid().toString();
	}

	public List<Goodsorderdetail> getAllOrderdetail(int orid) {
		String hql = "from Goodsorderdetail where goodsorders.orId=?";
		List list = hqlDAO.query(hql, orid);
		return list;
	}

	public void createIndex() throws InterruptedException, IOException {
		String p = "hibernate.search.default.indexBase";
		String str = new Configuration().configure().getProperty(p);

		// 判断是否有ko
		File file = new File(str, "ko");
		if (file.exists()) {
			System.out.println("已索引");
			return;
		} else {
			file.createNewFile();
		}

		FullTextSession fullTextSession = hqlDAO.getFullTextSession();
		fullTextSession.createIndexer(Goods.class).startAndWait();

	}

}
