package com.action.admin;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsAction;
import com.pojo.Admin;

@Controller
@RequestMapping("/admin_jccs.do")
public class JCCSAction {
	/**
	 * 基础参数--唐仁鑫
	 * 新增充值话费价格设置--全恒
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=jccs")
	public String jccs(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int type= Integer.parseInt(request.getParameter("type"));
		JccsAction jccs=new JccsAction();
		String price = null;
		String title = null;
		if(type==1){
			title="一级代理领取二维码价格";
			price=jccs.getQrcodeProxyprice();
		}
		if(type==2)
		{
			title="二维码销售价格";
			price=jccs.getQrcodeprice();
		}
		if(type==3)
		{
			title="会员预约价格";
			price=jccs.getVipyuyueprice();
		}
		if(type==4)
		{
			title="置顶价格";
			price=jccs.getTopprice();
		}
		if(type==5)
		{
			title="轮播图价格";
			price=jccs.getLunboprice();
		}
		if(type==6)
		{
			title="会员绑定赠送分钟数";
			price=jccs.getBangdingnum();
		}
		if(type==7)
		{
			title="会员续费赠送分钟数";
			price=jccs.getXufeinum();
		}
		if(type==8)
		{
			title="免费电话充值单价设置";
			price=jccs.getChongzhihuafei();
		}
		Map map=new HashMap();
		map.put("price", price);
		map.put("title", title);
		map.put("type", type);
		request.setAttribute("map", map);
		return "/admin/jccs.jsp";
	}
	/**
	 * 编辑参数
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=editjccs")
	public String editjccs(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("来修改属性文件了");
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int type=Integer.parseInt(request.getParameter("type"));
		String price=request.getParameter("price");
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/classes/jccs.properties");	//路径
		System.out.println(path+"\t"+price+"\t"+type);
		Properties pro=new Properties();
		InputStream is=JccsAction.class.getResourceAsStream("/jccs.properties");	//读
		pro.load(is);
		if(type==1){
			pro.setProperty("qrcodeProxyprice", price.trim());
			JccsAction.qrcodeProxyprice=price.trim();
			
		}
		if(type==2)
		{
			pro.setProperty("qrcodeprice", price.trim());
			JccsAction.qrcodeprice=price.trim();
		}
		if(type==3)
		{
			pro.setProperty("vipyuyueprice", price.trim());
			JccsAction.vipyuyueprice=price.trim();
		}
		if(type==4)
		{
			pro.setProperty("topprice", price.trim());
			JccsAction.topprice=price.trim();
		}
		if(type==5)
		{
			pro.setProperty("lunboprice", price.trim());
			JccsAction.lunboprice=price.trim();
		}
		if(type==6)
		{
			pro.setProperty("bangdingnum", price.trim());
			JccsAction.bangdingnum=price.trim();
		}
		if(type==7)
		{
			pro.setProperty("xufeinum", price.trim());
			JccsAction.xufeinum=price.trim();
		}
		if(type==8)
		{
			pro.setProperty("chongzhihuafei", price.trim());
			JccsAction.chongzhihuafei=price.trim();
		}
		OutputStream out=new FileOutputStream(path);	//写
		pro.store(out, null);
		out.close();
		is.close();
		return null;
	}
}
