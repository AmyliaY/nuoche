package com.action.wap;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Business;
import com.pojo.Proxy;
import com.pojo.Service;
import com.pojo.Yuyue;
import com.service.wap.WapServiceManagerService;
import com.util.JsonFilter;
import com.util.StringUtil;
import com.util.Upload;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 预约商城，服务管理
 * @author 全恒
 *
 */

@Controller
@RequestMapping("/sjyuyueservice.do")
public class WapServiceManager {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WapServiceManagerService wapService;
	
	/**
	 * 查询服务
	 * 返回：json
	 */
	@RequestMapping(params="p=servicelist")
	@ResponseBody
	public String serviceList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//得到当前商家
		Business wapbusiness = (Business)request.getSession().getAttribute("wapbusiness");
		//System.out.println("来了!!!!!!!!!!!!!!!"+wapbusiness.getOpenid());
		if(wapbusiness == null){
			return "";
		}
		
		int page=1;		//页数
		int size=5;		//大小
		
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.trim().length()>0)
			page=Integer.parseInt(pageString);
		
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.trim().length()>0)
			size=Integer.parseInt(sizeString);
		
		int sum=wapService.getSum(size, page, wapbusiness.getId());
		System.out.println("sum:"+sum);
		int count=sum%size==0 ? sum/size : sum/size+1;//总页数
		if(page<1){
			page=1;
		}
		List<Service> servicelist=wapService.getServiceList(wapbusiness.getId(), size, page);
		Map map=new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("sum", sum);
		map.put("count", count);
		map.put("servicelist", servicelist);
		
		JsonConfig config=new JsonConfig();
		net.sf.json.JSONObject object = new net.sf.json.JSONObject();
		JsonFilter.ignoredSet(config);
		object.putAll(map, config);
		String json=object.toString();
		System.out.println(json);
		
		return json;
	}
	
	
	/**
	 * 进入新增服务页面
	 * 返回：新增页面
	 */
	@RequestMapping(params="p=goaddservice")
	public String gotoAddService(HttpServletResponse response) throws Exception{
		Business wapbusiness = (Business)request.getSession().getAttribute("wapbusiness");
		if(wapbusiness == null){
			return "";
		}
		
		//查服务类型
		List servicetypelisting = wapService.findServiceType();
		request.setAttribute("servicetypelisting", servicetypelisting);
		
		//business不为空，则跳到新增服务页面
		return "wap/shop/addservice.jsp";
	}
	
	
	/**
	 * 新增服务
	 * 刷新服务列表
	 */
	@RequestMapping(params="p=addservice")
	@ResponseBody
	public String addService(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Business wapbusiness = (Business)request.getSession().getAttribute("wapbusiness");
		if (wapbusiness == null) {
			return "";
		}
		String weixinhao = (String) request.getSession().getAttribute("weixinhao");
		
		String path = request.getSession().getServletContext().getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		
		Integer stid = Integer.parseInt(map.get("servicetype"));
		String stitle = map.get("title");
		String cimages = map.get("cimages");
		Double scprice = Double.parseDouble(map.get("shichangPrice"));
		Double yyprice = Double.parseDouble(map.get("yuyuePrice"));
		Integer time = Integer.parseInt(map.get("time"));
		String describe = map.get("describe");
		System.out.println(cimages);
		wapService.addservice(wapbusiness.getId(), stid, stitle, describe, scprice, yyprice, time, cimages);
		
		//返回服务列表
		return weixinhao;
	}
	
	/**
	 * 进入编辑服务页面
	 * 1.查询所要编辑服务的详细信息
	 * 2.进入编辑页面
	 */
	@RequestMapping(params="p=goeditorservice")
	public String gotoEditorService(HttpServletResponse response) throws Exception{
		Business wapbusiness = (Business)request.getSession().getAttribute("wapbusiness");
		if(wapbusiness == null){
			return "";
		}
		//business不为空，则根据id查询服务详情，放入缓存，跳到编辑服务页面
		Integer id = Integer.parseInt((String) request.getParameter("id"));
		//查服务类型
		List servicetypelisting = wapService.findServiceType();
		request.setAttribute("servicetypelisting", servicetypelisting);
		//则根据id查询服务详情
		Service service = wapService.editserviceview(id);
		request.setAttribute("editservice", service);
		return "/wap/shop/serviceedit.jsp";
	}
	
	/**
	 * 编辑服务
	 * 修改数据库
	 * 返回服务列表
	 */
	@RequestMapping(params="p=editorservice")
	@ResponseBody
	public String editorService(HttpServletResponse response) throws Exception{
		Business wapbusiness = (Business)request.getSession().getAttribute("wapbusiness");
		if (wapbusiness == null) {
			return "";
		}
		String weixinhao = (String) request.getSession().getAttribute("weixinhao");

		String path = request.getSession().getServletContext()
				.getRealPath("/daili/images/lunboimg");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		//System.out.println("+++++++++++++++++++++++"+map.get("serviceid"));
		int id = Integer.parseInt(map.get("serviceid"));
		Integer servicetype = Integer.parseInt(map.get("servicetype"));
		String stitle = map.get("title");
		Double scprice = Double.parseDouble(map.get("shichangPrice"));
		Double yyprice = Double.parseDouble(map.get("yuyuePrice"));
		Integer time = Integer.parseInt(map.get("time"));
		String describe = map.get("describe");
		
		String cimages = map.get("cimages");
		String delLunboimages = map.get("delLunboimages");
		if (cimages == null) {
			cimages = map.get("oldLunboimages");
		} else {
			String imgPath = request.getSession().getServletContext()
					.getRealPath("/daili/images/lunboimg");
			File folder = new File(imgPath);
			File[] files = folder.listFiles();
			for (File f : files) {
				if (f.getName().equals(delLunboimages)) {
					f.delete();
				}
			}
		}
		wapService.editservice(id, stitle, scprice, yyprice, time, servicetype, describe, cimages);
		return weixinhao;
	}
	
	
	/**
	 * 上下架
	 */
	@RequestMapping(params="p=updatestatus")
	public String updateStatus(HttpServletResponse response) throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		Service Service = wapService.updatestatus(id);
		response.getWriter().print(Service.getStatus());
		return null;
		
	}
	
	
}
