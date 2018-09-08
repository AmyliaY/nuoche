package com.shop.action.app;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Decoder;

import com.pojo.Userinfo;
import com.shop.service.app.AppLoginService;
import com.shop.service.app.AppOrderService;
import com.util.JsonFilter;
import com.util.MD5Util;

@Controller
@RequestMapping("/applogin.do")
public class AppLoginAction {
	@Autowired
	private AppLoginService appLoginService;
	@Autowired
	private HttpServletRequest request;
	
	
	@Autowired
	private AppOrderService appOrderService;
	/**
	 * 登录
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=applogin")
	public String applogin(HttpServletResponse response) throws IOException
	{
		String username=request.getParameter("username");
		String userpwd=request.getParameter("userpwd");
		String userpwd2 = MD5Util.getMD5(MD5Util.getMD5(userpwd + "sunjob")
				+ "sunjob");
		Userinfo userinfo=appLoginService.applogin(username,userpwd2);
		
		request.getSession().setAttribute("userinfo", userinfo);
		if(userinfo!=null){
			JsonConfig config=new JsonConfig();
			JsonFilter.ignoredSet(config);
			String json = JSONObject.fromObject(userinfo,config).toString();
			return json;
		}else{
			response.getWriter().print("请先登录");
		}
		return null;
	}
	/**
	 * 得到会员信息
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=getUsersinfo")
	public String getUsersinfo(HttpServletResponse response) throws IOException
	{
		Userinfo userinfo=(Userinfo) request.getSession().getAttribute("userinfo");
		if(userinfo==null)
		{
			return "请先登录";
		}
		//System.out.println(userinfo.getUsersId());
		userinfo = appOrderService.findUserByIdNotCache(userinfo.getUsersId());
		request.getSession().setAttribute("userinfo",userinfo);
		//System.out.println(userinfo.getUsersId());
		JsonConfig config=new JsonConfig();
		JsonFilter.ignoredSet(config);
		String json = JSONObject.fromObject(userinfo,config).toString();
		return json;
	}
	/**
	 * 注销销毁session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="p=xiaohuisession")
	public String xiaohuisession()
	{
		System.out.println("注销");
		request.getSession().removeAttribute("userinfo");
		return "注销成功";
	}
	/**
	 * 上传头像
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(params="p=uploadHeadimg")
	public String uploadHeadimg(HttpServletResponse response) throws IOException
	{
		String path=request.getSession().getServletContext().getRealPath("/admin/images/tx");// 上传到指定目录
		int id = Integer.parseInt(request.getParameter("id"));	//会员ID
		String imgdata=request.getParameter("imgdata");	//图片
		String imgPath=request.getParameter("imgPath");	//图片路径
		String userPhone=request.getParameter("userPhone");	//用户手机号码
		//System.out.println("imgdata:"+imgdata);
		//System.out.println("imgPath:"+imgPath);
		
		int index=imgPath.lastIndexOf(".");
		String ss=imgPath.substring(index);
		String newHeadimg=userPhone+"-"+System.currentTimeMillis()+ss;//图片名称
		//System.out.println(path+"/"+newHeadimg);
		
		//删除文件夹中之前的头像图片
        File folder = new File(path);
		File[] files = folder.listFiles();
		for(File f:files){
			if(f.getName().substring(0,11).equals(userPhone)){
				f.delete();
			}
		}
		
		 //Base64解码  
		BASE64Decoder decoder = new BASE64Decoder();  
		
        byte[] b = decoder.decodeBuffer(imgdata);  
        for(int i=0;i<b.length;++i)  
        {  
            if(b[i]<0)  
            {//调整异常数据  
                b[i]+=256;  
            }  
        }  
        //生成jpeg图片  
        File file=new File(path+"/"+newHeadimg);
        OutputStream out = new FileOutputStream(file);      
        out.write(b);  
        out.flush();  
        out.close();  
        
		
		boolean f=appLoginService.uploadHeadimg(id,newHeadimg);
		if(f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
//		System.out.println(newHeadimg);
//		System.out.println("会员ID："+id);
//		System.out.println("头衔："+imgdata);
		return null;
	}
}
