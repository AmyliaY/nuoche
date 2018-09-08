package com.shop.action.app;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.WeixinConfig;
import com.pojo.Goodsorders;
import com.pojo.Userinfo;
import com.shop.service.app.AppOrderService;
import com.util.StringUtil;

@Controller
@RequestMapping("/apporder.do")
public class AppOrderAction {
	@Autowired
	private AppOrderService appOrderService;
	@Autowired
	private HttpServletRequest request;
	double money; // 总金额
	String dingdanhao = null; // 订单号
	

	@ResponseBody
	@RequestMapping(params = "p=queryWuli")
	public String queryWuli() {
		int orid = 0;
		String oridString = request.getParameter("orid");
		if (StringUtil.isNotNull(oridString)) {
			orid = Integer.parseInt(oridString);
		}
		return appOrderService.queryWuli2JSON(orid);
	}

	@ResponseBody
	@RequestMapping(params = "p=queryKuaidi")
	public String queryXq() {
		int orid = 0;
		String oridString = request.getParameter("orid");
		if (StringUtil.isNotNull(oridString)) {
			orid = Integer.parseInt(oridString);
		}
		return appOrderService.queryKuaidi(orid);
	}

	/**
	 * 下订单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=submitOrder")
	public String submitOrder() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "请先登录";
		} else {
			int userid = Integer.parseInt(request.getParameter("userid")); // 会员ID
			String[] catid = request.getParameterValues("catid[]"); // 购物车ID(得到商品)
			int index = Integer.parseInt(request.getParameter("index")); // 配送方式
			int adid = Integer.parseInt(request.getParameter("adid")); // 地址ID
			String beizhu = request.getParameter("beizhu"); // 订单备注
			String yunfei = request.getParameter("yunfei"); // 运费
			money = Double.parseDouble(request.getParameter("price")); // 实际总金额
			// (含运费)
			dingdanhao = appOrderService.getAllDingdanhao(); // 生成订单号
			appOrderService.submitOrder(userid, catid, index, adid, beizhu,
					yunfei, money, dingdanhao);
			return dingdanhao;
		}
	}

	/**
	 * 得到积分 ，总金额 ，订单号
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=getAllByUidMoney")
	public String getAllByUidMoney() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "请先登录";
		}

		int userid =userinfo.getUsersId() ;//Integer.parseInt(request.getParameter("userid")); // 会员ID
		//System.out.println("userid:"+userid);
		Double jifen =appOrderService.findUserByIdNotCache(userid).getUsersIntegral() ;//appOrderService.getAllByUidMoney(userid); // 查找会员的积分
		WeixinConfig wx = new WeixinConfig();
		Map map = new HashMap();
		map.put("jifen", jifen);
		map.put("money", money);
		map.put("ddhao", dingdanhao);
		map.put("status", wx.getStatus());
		String json = JSONObject.fromObject(map).toString();
		return json;

	}

	/**
	 * 订单页面:查找会员积分，总金额，订单号
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=getAllOrderByUidMoney")
	public String getAllOrderByUidMoney() {
		int userid = Integer.parseInt(request.getParameter("userid")); // 会员ID
		int orid = Integer.parseInt(request.getParameter("orid")); // 订单ID
		Double jifen = appOrderService.getAllByUidMoney(userid); // 查找会员积分
		Goodsorders goodsorders = appOrderService.findByIdOrder(orid); // 根据订单ID
		// 查订单
		Double money = goodsorders.getOrPrice(); // 得到订单总金额
		String ddhao = goodsorders.getOrOrdernumber(); // 得到订单号
		WeixinConfig wx = new WeixinConfig();
		//sAlipayConfig alipay = new AlipayConfig();
		Map map = new HashMap();
		map.put("jifen", jifen);
		map.put("money", money);
		map.put("ddhao", ddhao);
		map.put("status", 1);
		map.put("alipayStatus", 1);
		String json = JSONObject.fromObject(map).toString();
		return json;
	}

	/**
	 * 提交订单后删除购物车
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=deleteCat")
	public String deleteCat() {
		System.out.println("删除CAT");
		String[] catid = request.getParameterValues("catid[]");
		String cid = null;
		for (int i = 0; i < catid.length; i++) {
			cid = catid[i].toString();
			appOrderService.deleteCat(cid);
		}
		return "删除成功";
	}

	/**
	 * 查所有订单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=getAllOrder")
	public String getAllOrder() {
		System.out.println("到了所有订单");
		int userid = Integer.parseInt(request.getParameter("id")); // 会员ID
		String json = appOrderService.getAllOrder(userid);
		return json;
	}

	/**
	 * 查未支付订单
	 * 
	 * @return
	 * @ResponseBody
	 * @RequestMapping(params="p=waitpay") public String waitpay() {
	 *                                     System.out.println("到了未支付订单"); int
	 *                                     userid=Integer.parseInt(request.
	 *                                     getParameter("id")); //会员ID String
	 *                                     json=appOrderService.waitpay(userid);
	 *                                     return json; }
	 */
	/**
	 * 查待发货订单
	 * 
	 * @return
	 * @ResponseBody
	 * @RequestMapping(params="p=waitshipments") public String waitshipments() {
	 *                                           System.out.println("到了待发货订单");
	 *                                           int userid=Integer.parseInt(
	 *                                           request.getParameter("id"));
	 *                                           //会员ID String
	 *                                           json=appOrderService
	 *                                           .getwaitpayOrder(userid);
	 *                                           return json; }
	 */
	/**
	 * 查待收货订单
	 * 
	 * @return
	 * @ResponseBody
	 * @RequestMapping(params="p=waitreceiving") public String waitreceiving() {
	 * 
	 *                                           System.out.println("到了待收货订单");
	 *                                           int userid=Integer.parseInt(
	 *                                           request.getParameter("id"));
	 *                                           //会员ID String
	 *                                           json=appOrderService
	 *                                           .waitreceiving(userid); return
	 *                                           json; }
	 */
	/**
	 * 查已收货订单
	 * 
	 * @return
	 * @ResponseBody
	 * @RequestMapping(params="p=alreadyreceiving") public String
	 *                                              alreadyreceiving() {
	 *                                              System.out
	 *                                              .println("到了已收货订单"); int
	 *                                              userid
	 *                                              =Integer.parseInt(request
	 *                                              .getParameter("id")); //会员ID
	 *                                              String json=appOrderService.
	 *                                              alreadyreceiving(userid);
	 *                                              return json; }
	 */
	/**
	 * 订单界面所有方法
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=myorder")
	public String myorder() {

		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "请先登录";
		}

		int page = Integer.parseInt(request.getParameter("page"));
		int size = Integer.parseInt(request.getParameter("size"));
		int n = Integer.parseInt(request.getParameter("n"));
		// int userid = Integer.parseInt(request.getParameter("id")); // 会员ID
		String json = appOrderService.myorder(userinfo, n, page, size);
		return json;
	}

	/**
	 * 删除订单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=deleteOrder")
	public String deleteOrder() {
		int orid = Integer.parseInt(request.getParameter("orid")); // 订单ID
		appOrderService.deleteOrder(orid);
		return "成功";
	}

	/**
	 * 支付宝支付成功后 修改订单状态 ,写数据
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=alipayEditOrder")
	public String alipayEditOrder() {
		System.out.println("支付宝提交订单");
		int userid = Integer.parseInt(request.getParameter("userid"));
		System.out.println(userid);
		Double threemoney = Double.parseDouble(request.getParameter("price"));
		System.out.println("第三方支付金额：" + threemoney);
		String ddhao = request.getParameter("ddhao");
		System.out.println("订单号：" + ddhao);
		Double jifen = Double.parseDouble(request.getParameter("jifen"));
		System.out.println("已支付多少积分：" + jifen);
		// 修改订单状态
		appOrderService.alipayEditOrder(userid, ddhao, threemoney, jifen);
		return "成功";
	}

	/**
	 * 众筹购买 提交订单
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=submitZhongchouOrder")
	public String submitZhongchouOrder() {
		Userinfo userinfo = (Userinfo) request.getSession().getAttribute(
				"userinfo");
		if (userinfo == null) {
			return "请先登录";
		} else {
			int type = Integer.parseInt(request.getParameter("type"));
			int userid = Integer.parseInt(request.getParameter("userid")); // 会员ID
			int gid = Integer.parseInt(request.getParameter("gid")); // 商品ID
			int index = Integer.parseInt(request.getParameter("index")); // 配送方式
			System.out.println("index:" + index);
			int adid = Integer.parseInt(request.getParameter("adid")); // 地址ID
			String beizhu = request.getParameter("beizhu"); // 订单备注
			String yunfei = request.getParameter("yunfei"); // 运费
			money = Double.parseDouble(request.getParameter("price")); // 实际总金额
			int num = Integer.parseInt(request.getParameter("num")); // 购买数量
			Double xiaoshoujia = Double.parseDouble(request
					.getParameter("xiaoshoujia")); // 销售价
			Double rebate = 1.0;
			if (type == 2) {
				rebate = Double.parseDouble(request.getParameter("rebate")); // 折扣
			}
			dingdanhao = appOrderService.getAllDingdanhao(); // 生成订单号
			appOrderService.submitZhongchouOrder(userid, gid, index, adid,
					beizhu, yunfei, money, dingdanhao, num, xiaoshoujia,
					rebate, type);
			return dingdanhao;
		}
	}

	/**
	 * 订单详情
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "p=getAllOrderDetail")
	public String getAllOrderDetail() {
		int orid = Integer.parseInt(request.getParameter("orid"));
		int addressid = Integer.parseInt(request.getParameter("addressid"));
		int type = Integer.parseInt(request.getParameter("type"));
		String json = appOrderService.getAllOrderDetail(orid, addressid, type);
		return json;
	}

	/**
	 * 会员确认收货 修改状态
	 * 
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params = "p=editOrderStatus")
	public String editOrderStatus(HttpServletResponse response)
			throws IOException {
		int orid = Integer.parseInt(request.getParameter("orid"));
		Goodsorders goodsorders = appOrderService.editOrderStatus(orid);
		response.getWriter().print(goodsorders.getOrStatus());
		return null;
	}


}
