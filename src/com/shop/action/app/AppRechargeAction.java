package com.shop.action.app;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.app.AppRechargeService;

@Controller
@RequestMapping("/apprecharge.do")
public class AppRechargeAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AppRechargeService rechargeService;
	
	/**
	 * 查询所有充值订单
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllRecords")
	public String getAllRecords(){
		int id = Integer.parseInt(request.getParameter("id"));//会员id
		String json = rechargeService.getAllRecords(id);
		return json;
	}
	/**
	 * 分页查询所有充值订单
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=fenye")
	public String getFenye(){
		int id = Integer.parseInt(request.getParameter("id"));//会员id
		int page = Integer.parseInt(request.getParameter("page"));//页数
		String json = rechargeService.getFenye(id,page);
		return json;
	}
	/**
	 * 查询优惠信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllPresent")
	public String getAllPresent(){
		String json  = rechargeService.getAllPresent();
		return json;
	}
	/**
	 * 添加订单记录
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=addRecharRecords")
	public String addRechargeRecords(){
		System.out.println("owca");
			int prType =0;
			int userid = Integer.parseInt(request.getParameter("userid"));
			Double price = Double.parseDouble(request.getParameter("price"));
			int present = Integer.parseInt(request.getParameter("present"));
			String orderid = request.getParameter("orderid");
			String id= request.getParameter("id");
			if("alipay".equals(id)){
				prType = 1;
			}else {
				prType = 2;
			}
			Date date = new Date();
			Timestamp ordertime = new Timestamp(System.currentTimeMillis());
			SimpleDateFormat dateFormat  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateString = dateFormat.format(date);
			ordertime = Timestamp.valueOf(dateString);
			rechargeService.addRecharRecords(userid,price,present,orderid,prType,ordertime);		
			return "success";
	}
}
