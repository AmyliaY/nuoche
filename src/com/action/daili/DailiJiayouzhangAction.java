package com.action.daili;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.hibernate.annotations.Parent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import weixin.popular.api.ShorturlAPI;
import weixin.popular.api.TokenAPI;
import weixin.popular.bean.Token;

import com.action.WeixinConfig;
import com.alibaba.fastjson.JSONObject;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.Admin;
import com.pojo.JiayouEmp;
import com.pojo.JiayouStation;
import com.pojo.JiayouZhekou;
import com.pojo.Proxy;
import com.service.daili.DailiJiayouService;
import com.util.StringUtil;
import com.util.T2DMa;
import com.util.URLManager;

@Controller
@RequestMapping("/daili_jiayouzhang.do")
public class DailiJiayouzhangAction {

	@Autowired
	private DailiJiayouService dailiJiayouService;

	@Autowired
	private HttpServletRequest request;

	/**
	 * 修改VIP用户等级
	 * 
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	@RequestMapping(params = "method=updategrade")
	public void updategrade(HttpServletRequest request,
			HttpServletResponse response) throws FileNotFoundException, IOException {
		
		
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			response.getWriter().print("403");
			return;
		}

		String uid = (request.getParameter("uid"));
		String ostyle = request.getParameter("ostyle");
		String vgrade = request.getParameter("vgrade");
		vgrade = ostyle + vgrade;
		
		String result = WeixinGetAccessTokenListen.SERVER_REAL_PATH
		+ "/WEB-INF/classes/vipgrade" + proxy.getId() + ".properties";
		
		Properties prop = new Properties();
		prop.load(new FileInputStream(result));
		int vipgrade = Integer.parseInt(vgrade);
		int osyle2 = Integer.parseInt(ostyle);
		int vfanxian = Integer.parseInt(prop.get(vipgrade + "rt").toString());
		int vfanxian2 = Integer.parseInt(prop.get(vipgrade + "cz").toString());

		float vlimit = Float.parseFloat(prop.get(vgrade).toString());
		int i = dailiJiayouService.updategrade(uid, osyle2, vipgrade, vfanxian,
				vfanxian2, vlimit);

		JSONObject jo = new JSONObject();

		jo.put("flag", i);

		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 修改VIP用户状态
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(params = "method=updatvipstatus")
	public void updatvipstatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			response.getWriter().print("403");
			return;
		}

		int vid = Integer.parseInt(request.getParameter("vid"));
		int vstatus = Integer.parseInt(request.getParameter("vstatus"));
		int i = dailiJiayouService.updatevipstatus(vstatus, vid);
		JSONObject jo = new JSONObject();
		jo.put("flag", i);

		response.getWriter().print(jo);

	}

	@RequestMapping(params = "method=getvipbyMoney")
	public String getVipbyMoney(HttpServletRequest request,
			HttpServletResponse response) {
		float money = 0;
		Map map = null;
		if (request.getParameter("money") == null) {
			money = Float.parseFloat(request.getParameter("money2"));
			map = dailiJiayouService.getVipByMoney(money, 1);
		} else {
			money = Float.parseFloat(request.getParameter("money"));
			map = dailiJiayouService.getVipByMoney(money, 0);
		}

		request.setAttribute("map", map);
		return "/daili/jiayouzhang/vip_list.jsp";

	}

	/**
	 * 加油返现
	 * 
	 * @param gid
	 *            加油站编号
	 * @param c
	 *            柴油折扣
	 * @param q
	 *            汽油折扣
	 * @return success 成功
	 */
	@RequestMapping(params = "p=jiayouFanxian")
	@ResponseBody
	public String jiayouFanxian(int gid, float c, float q) {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "没有权限";
		}

		JiayouStation station = dailiJiayouService.getStationById(gid);
		if (station == null)
			return "内部错误:" + 404;

		Proxy proxy2 = station.getProxy();
		if (proxy2 == null || proxy2.getId().equals(proxy.getId()) == false)
			return "内部错误:" + 405;

		station.setChai_fanxian(c / 100);
		station.setQiyou_fanxian(q / 100);
		dailiJiayouService.updateStation(station);

