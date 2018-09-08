package com.action.wap;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Business;
import com.pojo.Service;
import com.service.wap.Wapservice;

@Controller
@RequestMapping("/wapgoods.do")
public class WapAction {
	@Autowired
	private Wapservice wapservice;
	@Autowired
	private HttpServletRequest request;
	//  查询服务类别
	@ResponseBody
	@RequestMapping(params="p=findAllshopcategory")
	public String findAllshopcategory(){
		String json=wapservice.findAllshopcategory();
		return json;
		
	}
	//根据信息查询商家
	@ResponseBody
	@RequestMapping(params="p=findtjshop")
	public String findtjshop(@RequestParam(required=false) String id,@RequestParam(required=false) String name){
		String aderssname=request.getParameter("aderssname");
		int page = Integer.parseInt(request.getParameter("page"));
		int size = Integer.parseInt(request.getParameter("size"));
		String shi = request.getParameter("shi");
		String qu  = request.getParameter("qu");
		int sid = 0;
		try {
			sid = Integer.parseInt(id);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
		}
		String json=wapservice.findtjshop(sid,name,aderssname,shi,qu,page,size);
		return json;
	}
	//跳转店铺详情界面
	@RequestMapping(params="p=toshopdetails")
	public String Toshopdetails(){
		String id =request.getParameter("id");
		Business business=wapservice.Toshopdetails(id);
		//查询该店铺的服务
		List<Service> services  = wapservice.getSetviceById(id);
		request.setAttribute("shop",business);
		request.setAttribute("services", services);
		return "wap/shop/shopdetail.jsp";
	}
	
}
