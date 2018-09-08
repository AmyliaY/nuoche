package com.shop.service.app;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.AddressDAO;
import com.dao.GoodsDAO;
import com.dao.GoodsorderdetailDAO;
import com.dao.GoodsordersDAO;
import com.dao.HqlDAO;
import com.dao.PayrecordsDAO;
import com.dao.ShoppingcatDAO;
import com.dao.UserinfoDAO;
import com.dao.ZitiaddressDAO;
import com.pojo.Address;
import com.pojo.Goods;
import com.pojo.Goodsorderdetail;
import com.pojo.Goodsorders;
import com.pojo.Paypresent;
import com.pojo.Payrecords;
import com.pojo.Shoppingcat;
import com.pojo.Userinfo;
import com.pojo.Zitiaddress;
import com.util.JsonFilter;
import com.util.WuLiu;

@Service
public class AppOrderService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private UserinfoDAO userinfoDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private GoodsordersDAO goodsordersDAO;
	@Autowired
	private ShoppingcatDAO shoppingcatDAO;
	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private GoodsorderdetailDAO goodsorderdetailDAO;
	@Autowired
	private ZitiaddressDAO zitiaddressDAO;

	@Autowired
	private PayrecordsDAO payrecordsDAO;
	

	public Userinfo findUserByIdNotCache(int userid) {
		String hql = "from Userinfo where usersId=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, userid);
		if (list.size() > 0)
			return (Userinfo) list.get(0);

		return null;
	}

	/**
	 * 查看单号
	 * 
	 * @param orid
	 * @return
	 */
	public String queryWuli2JSON(int orid) {

		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		if (goodsorders == null) {
			return "[]";
		}
		return WuLiu.getKuaidi(
				goodsorders.getPeisongcorp().getPscenglishname(), goodsorders
						.getOrRecipient());
	}

	/**
	 * 查询快递详情
	 * 
	 * @return
	 */
	public String queryKuaidi(int orid) {
		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		if (goodsorders == null) {
			return "[]";
		}
		JSONObject object = new JSONObject();
		Set<Goodsorderdetail> goodsorderdetails = goodsorders
				.getGoodsorderdetails();

		String hql = "from Goodsorderdetail g where g.goodsorders = ?";
		List<Goodsorderdetail> list = hqlDAO.findByHQL(hql, goodsorders);
		if (list.size() > 0) {
			object.put("img", list.get(0).getGoods().getGimages());
		} else {
			object.put("img", "false");
		}
		object.put("zhowen", goodsorders.getPeisongcorp().getPscchinesename());
		object.put("kefu", goodsorders.getPeisongcorp().getPscdesc());
		return object.toString();
	}

	/**
	 * 根据订单编号 查找订单对象
	 * 
	 * @param orderid
	 *            订单编号
	 * @return 订单对象
	 */
	public Goodsorders findByOrderId(String orderid) {
		String hql = "from Goodsorders where orOrdernumber=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, orderid);
		if (list.size() > 0)
			return (Goodsorders) list.get(0);

		return null;
	}

	/**
	 * 根据订单编号查找商品编号
	 * 
	 * @param orders
	 */
	public Goodsorders findByGoodsId(String orderid) {
		String hql = "from Goodsorderdetail where goods=?";
		List list = hqlDAO.pageQuery(hql, 1, 1, orderid);
		if (list.size() > 0)
			return (Goodsorders) list.get(0);

		return null;
	}

	public void updateOrder(Goodsorders orders) {
		goodsordersDAO.merge(orders);
	}

	/**
	 * 下订单
	 * 
	 * @param adid
	 */
	public String submitOrder(int userid, String[] catid, int index, int adid,
			String beizhu, String yunfei, Double price, String ddhao) {
		Userinfo userinfo = userinfoDAO.findById(userid); // 得到会员
		Goodsorders orders = new Goodsorders();

		Address address = null;
		Zitiaddress zitiaddress = null;
		if (index == 1 || index == 2) {
			address = addressDAO.findById(adid); // 得到地址
			orders.setAddress(address);
		}
		if (index == 0) {
			zitiaddress = zitiaddressDAO.findById(adid); // 得到自提地址
			orders.setZitiaddress(zitiaddress);
		}
		orders.setUserinfo(userinfo);
		orders.setOrPrice(price);
		orders.setOrYunfei(Double.parseDouble(yunfei));
		orders.setOrRemark(beizhu);
		orders.setOrTime(new Timestamp(System.currentTimeMillis()));
		orders.setOrTotalnum(catid.length);
		orders.setOrPeisongtype(index);
		orders.setOrStatus(0);
		orders.setOrOrdernumber(ddhao);
		orders.setOrJifen(0.00);
		orders.setOrExist(0);
		goodsordersDAO.save(orders);

		String cat = null;
		for (int i = 0; i < catid.length; i++) {
			cat = catid[i].toString().replace("{", "").replace("}", "");
			Shoppingcat shoppingcat = shoppingcatDAO.findById(Integer
					.parseInt(cat)); // 查找购物车
			Goods goods = goodsDAO.findById(shoppingcat.getGoods().getGid()); // 得到商品
			Goodsorderdetail orderdetail = new Goodsorderdetail();
			orderdetail.setGoods(goods);
			orderdetail.setOdNum(shoppingcat.getScatNum());
			// 这里要判断价格
			if (userinfo.getUsersType() == 1)
				orderdetail.setOdCost(shoppingcat.getGoods().getGvipprice());
			else
				orderdetail.setOdCost(shoppingcat.getGoods().getGprice());
			orderdetail.setGoodsorders(orders);
			orderdetail.setOdStatus(0);
			goodsorderdetailDAO.save(orderdetail);
		}
		return ddhao;
	}

	/**
	 * 得到积分
	 * 
	 * @param userid
	 * @return
	 */
	public Double getAllByUidMoney(int userid) {
		Userinfo userinfo = userinfoDAO.findById(userid);
		return userinfo.getUsersIntegral();
	}

	/**
	 * 生成订单号
	 * 
	 * @return
	 */
	public String getAllDingdanhao() {
		String dingdanhao = null;
		// Date date=new Date();
		// SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		// String dataString=sdf.format(date);
		//		
		// dingdanhao="shuiguoshangcheng"+dataString;
		dingdanhao = UUID.randomUUID().toString().replaceAll("-", "");
		return dingdanhao;
	}

	public void deleteCat(String cid) {
		Shoppingcat shoppingcat = shoppingcatDAO
				.findById(Integer.parseInt(cid));
		if (shoppingcat != null)
			shoppingcatDAO.delete(shoppingcat);

	}

	public String getAllOrder(int userid) {
		String ohql = "from Goodsorderdetail where goodsorders.userinfo.usersId=? group by goodsorders order by goodsorders.orTime desc"; // 得到所有订单
		String hql = "from Goodsorderdetail where goodsorders.userinfo.usersId=? order by goodsorders.orTime desc"; // 得到订单详情
		List olist = hqlDAO.query(ohql, userid); // 订单 list
		List odlist = hqlDAO.query(hql, userid); // 订单详情 list

		Map<String, Object> map = new HashMap<String, Object>(); // 存进Map里面
		map.put("olist", olist);
		map.put("odlist", odlist);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj = new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;

	}

	/*
	 * public String waitpay(int userid) { Stringohql=
	 * "from Goodsorderdetail where goodsorders.orStatus=0 and goodsorders.userinfo.usersId=? group by goodsorders order by goodsorders.orTime desc"
	 * ; //得到所有订单 Stringhql=
	 * "from Goodsorderdetail where goodsorders.orStatus=0 and goodsorders.userinfo.usersId=? order by goodsorders.orTime desc"
	 * ; //得到订单详情 System.out.println("到了未支付订单"); System.out.println("laile1");
	 * List olist=hqlDAO.query(ohql, userid); //订单 list List
	 * odlist=hqlDAO.query(hql, userid); // 订单详情 list
	 * 
	 * Map<String , Object> map=new HashMap<String,Object>(); //存进Map里面
	 * map.put("olist", olist); map.put("odlist", odlist); JsonConfig config=new
	 * JsonConfig(); JsonFilter.ignoredSet(config); net.sf.json.JSONObject obj
	 * =new net.sf.json.JSONObject(); obj.putAll(map, config); String
	 * json=obj.toString(); return json;
	 * 
	 * } public String getwaitpayOrder(int userid) { Stringohql=
	 * "from Goodsorderdetail where goodsorders.orStatus=1 and goodsorders.userinfo.usersId=? group by goodsorders order by goodsorders.orTime desc"
	 * ; //得到所有订单 Stringhql=
	 * "from Goodsorderdetail where goodsorders.orStatus=1 and goodsorders.userinfo.usersId=? order by goodsorders.orTime desc"
	 * ; //得到订单详情 System.out.println("到了待发货订单"); System.out.println("laile2");
	 * List olist=hqlDAO.query(ohql, userid); //订单 list List
	 * odlist=hqlDAO.query(hql, userid); // 订单详情 list
	 * 
	 * Map<String , Object> map=new HashMap<String,Object>(); //存进Map里面
	 * map.put("olist", olist); map.put("odlist", odlist); JsonConfig config=new
	 * JsonConfig(); JsonFilter.ignoredSet(config); net.sf.json.JSONObject obj
	 * =new net.sf.json.JSONObject(); obj.putAll(map, config); String
	 * json=obj.toString(); return json;
	 * 
	 * }
	 * 
	 * public String waitreceiving(int userid) {
	 * 
	 * Stringohql=
	 * "from Goodsorderdetail where goodsorders.orStatus=2 and goodsorders.userinfo.usersId=? group by goodsorders order by goodsorders.orTime desc"
	 * ; //得到所有订单 Stringhql=
	 * "from Goodsorderdetail where goodsorders.orStatus=2 and goodsorders.userinfo.usersId=? order by goodsorders.orTime desc"
	 * ; //得到订单详情 System.out.println("到了待收货订单"); System.out.println("laile3");
	 * List olist=hqlDAO.query(ohql, userid); //订单 list List
	 * odlist=hqlDAO.query(hql, userid); // 订单详情 list
	 * 
	 * Map<String , Object> map=new HashMap<String,Object>(); //存进Map里面
	 * map.put("olist", olist); map.put("odlist", odlist); JsonConfig config=new
	 * JsonConfig(); JsonFilter.ignoredSet(config); net.sf.json.JSONObject obj
	 * =new net.sf.json.JSONObject(); obj.putAll(map, config); String
	 * json=obj.toString(); return json;
	 * 
	 * }
	 * 
	 * 
	 * public String alreadyreceiving(int userid) { Stringohql=
	 * "from Goodsorderdetail where goodsorders.orStatus=3 and goodsorders.userinfo.usersId=? group by goodsorders order by goodsorders.orTime desc"
	 * ; //得到所有订单 Stringhql=
	 * "from Goodsorderdetail where goodsorders.orStatus=3 and goodsorders.userinfo.usersId=? order by goodsorders.orTime desc"
	 * ; //得到订单详情 System.out.println("到了已收货订单"); System.out.println("laile3");
	 * List olist=hqlDAO.query(ohql, userid); //订单 list List
	 * odlist=hqlDAO.query(hql, userid); // 订单详情 list
	 * 
	 * Map<String , Object> map=new HashMap<String,Object>(); //存进Map里面
	 * map.put("olist", olist); map.put("odlist", odlist); JsonConfig config=new
	 * JsonConfig(); JsonFilter.ignoredSet(config); net.sf.json.JSONObject obj
	 * =new net.sf.json.JSONObject(); obj.putAll(map, config); String
	 * json=obj.toString(); return json;
	 * 
	 * }
	 */
	public String myorder(Userinfo userinfo, int n, int page, int size) {
		String hqlsum = null;
		String ohql = null;
		String hql = null;
		int userid = userinfo.getUsersId();
		int sum = 0;
		List<Goodsorders> olist = null;
		List<Goodsorderdetail> odlist = null;
		if (n == 10) {
			hqlsum = "select count(*) from Goodsorders  where userinfo.usersId=? and orExist=? ";
			sum = (int) hqlDAO.unique(hqlsum, userid, 0);
			ohql = "from Goodsorderdetail where goodsorders.userinfo.usersId=? and goodsorders.orExist=? group by goodsorders order by goodsorders.orTime desc"; // 得到所有订单
			hql = "from Goodsorderdetail where goodsorders.userinfo.usersId=? and goodsorders.orExist=? order by goodsorders.orTime desc"; // 得到订单详情
			olist = hqlDAO.pageQuery(ohql, size, page, userid, 0); // 订单 list
			odlist = hqlDAO.query(hql, userid, 0); // 订单详情 list
		} else {
			hqlsum = "select count(*) from Goodsorders where orStatus=? and userinfo.usersId=? and orExist=? ";
			sum = (int) hqlDAO.unique(hqlsum, n, userid, 0);
			ohql = "from Goodsorderdetail where goodsorders.orStatus=? and goodsorders.userinfo.usersId=? and goodsorders.orExist=? group by goodsorders order by goodsorders.orTime desc"; // 得到所有订单
			hql = "from Goodsorderdetail where goodsorders.orStatus=? and goodsorders.userinfo.usersId=? and goodsorders.orExist=? order by goodsorders.orTime desc"; // 得到订单详情
			olist = hqlDAO.pageQuery(ohql, size, page, n, userid, 0); // 订单 list
			odlist = hqlDAO.query(hql, n, userid, 0); // 订单详情 list
		}
		System.out.println("n=" + n);

		if (sum == 0)
			return "{olist:[]}";

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		Map<String, Object> map = new HashMap<String, Object>(); // 存进Map里面
		map.put("olist", olist);
		map.put("odlist", odlist);
		map.put("count", count);
		System.out.println("count=" + count);

		System.out.println("page=" + page);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj = new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;

	}

	public void deleteOrder(int orid) {
		// String
		// hql="delete from Goodsorderdetail where goodsorders.orId in("+orid+")";
		// hqlDAO.bulkUpdate(hql);
		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		if (goodsorders != null)
			goodsorders.setOrExist(1);
		goodsordersDAO.save(goodsorders);

	}


	public boolean updateOrder(Integer userid, String ddhao, Double money) {
		Goodsorders goodsorders = findByOrderId(ddhao);// 得订单号
		Double jifen = goodsorders.getOrJifen();// 得积分
		Userinfo yonghuid = goodsorders.getUserinfo();// 得用户对象

		goodsorders.setOrStatus(1);
		goodsorders.setOrJifen(money + jifen);
		goodsordersDAO.merge(goodsorders);
		// 修改购买次数和数量
		Set<Goodsorderdetail> set = goodsorders.getGoodsorderdetails();
		if (set != null) {
			for (Goodsorderdetail g : set) {
				Goods goods = g.getGoods();

				if (goods != null) {
					Integer buyCount = goods.getBuyCount();
					if (buyCount == null)
						buyCount = 0;
					buyCount = buyCount + 1;

					Integer sellNum = goods.getGsellnum();
					if (sellNum == null)
						sellNum = 0;
					Integer buyNum = g.getOdNum();
					goods.setGsellnum(buyNum + sellNum);

					goods.setBuyCount(buyCount);
					goodsDAO.merge(goods);
				}
			}
		}
		return true;
	}

	public Goodsorders findByIdOrder(int orid) {
		return goodsordersDAO.findById(orid);
	}

	public void setOrderPayJifen(int userid, String ddhao, Double jifenpay) {
		String hql = "from Goodsorders where orOrdernumber=?";
		List<Goodsorders> list = hqlDAO.query(hql, ddhao);
		if (list.size() > 0) {
			Goodsorders goodsorders = list.get(0);
			Double jifen = goodsorders.getOrJifen();
			System.out.println(jifen);
			goodsorders.setOrJifen(jifenpay + jifen);
			goodsordersDAO.save(goodsorders);
		}

	}

	public void alipayEditOrder(int userid, String ddhao, Double threemoney,
			Double jifen) {
		String hql = "from Goodsorders where orOrdernumber=?";
		List<Goodsorders> list = hqlDAO.query(hql, ddhao);
		Goodsorders goodsorders = null;
		if (list.size() > 0)
			goodsorders = list.get(0);
		goodsorders.setOrPaytype(1);
		goodsorders.setOrThreepay(threemoney);
		goodsorders.setOrStatus(1);
		goodsorders.setOrJifen(jifen);
		goodsordersDAO.save(goodsorders);
	}

	public void submitZhongchouOrder(int userid, int gid, int index, int adid,
			String beizhu, String yunfei, double money, String dingdanhao,
			int num, Double xiaoshoujia, Double rebate, int type) {
		Userinfo userinfo = userinfoDAO.findById(userid); // 得到会员
		// 写订单
		Goodsorders orders = new Goodsorders();
		Address address = null;
		Zitiaddress zitiaddress = null;
		if (index == 1 || index == 2) {
			address = addressDAO.findById(adid); // 得到地址
			orders.setAddress(address);
		}
		if (index == 0) {
			zitiaddress = zitiaddressDAO.findById(adid); // 得到自提地址
			orders.setZitiaddress(zitiaddress);
		}
		// orders.setAddress(address);
		orders.setUserinfo(userinfo);
		orders.setOrPrice(money);
		orders.setOrYunfei(Double.parseDouble(yunfei));
		orders.setOrRemark(beizhu);
		orders.setOrTime(new Timestamp(System.currentTimeMillis()));
		orders.setOrTotalnum(1);
		orders.setOrPeisongtype(index);
		orders.setOrStatus(0);
		orders.setOrOrdernumber(dingdanhao);
		orders.setOrJifen(0.00);
		orders.setOrShoppingzhekou(rebate);
		orders.setOrExist(0);
		goodsordersDAO.save(orders);

		// 写订单详情
		Goods goods = goodsDAO.findById(gid); // 得到商品
		Goodsorderdetail orderdetail = new Goodsorderdetail();
		orderdetail.setGoods(goods);
		orderdetail.setOdNum(num);
		orderdetail.setOdCost(xiaoshoujia);
		orderdetail.setGoodsorders(orders);
		// 这里要判断价格
		if (userinfo.getUsersType() == 1)
			orderdetail.setOdCost(goods.getGvipprice());
		else
			orderdetail.setOdCost(goods.getGprice());
		if (type == 1) {
			orderdetail.setOdStatus(2);
		} else {
			orderdetail.setOdStatus(0);
		}
		goodsorderdetailDAO.save(orderdetail);
	}

	// 根据ID找一条记录
	public String getJifen(int id) {
		Goodsorders goodsorders = goodsordersDAO.findById(id);
		Map map = new HashMap();
		map.put("goodsorders", goodsorders);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj = new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}

	// 得到本月积分使用
	public String getJifen(int userid, Timestamp begintime, Timestamp endtime) {
		int usesum = 0;
		String usehql = "from Goodsorders where usersId=? and orTime between ? and ? order by orTime desc";
		List<Goodsorders> goodsorders = hqlDAO.findByHQL(usehql, userid,
				begintime, endtime);
		Map map = new HashMap();
		map.put("goodsorders", goodsorders);
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		net.sf.json.JSONObject obj = new net.sf.json.JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}

	public String getAllOrderDetail(int orid, int addressid, int type) {
		Map map = new HashMap();
		String hql = "from Goodsorderdetail where goodsorders.orId=?";
		List odlist = hqlDAO.query(hql, orid);
		String rghql = "from Goodsreturn where goodsorders.orId=?";
		List rglist = hqlDAO.query(rghql, orid);
		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		Address address = null;
		Zitiaddress zitiaddress = null;
		if (type == 1) {
			address = addressDAO.findById(addressid);
			map.put("address", address);
		} else {
			zitiaddress = zitiaddressDAO.findById(addressid);
			map.put("zitiaddress", zitiaddress);
		}
		JsonConfig config = new JsonConfig();
		JsonFilter.ignoredSet(config);
		map.put("odlist", odlist);
		map.put("goodsorders", goodsorders);
		JSONObject obj = new JSONObject();
		obj.putAll(map, config);
		String json = obj.toString();
		return json;
	}

	public Goodsorders editOrderStatus(int orid) {
		Goodsorders goodsorders = goodsordersDAO.findById(orid);
		if (goodsorders != null)
			goodsorders.setOrStatus(3);
		goodsordersDAO.save(goodsorders);
		return goodsorders;
	}


	/**
	 * 支付宝支付成功，修改订单状态,修改赠送的积分
	 * 
	 * @param outTradeNo
	 * @param parseDouble
	 * @return
	 */
	public boolean alipayEditorChonzhiOrder(String outTradeNo,
			double parseDouble) {

		String hql = "from Payrecords p where p.prDingdanhao=?";
		String hql2 = "from Paypresent where ppStatus=1 and ppMin<=? and ppMax>=? order by ppMax desc";
		List list = hqlDAO.pageQuery(hql, 1, 1, outTradeNo);
		if (list.size() > 0) {
			List list2 = hqlDAO.pageQuery(hql2, 1, 1, (int) parseDouble,
					(int) parseDouble);
			if (list2.size() == 0) {
				hql2 = "from Paypresent where ppStatus=1 and ppMax<? order by ppMax desc";
				list2 = hqlDAO.pageQuery(hql2, 1, 1, (int) parseDouble);
			}
			Payrecords payrecords = (Payrecords) list.get(0);
			payrecords.setPrStatus(1);
			payrecords.setPrTime(new Timestamp(System.currentTimeMillis()));
			if (list2.size() > 0) {
				Paypresent prPresent = (Paypresent) list2.get(0);
				if (prPresent.getPpPresent() != null)
					payrecords.setPrPresent(prPresent.getPpPresent());
			}
			//
			Userinfo userinfo = payrecords.getUserinfo();
			if (userinfo != null) {
				if (payrecords.getPrPresent() == null)
					payrecords.setPrPresent(0);

				Double oldJifen = userinfo.getUsersIntegral();
				if (oldJifen==null)
					oldJifen = 0.0;

				userinfo.setUsersIntegral(oldJifen + parseDouble
						+ payrecords.getPrPresent());
				userinfoDAO.merge(userinfo); // 更新用户的积分
			}

			payrecordsDAO.merge(payrecords);
			return true;
		}

		return false;
	}

	/**
	 * 支付成功后，修改订单状态
	 * 
	 * @param outTradeNo
	 * @param totalFee
	 */
	public void alipayEditOrder(String outTradeNo, String totalFee) {
		String hql = "from Goodsorders where orOrdernumber=?";
		List<Goodsorders> list = hqlDAO.pageQuery(hql, 1, 1, outTradeNo);
		Goodsorders goodsorders = null;
		if (list.size() > 0) {
			goodsorders = list.get(0);
			goodsorders.setOrPaytype(1);
			goodsorders.setOrStatus(1);
			// goodsorders.setOrJifen(jifen);
			goodsordersDAO.merge(goodsorders);

			// 修改用户的可用积分
			Userinfo userinfo = goodsorders.getUserinfo();
			if (userinfo != null) {
				if (userinfo.getUsersIntegral() == null)
					userinfo.setUsersIntegral(0.0);
				double jifen = goodsorders.getOrJifen();
				userinfo.setUsersIntegral(userinfo.getUsersIntegral() - jifen);
				userinfoDAO.merge(userinfo); // 更新用户的积分

				// 修改购买次数
				Set<Goodsorderdetail> set = goodsorders.getGoodsorderdetails();
				if (set != null) {
					for (Goodsorderdetail g : set) {
						Goods goods = g.getGoods();
						if (goods != null) {
							Integer buyCount = goods.getBuyCount();
							if (buyCount == null)
								buyCount = 0;
							buyCount = buyCount + 1;
							goods.setBuyCount(buyCount);

							Integer sellNum = goods.getGsellnum();
							if (sellNum == null)
								sellNum = 0;
							Integer buyNum = g.getOdNum();
							goods.setGsellnum(buyNum + sellNum);

							goodsDAO.merge(goods);

						}
					}
				}

			}

		}
	}

}