		return "success";
	}

	/**
	 * 获取vip用户列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=getviplist")
	public String getVipList(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}

		response.setCharacterEncoding("utf-8");

		int status = -100;

		if (request.getParameter("status") != null)
			status = Integer.parseInt(request.getParameter("status"));

		int page = 1;
		int size = 10;
		String pa = request.getParameter("page");
		if (pa != null) {
			page = Integer.parseInt(pa);
		}
		Map map = dailiJiayouService.getVipList(page, size, status);
		request.setAttribute("map", map);
		System.out.println(map);
		request.setAttribute("status", status);
		// request.getSession().setAttribute("role", user.getArole());
		return "/daili/jiayouzhang/vip_list.jsp";
	}

	/**
	 * 更新VIP等级设置
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=updatvipsetting")
	public void updatvipsetting(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return;
		}

		String vipgrade = request.getParameter("vipgrade");
		String remo = request.getParameter("remo");
		String recz = request.getParameter("recz");
		String index = request.getParameter("index");
		String result = WeixinGetAccessTokenListen.SERVER_REAL_PATH
				+ "/WEB-INF/classes/vipgrade" + proxy.getId() + ".properties";
		System.out.println(result);
		Properties prop = new Properties();
		FileInputStream fis = null;

		try {
			fis = new FileInputStream(result);
			prop.load(fis);

			fis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FileOutputStream fos = null;
		JSONObject jo = new JSONObject();
		dailiJiayouService.updateSomeStatus(Float.parseFloat(vipgrade), Integer
				.parseInt(remo), Integer.parseInt(recz), Integer
				.parseInt(index));
		try {
			fos = new FileOutputStream(result);
			prop.setProperty(index, vipgrade);
			prop.setProperty(index + "rt", remo);
			prop.setProperty(index + "cz", recz);
			prop.store(fos, "Copyright (c) Boxcode Studio");
			fos.close();
			jo.put("flag", 1);
			jo.put("vipgrade", vipgrade);
			jo.put("remo", remo);
			jo.put("recz", recz);

		} catch (FileNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 获取vip等级设置
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=vipSetting")
	public String vipSetting() throws IOException {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}

		Properties prop = new Properties();
		String path = WeixinGetAccessTokenListen.SERVER_REAL_PATH
				+ "/WEB-INF/classes/vipgrade" + proxy.getId() + ".properties";
		File file = new File(path);
		if (file.exists() == false)
			file.createNewFile();
		prop.load(new FileInputStream(path));

		request.setAttribute("o11", prop.getProperty("11"));
		request.setAttribute("o12", prop.getProperty("12"));
		request.setAttribute("o13", prop.getProperty("13"));
		request.setAttribute("o21", prop.getProperty("21"));
		request.setAttribute("o22", prop.getProperty("22"));
		request.setAttribute("o23", prop.getProperty("23"));
		request.setAttribute("o31", prop.getProperty("31"));
		request.setAttribute("o32", prop.getProperty("32"));
		request.setAttribute("o33", prop.getProperty("33"));

		request.setAttribute("o11rt", prop.getProperty("11rt"));
		request.setAttribute("o12rt", prop.getProperty("12rt"));
		request.setAttribute("o13rt", prop.getProperty("13rt"));
		request.setAttribute("o21rt", prop.getProperty("21rt"));
		request.setAttribute("o22rt", prop.getProperty("22rt"));
		request.setAttribute("o23rt", prop.getProperty("23rt"));
		request.setAttribute("o31rt", prop.getProperty("31rt"));
		request.setAttribute("o32rt", prop.getProperty("32rt"));
		request.setAttribute("o33rt", prop.getProperty("33rt"));

		request.setAttribute("o11cz", prop.getProperty("11cz"));
		request.setAttribute("o12cz", prop.getProperty("12cz"));
		request.setAttribute("o13cz", prop.getProperty("13cz"));
		request.setAttribute("o21cz", prop.getProperty("21cz"));
		request.setAttribute("o22cz", prop.getProperty("22cz"));
		request.setAttribute("o23cz", prop.getProperty("23cz"));
		request.setAttribute("o31cz", prop.getProperty("31cz"));
		request.setAttribute("o32cz", prop.getProperty("32cz"));
		request.setAttribute("o33cz", prop.getProperty("33cz"));

		return "/daili/jiayouzhang/vip_setting.jsp";
	}

	/**
	 * 发红包（优惠卷)
	 * 
	 * @param date1
	 * @param date2
	 * @param money1
	 * @param money2
	 * @param gid
	 * @param type
	 * @return
	 */
	@RequestMapping(params = "p=fahongbao")
	@ResponseBody
	public String fahongbao(String date1, String date2, String money1,
			String money2, String gid, String type) {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "非法访问";
		}

		if (StringUtil.isDigit(type) == false
				|| StringUtil.isDigit(gid) == false
				|| StringUtil.isDigit(date1) == false
				|| StringUtil.isDigit(date2) == false
				|| StringUtil.isDigit(money1) == false
				|| StringUtil.isDigit(money2) == false) {
			return "只能是数字";
		}

		if (date1.startsWith("-") || date2.startsWith("-")
				|| money1.startsWith("-") || money2.startsWith("-")) {
			return "不能是负数";
		}

		int _date1 = Integer.parseInt(date1);
		int _date2 = Integer.parseInt(date2);
		float _money1 = Float.parseFloat(money1);
		float _money2 = Float.parseFloat(money2);

		dailiJiayouService.fahongbao(gid, type, _date1, _money1, _money2,
				_date2);

		return "success";
	}

	/**
	 * 获取多久没来加油的用户
	 * 
	 * @param gid
	 *            加油站
	 * @param date
	 *            多少天没来加油
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping(params = "p=getUser")
	public String getUser(String gid,
			@RequestParam(defaultValue = "0") Integer date,
			@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "50") Integer size) {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}

		List list = dailiJiayouService.getStationByProxy(proxy.getId());
		if (date == null)
			date = 0;

		Map map = dailiJiayouService.getLastJiayouUser(gid, date, page, size);
		map.put("listStation", list);
		request.setAttribute("map", map);
		return "/daili/jiayouzhang/fahongbao.jsp";
	}

	@RequestMapping(params = "p=order")
	public String order(String beginTime, String endTime, String station,
			String empid, String orderId,
			@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer size) {
		/**
		 * 加油记录
		 * 
		 * @param beginTime
		 *            开始时间
		 * @param endTime
		 *            结束时间
		 * @param station
		 *            加油站
		 * @param empid
		 *            员工编号
		 * @param orderId
		 *            订单号
		 * @param page
		 * @param size
		 * @return
		 */

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}

		List list = dailiJiayouService.getStationByProxy(proxy.getId());

		Map map = dailiJiayouService.jiayoujilu(proxy.getId(), beginTime,
				endTime, station, empid, orderId, page, size);
		map.put("listStation", list);
		request.setAttribute("map", map);
		return "/daili/jiayouzhang/order.jsp";
	}

	/**
	 * 修改加油站
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=update_jyz")
	public String update_jyz() {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("gname");// 名称
		String address = request.getParameter("gaddress");// 地址
		String payUID = request.getParameter("gzuobiaox");// 支付用户名
		String payToken = request.getParameter("gzuobiaoy");// 支付密码
		String status = request.getParameter("status");// 状态
		JiayouStation jiayouStation = new JiayouStation();
		jiayouStation.setGid(id);
		jiayouStation.setGname(name);
		jiayouStation.setGaddress(address);
		jiayouStation.setUid(payUID);
		jiayouStation.setToken(payToken);
		jiayouStation.setProxy(proxy);
		jiayouStation.setGstatus(Integer.parseInt(status));
		dailiJiayouService.updateStation(jiayouStation);
		return "redirect:/daili_jiayouzhang.do?p=getStationByProxy";
	}

	/**
	 * 去修改加油站界面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "p=getJYZById")
	public String getJYZById(int id) {
		JiayouStation station = dailiJiayouService.getStationById(id);
		request.setAttribute("s", station);
		return "/daili/jiayouzhang/update_jiayouzhan.jsp";
	}

	/**
	 * 新增加油站
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=add_jyz")
	public String add_jyz() {
		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}

		String name = request.getParameter("gname");// 名称
		String address = request.getParameter("gaddress");// 地址
		String payUID = request.getParameter("gzuobiaox");// 支付用户名
		String payToken = request.getParameter("gzuobiaoy");// 支付密码
		JiayouStation jiayouStation = new JiayouStation();
		jiayouStation.setGname(name);
		jiayouStation.setGaddress(address);
		jiayouStation.setUid(payUID);
		jiayouStation.setToken(payToken);
		jiayouStation.setProxy(proxy);
		jiayouStation.setGstatus(1);
		dailiJiayouService.addStation(jiayouStation);
		return "redirect:/daili_jiayouzhang.do?p=getStationByProxy";
	}

	/**
	 * 根据代理获取加没站信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "p=getStationByProxy")
	public String getStationByProxy() {

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		if (proxy == null) {
			return "/";
		}
		System.out.println(proxy.getId());
		List list = dailiJiayouService.getStationByProxy(proxy.getId());
		System.out.println(list);
		request.setAttribute("list", list);
		return "/daili/jiayouzhang/jiayouzhan.jsp";
	}

	/**
	 * 获取油信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=getAllOilInfo")
	public String getAllOilInfo(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return "/";
		}
		int choose = 0;

		if (user != null) {

			if (request.getParameter("id") != null)
				choose = Integer.parseInt(request.getParameter("id"));

			Properties ostyle = new Properties();
			InputStream fis = null;

			try {
				fis = DailiJiayouzhangAction.class
						.getResourceAsStream("/ostyle.properties");
				ostyle.load(fis);

			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Map map = new HashMap();

			for (int i = 1; i < ostyle.size() + 1; i++) {

				map.put(String.valueOf(i), ostyle
						.getProperty(String.valueOf(i)));

			}
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<JiayouZhekou> oilList = dailiJiayouService.getAllOilInfo(0,
					choose);
			if (oilList != null) {
				for (JiayouZhekou oil : oilList) {
					oil.setOstyle2(String.valueOf(oil.getOstyle()));
				}
			}
			request.setAttribute("ostyle", map);
			request.setAttribute("oilList", oilList);
			return "/daili/jiayouzhang/oil_guanli.jsp?id=" + choose;

		} else

			return "/";

	}

	/**
	 * 所有员工
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params = "p=getAllEmp")
	public void getAllEmp(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}

		response.setContentType("text/html;charset=utf-8");

		int i = 0;
		int page = 1;
		int size = 7;
		int yeShu = 0;

		if (request.getParameter("page") != null) {
			yeShu = Integer.parseInt(request.getParameter("page"));
		}
		if (yeShu > 1) {
			page = yeShu;
		}
		int gid = Integer.parseInt(request.getParameter("gid"));

		String gestatus = request.getParameter("gestatus");
		Map map = dailiJiayouService
				.getAllGasEmpInfo(page, size, gid, gestatus);
		// System.out.println(map);
		List<JiayouEmp> gelist = null;
		if (map.get("geList") != null) {
			gelist = (List<JiayouEmp>) map.get("geList");
			for (JiayouEmp gasEmp : gelist) {
				gasEmp.setGsid(gelist.get(i).getJiayouStation().getGid());
				gasEmp.setGsname(gelist.get(i).getJiayouStation().getGname());
				i++;
			}
		}

		JsonConfig config = new JsonConfig();
		config.setExcludes(new String[] { "jiayouStation", "gasDetails" });
		// JsonFilter.ignoredSet(config);
		JSONArray str = JSONArray.fromObject(map, config);

		try {
			System.out.println(str.toString());
			response.getWriter().print(str.toString());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 修改员工
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=updateJiayouEmp")
	public void updateJiayouEmp(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}

		response.setContentType("text/html;charset=utf-8");

		int geid = Integer.parseInt(request.getParameter("geid"));
		String gename = request.getParameter("gename");
		if (gename != null) {
			try {
				gename = new String(gename.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String gecard = request.getParameter("gecard");
		String geaddress = request.getParameter("geaddress");
		if (geaddress != null) {
			try {
				geaddress = new String(geaddress.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String genumber = request.getParameter("genumber");
		if (genumber != null) {
			try {
				genumber = new String(genumber.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String getime = request.getParameter("getime");
		String geover = request.getParameter("geover");

		int i = dailiJiayouService.updateJiayouEmp(geid, gename, gecard,
				geaddress, genumber);
		JSONObject jo = null;
		if (i == 1) {
			jo = new JSONObject();

			jo.put("flag", i);
			jo.put("gename", gename);
			jo.put("gecard", gecard);
			jo.put("geaddress", geaddress);
			jo.put("genumber", genumber);
			jo.put("geid", geid);
		}

		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 得所有加油站
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=getAllGs")
	public void getAllGs(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}

		response.setContentType("text/html;charset=utf-8");

		List<JiayouStation> list = dailiJiayouService.getStationByProxy(user
				.getId());
		JSONArray ja = new JSONArray();
		for (JiayouStation gasStation : list) {
			JSONObject jo = new JSONObject();
			jo.put("gid", gasStation.getGid());
			jo.put("gname", gasStation.getGname());
			ja.add(jo);
		}

		try {
			response.getWriter().print(ja.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 新增员工
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=addJiayouEmp")
	public String addJiayouEmp(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return "/";
		}

		String gename = request.getParameter("newname");
		if (gename != null) {
			try {
				gename = new String(gename.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String gecard = request.getParameter("newcard");
		String geaddress = request.getParameter("newaddress");
		String genumber = request.getParameter("newnumber");
		if (geaddress != null) {
			try {
				geaddress = new String(geaddress.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (genumber != null) {
			try {
				genumber = new String(genumber.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int gid = Integer.parseInt(request.getParameter("id"));

		dailiJiayouService.addJiayouEmp(gename, genumber, gecard, geaddress,
				gid);

		return null;

	}

	/**
	 * 修改加油站状态
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=updateGestatus")
	public void updateGestatus(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}
		int geid = Integer.parseInt(request.getParameter("geid"));
		int gestatus = Integer.parseInt(request.getParameter("gestatus"));

		if (gestatus == 1)
			gestatus = 0;
		else
			gestatus = 1;

		int i = dailiJiayouService.updateGestatus(gestatus, geid);

		JSONObject jo = null;
		if (i == 1) {
			jo = new JSONObject();
			jo.put("geid", geid);
			jo.put("gestatus", gestatus);
			jo.put("flag", i);
		}
		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * 创建二维码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "method=createQrcode")
	public String createQrcode(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return "/";
		}

		int geid = Integer.parseInt(request.getParameter("geid"));
		String imgPath = request.getSession().getServletContext().getRealPath(
				"/")
				+ "qrcode/" + geid + ".png";
		String imgPath2 = request.getSession().getServletContext().getRealPath(
				"/")
				+ "qrcode/" + geid + "2.png";
		String url = URLManager.getServerURL(request)
				+ "/weixin_jiayou.do?p=saoma&id=" + geid + "&type=1";
		String url2 = URLManager.getServerURL(request)
				+ "/weixin_jiayou.do?p=saoma&id=" + geid + "&type=2";
		// String newUrl = null;
		// String newUrl2 = null;
		// try {
		// newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
		// + WeixinConfig.APPID
		// + "&redirect_uri="
		// + URLEncoder.encode(url, "utf-8")
		// + "&response_type=code&scope=snsapi_base&state=2#wechat_redirect";
		// newUrl2 =
		// "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
		// + WeixinConfig.APPID
		// + "&redirect_uri="
		// + URLEncoder.encode(url2, "utf-8")
		// + "&response_type=code&scope=snsapi_base&state=2#wechat_redirect";
		// } catch (UnsupportedEncodingException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		String appid = WeixinConfig.APPID;
		String secret = WeixinConfig.APPSECRET;
		Token token = new TokenAPI().token(appid, secret);
		String access_token = token.getAccess_token();
		ShorturlAPI shorturlAPI = new ShorturlAPI();

		String shortUrl = shorturlAPI.shorturl(access_token, url)
				.getShort_url();
		String shortUrl2 = shorturlAPI.shorturl(access_token, url2)
				.getShort_url();
		T2DMa t2dMa = new T2DMa();
		t2dMa.encoderQRCode(url, imgPath, "png");
		t2dMa.encoderQRCode(url2, imgPath2, "png");

		dailiJiayouService.addQrCode(geid + ".png", geid + "2.png", geid);

		return null;

	}

	/**
	 * 评价
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "method=pingjia")
	public void rating(HttpServletRequest request, HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}

		int geid = Integer.parseInt(request.getParameter("geid"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		int i = dailiJiayouService.updateRating(geid, rating);
		JSONObject jo = null;
		jo = new JSONObject();
		jo.put("flag", i);

		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 油类管理
	@RequestMapping(params = "method=oilList")
	public String oilList(HttpServletRequest request,
			HttpServletResponse response) {

		Timer timer = new Timer();
		TimerTask timerTask = new TimerTask() {

			@Override
			public void run() {

			}
		};
		timer.schedule(timerTask, 1000 * 60 * 5);

		Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		int id = Integer.parseInt(request.getParameter("id"));
		if (proxy != null) {
			int choose = 0;
			if (request.getParameter("choose") != null)
				choose = Integer.parseInt(request.getParameter("choose"));

			String result = null;

			// 取properties
			Properties ostyle = new Properties();
			InputStream fis = null;

			try {
				fis = DailiJiayouzhangAction.class
						.getResourceAsStream("/ostyle.properties");
				ostyle.load(fis);

			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			Map map = new HashMap();

			for (int i = 1; i < ostyle.size() + 1; i++) {

				map.put(String.valueOf(i), ostyle
						.getProperty(String.valueOf(i)));

			}
			try {
				fis.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			List<JiayouZhekou> oilList = dailiJiayouService
					.getAllOilInfo(1, id);
			if (oilList != null) {
				for (JiayouZhekou oil : oilList) {
					oil.setOstyle2(String.valueOf(oil.getOstyle()));
				}
			}
			request.setAttribute("ostyle", map);
			request.setAttribute("oilList", oilList);
			return "/daili/jiayouzhang/";

		} else

			return "/";

	}

	@RequestMapping(params = "method=addOil")
	public void addOil(HttpServletRequest request, HttpServletResponse response) {

		String oname = request.getParameter("oname");
		if (oname != null) {
			try {
				oname = new String(oname.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		int ostyle = Integer.parseInt(request.getParameter("ostyle").toString()
				.substring(0, 1));

		int gid = Integer.parseInt(request.getParameter("gid"));
		Float oprice = Float.parseFloat(request.getParameter("oprice"));
		Float zhekou = Float.parseFloat(request.getParameter("zhegou"));
		String odetail = request.getParameter("odetail");
		if (odetail != null) {
			try {
				odetail = new String(odetail.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		dailiJiayouService.addOil(oname, oprice, odetail, ostyle, gid, zhekou);

	}

	@RequestMapping(params = "method=updateOil")
	public void updateOil(HttpServletRequest request,
			HttpServletResponse response) {

		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {
			return;
		}

		int oid = Integer.parseInt(request.getParameter("oid"));
		float zhekou = Float.parseFloat(request.getParameter("zhekou"));
		String oname = request.getParameter("oname");
		if (oname != null) {
			try {
				oname = new String(oname.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String ostyle = request.getParameter("ostyle");
		String ostyle2 = ostyle.substring(ostyle.length() - 1, ostyle.length());
		int num = Integer.parseInt(ostyle2);
		Float oprice = Float.parseFloat(request.getParameter("oprice"));

		String odetail = request.getParameter("odetail");
		if (odetail != null) {
			try {
				odetail = new String(odetail.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int i = dailiJiayouService.updateOil(oname, oprice, odetail, oid, num,
				zhekou);
		JSONObject jo = new JSONObject();
		jo.put("flag", i);
		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@RequestMapping(params = "method=updateOstatus")
	public void updateOstatus(HttpServletRequest request,
			HttpServletResponse response) {
		Proxy user = (Proxy) request.getSession().getAttribute("proxy");
		if (user == null) {

			return;
		}
		int oid = Integer.parseInt(request.getParameter("oid"));
		int ostatus = Integer.parseInt(request.getParameter("ostatus"));
		int i = dailiJiayouService.updateOstatus(oid, ostatus);
		JSONObject jo = new JSONObject();
		jo.put("flag", i);
		try {
			response.getWriter().print(jo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
