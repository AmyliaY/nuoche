package com.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.JiayouEmp;
import com.pojo.JiayouJilu;
import com.pojo.JiayouStation;
import com.pojo.JiayouZhekou;
import com.pojo.WeixinUser;
import com.service.weixin.WeixinJiayouService;
import com.util.PaySaPi;
import com.util.PayUtil;
import com.util.StringUtil;

@Controller
@RequestMapping("/pays.do")
public class PayController {
	
	
	@Autowired
	private WeixinJiayouService  weixinJiayouService;
	
	public static void main(String[] args) throws HttpException, IOException {
		String price = "0.01";
		String bianhao = "001";
		String istype = "2";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> remoteMap = new HashMap<String, Object>();
		remoteMap.put("price", price);
		remoteMap.put("istype", istype);
		remoteMap.put("orderid", UUID.randomUUID().toString().replaceAll("-", "")); //PayUtil.getOrderIdByUUId()
		remoteMap.put("orderuid", bianhao);
		remoteMap.put("goodsname", "石油");
		PayUtil payUtil = new PayUtil();
		resultMap.put("data", payUtil.payOrder(remoteMap));
		resultMap.put("code", "200");
		String json = JSONObject.fromObject(resultMap).toString();
		HttpClient client = new HttpClient();
		String url = "https://pay.bbbapi.com/?format=json";
		PostMethod postMethod = new PostMethod(url);
		postMethod.setRequestBody(json);
		client.executeMethod(postMethod);
		String ret = postMethod.getResponseBodyAsString();
		System.out.println(ret);
	}

	@RequestMapping(params="p=toPay")
	@ResponseBody
	public Map<String,Object> pay(HttpServletRequest request,HttpServletResponse response) {
		
		//判断是否登录 
		WeixinUser weixinUser = (WeixinUser) request.getSession().getAttribute("weixinuser");
		if (weixinUser==null)
		{
			
		}
		
		
		
		String price = request.getParameter("price");    //价格
		String empId    = request.getParameter("empId"); //员工编号
		String _youId    = request.getParameter("youId");  //油编号
		String youId     = _youId.split("-")[0];
		String type= "2"; //微信
		
		int  payType = Integer.parseInt(request.getParameter("type")); //1折扣  2余额  3，红包
		String redbag   = request.getParameter("redbag");//红包id，逗号隔开
		
		
		
		
	    JiayouEmp emp = weixinJiayouService.findEmpById(Integer.parseInt(empId));
	    JiayouStation station = weixinJiayouService.findStationByEmpId(Integer.parseInt(empId));
	    JiayouZhekou  jiayouZhekou = weixinJiayouService.getYouById(Integer.parseInt(youId));
	    float money =0;
	    float _price = Float.parseFloat(price)*jiayouZhekou.getZhekou();
	    Float yuer   = weixinJiayouService.getYuerByStation(station.getGid(), weixinUser.getOpenid());
	    switch (payType) {
		case 1:
			
			break;

		case 2:
			_price = Float.parseFloat(price)-yuer; //余额支付
			break;
		case 3:
			 if (StringUtil.isNotNull(redbag))
			 money = weixinJiayouService.getRedBagMoney(redbag,Float.parseFloat(price)); //红包,用,隔开
			_price = Float.parseFloat(price)-money;
			break;
		}
	    //写订单--------------------------------
	    //应付=油价*折扣-余额
	    float yinfu = _price;
	    boolean f = false;
	    if (yinfu==(int)yinfu)
	    	 f= true;
	    String orderId = UUID.randomUUID().toString().replaceAll("-", "");
	    JiayouJilu jiayouJilu = new JiayouJilu();
	    jiayouJilu.setJiayouZhekou(jiayouZhekou);
	    jiayouJilu.setPrice(Float.parseFloat(price)); //原价
	    jiayouJilu.setOrderid(orderId);
	    jiayouJilu.setTime(new Timestamp(System.currentTimeMillis()));
	    jiayouJilu.setWeixinUser(weixinUser);
	    jiayouJilu.setYinfu(yinfu); //应付(油价)
	    jiayouJilu.setPayType(payType);//1折扣  2余额 3红包
	    
	    if (payType==1)
	        jiayouJilu.setZhekou(jiayouZhekou.getZhekou());//折扣
	    
	    if (payType==2)
	       jiayouJilu.setYuer(yuer); //余额支付
	    
	    if (payType==3)
	    {	
	    	jiayouJilu.setYouhuijuan_money(money);
	    	jiayouJilu.setYouhuijuan_ids(redbag);
	    }
	    
	    if (payType!=3 || (payType==3 && money>=0))
	    weixinJiayouService.addJiayoujilu(jiayouJilu); //这里要修改
	    
	    String UID =  station.getUid();
	    String TOKEN = station.getToken();
	    
		PayUtil payUtil = new PayUtil();
		payUtil.setRequest(request);
		payUtil.init();
		payUtil.setUID(UID);
		payUtil.setTOKEN(TOKEN);
		
		
		String istype = type;// "2";
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> remoteMap = new HashMap<String, Object>();
		
		if (f)
		    remoteMap.put("price", (int)yinfu);
		else
			remoteMap.put("price", yinfu);
		remoteMap.put("istype", istype);
		remoteMap.put("orderid", orderId); //PayUtil.getOrderIdByUUId()
		remoteMap.put("orderuid", weixinUser.getNickname());
		remoteMap.put("goodsname", "加油");
		resultMap.put("data", payUtil.payOrder(remoteMap));
		
		 if (payType!=3 || (payType==3 && money>=0) )
		   resultMap.put("code", "200");
		 else
		    resultMap.put("code", money);
		String json = JSONObject.fromObject(resultMap).toString();
		return resultMap;
	}

	@RequestMapping
	public void notifyPay(HttpServletRequest request, HttpServletResponse response, PaySaPi paySaPi) {
		System.out.println("来了");
		System.out.println(paySaPi.getKey());
		if (true) return;
		PayUtil payUtil = new PayUtil();
		payUtil.setRequest(request);
		payUtil.init();
		String oderid = paySaPi.getOrderid();
		JiayouJilu jiayouJilu = weixinJiayouService.getOrderById(oderid);
		JiayouStation station = jiayouJilu.getJiayouZhekou().getJiayouStation();
		payUtil.setUID(station.getUid());
		payUtil.setTOKEN(station.getToken());
		// 保证密钥一致性
		if (payUtil.checkPayKey(paySaPi)) {
			
			System.out.println("orderid="+oderid);
			System.out.println("jiayouJilu="+jiayouJilu);
			if (jiayouJilu!=null)
			{
				jiayouJilu.setStatus(1);
				float yinfu = jiayouJilu.getYinfu();
				float shifu = Float.parseFloat(paySaPi.getRealprice());
				//实付金额 
				jiayouJilu.setShifu(shifu);
				weixinJiayouService.update(jiayouJilu);
				//更新余额
				weixinJiayouService.updateYuer(jiayouJilu);
			}
		} else {
			// TODO 该怎么做就怎么做
			System.out.println("验证失败failure");
		}
	}

	/**
	 * 加油订单
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=showOrder")
	public String returnPay(HttpServletRequest request, HttpServletResponse response) {
		String orderid = request.getParameter("orderid");
		JiayouJilu jiayouJilu = weixinJiayouService.getOrderById(orderid);
		request.setAttribute("order", jiayouJilu);
		return "/weixin/jiaoyou_station/order.jsp";
	}
}
