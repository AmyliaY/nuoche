package com.shop.action.app;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Address;
import com.shop.service.app.AppAddressService;

@Controller
@RequestMapping("/appaddress.do")
public class AppAddressAction {
	@Autowired
	private AppAddressService addressService;
	@Autowired
	private HttpServletRequest request;
	/**
	 * 
	 * 得到会员的收货地址
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllAddress")
	public String getAllAddress()
	{
		String id = request.getParameter("id");	//会员ID
		if(id==null)
		{
			return "请先登录";
		}else{
			int userid = Integer.parseInt(id);	//会员ID
			String json=addressService.getAllAddress(userid);
			return json;
		}
	}
	/**
	 * 得到所有省份
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllProvice")
	public String getAllProvice()
	{
		String json=addressService.getAllProvice();
		return json;
	}
	/**
	 * 根据省ID 查找城市
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllCity")
	public String getAllCity()
	{
		int id = Integer.parseInt(request.getParameter("id")); //省份ID
		String json=addressService.getAllCity(id);
		return json;
	}
	/**
	 * 根据市ID 查找区/县
	 */
	@ResponseBody
	@RequestMapping(params="p=getAllArea")
	public String getAllArea()
	{
		int id = Integer.parseInt(request.getParameter("id"));//城市ID
		String json=addressService.getAllArea(id);
		return json;
	}
	/**
	 * 添加收货地址
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(params="p=addAddress")
	public String addAddress() throws IOException
	{
		int uid = Integer.parseInt(request.getParameter("uid"));	//会员ID
		int  adId = Integer.parseInt(request.getParameter("adId"));	//默认收货地址ID
		String adname=request.getParameter("adname");				//收货人
		String adphone=request.getParameter("adphone");				//联系号码
		int adarea = Integer.parseInt(request.getParameter("adarea"));	//区县 ID
		String addetail=request.getParameter("addetail");				//详细地址
		int adstatus=Integer.parseInt(request.getParameter("adstatus"));	//状态   是否默认
		addressService.addAddress(adId,uid,adname,adphone,adarea,addetail,adstatus);
		return "成功";
	} 
	/**
	 * 会员删除收货地址
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=deleteAddress")
	public String deleteAddress(HttpServletResponse response) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));	//地址ID
		System.out.println(id);
		boolean f=addressService.deleteAddress(id);
		if(f)
			response.getWriter().print("成功");
		else
			response.getWriter().print("失败");
		return null;
	}
	/**
	 * 是否把地址设为默认
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=updataStatus")
	public String updataStatus(HttpServletResponse response) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));	//地址ID
		int  adId = Integer.parseInt(request.getParameter("adId"));	//默认收货地址ID
		int status=Integer.parseInt(request.getParameter("status"));	//状态
		
		Address address=addressService.updataStatus(adId,id,status);
		response.getWriter().print(address.getAdStatus());
		
		return null;
	}
	/**
	 * 编辑地址
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=editAddress")
	public String editAddress()
	{
		int id = Integer.parseInt(request.getParameter("id"));	//地址ID
		//int  adId = Integer.parseInt(request.getParameter("adId"));	//默认收货地址ID
		String adname=request.getParameter("adname");				//收货人
		String adphone=request.getParameter("adphone");				//联系号码
		int adarea = Integer.parseInt(request.getParameter("adarea"));	//区县 ID
		String addetail=request.getParameter("addetail");				//详细地址
		int adstatus=Integer.parseInt(request.getParameter("adstatus"));	//状态   是否默认
		addressService.editAddress(id,adname,adphone,adarea,addetail,adstatus);
		return "成功";
	}
}
