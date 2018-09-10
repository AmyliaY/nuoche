package com.service.weixin;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BaoxianBaodanDAO;
import com.dao.BaoxianBaodanGonshiDAO;
import com.dao.BaoxianGonshiDAO;
import com.dao.HqlDAO;
import com.dao.WeixinUserDAO;
import com.pojo.BaoxianBaodan;
import com.pojo.BaoxianBaodanGonshi;
import com.pojo.BaoxianGonshi;
import com.pojo.WeixinUser;
import com.util.JsonFilter;

@Service
public class WeixinChexianService {

	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private BaoxianBaodanDAO baodanDAO;
	@Autowired
	private BaoxianBaodanGonshiDAO baodanGonshiDAO;
	@Autowired
	private BaoxianGonshiDAO baoxianGonshiDAO;
	@Autowired
	private WeixinUserDAO weixinUserDAO;
	
	public void updateBaoianGongshiBao(BaoxianBaodanGonshi baodanGonshi)
	{
		baodanGonshiDAO.merge(baodanGonshi);
	}

	/**
	 * 获取所有保险公司,并设标志
	 * @param weixinOpenId
	 * @return
	 */
	public String getBaoxianGongshiByUser(String weixinOpenId) {
		String hql = "from BaoxianGonshi";
		List<BaoxianGonshi> list = hqlDAO.query(hql);
		String hql2 = "from BaoxianBaodanGonshi where weixinUser.openid=?";
		List<BaoxianBaodanGonshi> list2 = hqlDAO.query(hql2, weixinOpenId);

		for (BaoxianGonshi baoxianGonshi : list) {
			for (BaoxianBaodanGonshi baoxianBaodanGonshi : list2) {
                  if (baoxianGonshi.getName().equals(baoxianBaodanGonshi.getBaoxianGonshi().getName()))
                  {
                	  baoxianGonshi.setCheck(1);
                	  break;
                  }
			}
		}
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig, true); // 短日期
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;

	}

	/**
	 * 获取某用户的保险公司
	 * 
	 * @param weixinOpenId
	 * @return
	 */
	public String getBaoxianBaodanGonshi(String weixinOpenId) {
		String hql = "from BaoxianBaodanGonshi where weixinUser.openid=?";
		List list = hqlDAO.query(hql, weixinOpenId);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig, true); // 短日期
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;
	}

	/**
	 * 根据微信用户获取保单信息
	 * 
	 * @param weixinOpenId
	 * @return
	 */
	public List getBaoxianInfo(String weixinOpenId) {
		String hql = "from BaoxianBaodan where weixinUser.openid=?";
		List list = hqlDAO.query(hql, weixinOpenId);
		return list;
	}

	/**
	 * 根据微信用户获取保单信息
	 * 
	 * @param weixinOpenId
	 * @return
	 */
	public String getBaoxianToJson(String weixinOpenId) {
		List list = getBaoxianInfo(weixinOpenId);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig, true); // 短日期
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;

	}

	/**
	 * 根据openid获取微信对象json
	 * 
	 * @param weixinOpenId
	 * @return
	 */
	public String getBaoxianInfoToJson(String weixinOpenId) {
		String hql = "from WeixinUser where openid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, weixinOpenId);
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig, true); // 短日期
		String json = JSONArray.fromObject(list, jsonConfig).toString();
		return json;

	}

	/**
	 * 得会员所有选择保险项信息
	 * 
	 * @param weixinUser
	 * @return
	 */
	public String getAllBaoxian(WeixinUser weixinUser) {
		String hql = "from BaoxianBaodan where weixinUser.openid=?";
		List list = hqlDAO.query(hql, weixinUser.getOpenid());
		JsonConfig jsonConfig = new JsonConfig();
		JsonFilter.ignoredSet(jsonConfig, true);
		return JSONArray.fromObject(list, jsonConfig).toString();

	}

	/**
	 * 添加个人车子信息
	 * 
	 * @param weixinUser
	 * @param cph
	 * @param cjh
	 * @param fdj
	 * @param sfz
	 * @param cdr
	 * @param xm
	 */
	public void addBaoxianInfo(WeixinUser weixinUser, String cph, String cjh,
			String fdj, String sfz, String cdr, String xm) {
		weixinUser.setCejiahao(cjh);
		weixinUser.setCepai(cph);
		weixinUser.setTime(java.sql.Date.valueOf(cdr));
		weixinUser.setFadonjihao(fdj);
		weixinUser.setSfz(sfz);
		weixinUser.setName(xm);
		weixinUserDAO.merge(weixinUser);
	}

	/**
	 * 购买险种
	 * 
	 * @param weixinUser
	 * @param names
	 */
	public void updateChexian(WeixinUser weixinUser, String names) {
		String hql = "delete from BaoxianBaodan where weixinUser.openid=?";
		hqlDAO.bulkUpdate(hql, weixinUser.getOpenid());

		if (names != null) {
			String[] name = names.split(",");
			for (String n : name) {
				BaoxianBaodan baodan = new BaoxianBaodan();
				baodan.setWeixinUser(weixinUser);
				baodan.setName(n);
				baodanDAO.save(baodan);
			}
		}
	}

	/**
	 * 保存用户选择的保险公司
	 * 
	 * @param names
	 */
	public void saveBaoxianBaodanGonshi(String[] names, WeixinUser weixinUser) {
		List paramList = new ArrayList();
		paramList.add(weixinUser.getOpenid());
		StringBuffer sb = new StringBuffer(
				"delete from BaoxianBaodanGonshi where weixinUser.openid=? and baoxianGonshi.id not in (select id from BaoxianGonshi where name in (");
		for (int i = 0; i < names.length; i++) {
			sb.append("?,");
			paramList.add(names[i]);
		}
		sb.setCharAt(sb.length() - 1, ')');
		sb.append(")");
		String hql = sb.toString();
		System.out.println("hql=" + hql);
		hqlDAO.bulkUpdate(hql, paramList.toArray());
		if (names != null) {
			for (String name : names) {
				if (checkName(weixinUser, name) == false) {
					BaoxianGonshi baoxianGonshi = findGonshiByName(name);
					BaoxianBaodanGonshi bbg = new BaoxianBaodanGonshi();
					bbg.setBaoxianGonshi(baoxianGonshi);
					bbg.setWeixinUser(weixinUser);
					baodanGonshiDAO.save(bbg);
				}
			}
		}
	}

	private boolean checkName(WeixinUser weixinUser, String name) {
		String hql = "from BaoxianBaodanGonshi where weixinUser.openid=? and baoxianGonshi.name=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, weixinUser.getOpenid(), name);
		if (list.size() > 0)
			return true;
		return false;
	}

	/**
	 * 根据公司名字
	 * 
	 * @param name
	 * @return
	 */
	private BaoxianGonshi findGonshiByName(String name) {
		String hql = "from BaoxianGonshi where name=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, name);
		if (list.size() > 0)
			return (BaoxianGonshi) list.get(0);

		BaoxianGonshi baoxianGonshi = new BaoxianGonshi();
		baoxianGonshi.setName(name);
		baoxianGonshi.setStatus(1);
		baoxianGonshiDAO.save(baoxianGonshi);

		return baoxianGonshi;
	}

	/**
	 * 查找保险公司保单
	 * @param id
	 * @return
	 */
	public BaoxianBaodanGonshi getBaoxianBaodanGonshiById(int id) {
		// TODO Auto-generated method stub
		return baodanGonshiDAO.findById(id);
	}

	/**
	 * 修改保单状态 
	 * @param tradeNo
	 * @param money
	 * @return
	 */
	public boolean updateBaodanStatus(String tradeNo, double money) {
		String hql = "from BaoxianBaodanGonshi where payid=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, tradeNo);
		if (list.size()==0) return false;
		BaoxianBaodanGonshi baoxianGonshi = (BaoxianBaodanGonshi) list.get(0);
		if (money==baoxianGonshi.getMoney().floatValue())
		{
			baoxianGonshi.setStatus(2);
			baodanGonshiDAO.merge(baoxianGonshi);
			
			sendMessage(baoxianGonshi);
			return true;
		}
		return false;
	}
	
	/**
	 * 发送微信通知信息
	 * @param baoxianGonshi
	 */
	private void sendMessage(BaoxianBaodanGonshi baoxianGonshi)
	{
		
	}
}
