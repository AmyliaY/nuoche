package com.service.daili;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.JiayouPrinterDAO;
import com.dao.JiayouStationDAO;
import com.pojo.JiayouPrinter;
import com.pojo.JiayouStation;
import com.util.MD5Util;
import com.util.PropertiesManager;

@Service
public class PrinterBackService {
	
	@Autowired
	private  JiayouPrinterDAO printerDAO;
	@Autowired
	private  JiayouStationDAO gasStationDAO;
	@Autowired
	private HqlDAO hqldao;
	
	public String changePrinterSta(int id) {
		JiayouPrinter printer = printerDAO.findById(id);
		printer.setPstatus(printer.getPstatus()?false:true);
		return printer.getPstatus()?"1":"0";
	}
	
	public Map getAllPrinter(int page, int size) {
		List parameterList = new ArrayList();
		String hqlSum = "select count(*) from JiayouPrinter " ;
		
		int sum = (int) hqldao.unique(hqlSum, parameterList.toArray());

		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page > count)
			page = count;
		if (page < 1)
			page = 1;
		String hql = "from JiayouPrinter";
		List list = hqldao.pageQuery(hql, page, size, parameterList.toArray());
		Map map = new HashMap();
		map.put("size", size);
		map.put("count", count);
		map.put("page", page);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	
	public List<JiayouPrinter> getPrinter() {
		String hql = "from JiayouPrinter";
		
		List parameterList = null;
		parameterList = hqldao.findByHQL(hql);
		if(parameterList.size()>0)
			return parameterList;
		else
			return null;

	}

	public String addNewPrinter(String mcode, String pname, String gid,
			String msign) throws IOException {
		// TODO Auto-generated method stub
		String sign = regNewPrinter(mcode, pname, msign);
		//System.out.println(sign.length());
		if (sign.length()!=32) {
			return sign;
		}
		JiayouPrinter printer = new JiayouPrinter();
		printer.setJiayouStation(gasStationDAO.findById(Integer.parseInt(gid)));
		printer.setMcode(mcode);
		printer.setMsign(msign);
		printer.setPname(pname);
		
		printer.setPsign(sign);
		printer.setPstatus(false);
		printerDAO.merge(printer);
		return "添加成功!";
	}
	//注册
	private  String regNewPrinter(String mcode, String pname,
			String msign) throws IOException {
		String[] key = {"partner","apikey","username","mobilephone"};
		PropertiesManager propertiesManager = new PropertiesManager();
		JSONArray ja=propertiesManager.getProperties("printerUserCfg", key);
		String partner=ja.getJSONObject(0).getString("partner");
		String apikey=ja.getJSONObject(0).getString("apikey");
		String username=ja.getJSONObject(0).getString("username");
		String mobilephone=ja.getJSONObject(0).getString("mobilephone");
		StringBuffer sb = new StringBuffer();
		sb.append(apikey);
		sb.append("partner"+partner);
		sb.append("machine_code"+mcode);
		sb.append("username"+username);
		sb.append("printname"+pname);
		sb.append("mobilephone"+mobilephone);
		sb.append("msign"+msign+msign);
		String sign = MD5Util.getMD5(sb.toString());
		switch (postRegMsg(partner, mcode, username, pname, mobilephone, msign, sign)) {
		case 1:
			System.out.println("添加成功!");
			return sign;
		case 2:
			System.out.println("重复!");
			return "打印机重复!添加失败！";
		case 3:
			System.out.println("添加失败!");
			return "添加失败!";
		case 4:
			System.out.println("添加失败!");
			return "添加失败!";
		case 5:
			System.out.println("用户验证失败!");
			return "用户验证失败!";
		case 6:
			System.out.println("非法终端号!");
			return "非法终端号!";
		default:
			break;
		}
		return sign;
		
	}
	//发送注册
	private  int postRegMsg(String partner,String machine_code,String username,String printername,String mobilephone,String msign,String sign) throws IOException {
		
		HttpClient httpClient = new HttpClient();
		PostMethod post = new PostMethod("http://open.10ss.net:8888/addprint.php"); 
		post.addParameter("partner", partner);
		post.addParameter("machine_code",machine_code);
		post.addParameter("username",username);
		post.addParameter("printname",printername);
		post.addParameter("mobilephone",mobilephone);
		post.addParameter("sign",sign);
		post.addParameter("msign",msign);
		HttpMethodParams param = post.getParams();  
        param.setContentCharset("UTF-8");
        httpClient.executeMethod(post);
        String result=null;
        if (post.getStatusCode()==200) {
			try {
				result=post.getResponseBodyAsString();
				System.out.println(result);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return Integer.parseInt(result);
		}
        
		return 0;
	}
	
	//保存配置
	public void addNewUserCfg(String partner, String apikey, String username,
			String mobilephone) throws IOException {
		// TODO Auto-generated method stub
		PropertiesManager propertiesManager = new PropertiesManager();
		Map<String, String> map= new HashMap<String, String>();
		map.put("partner", partner);
		map.put("apikey", apikey);
		map.put("username", username);
		map.put("mobilephone", mobilephone);
		propertiesManager.setProperties("printerUserCfg", map);
	}
	//获取配置
	public String getPrinterUserCfg() throws IOException {
		String[] key = {"partner","apikey","username","mobilephone"};
		PropertiesManager propertiesManager = new PropertiesManager();
		return propertiesManager.getProperties("printerUserCfg", key).toString();
	}
	public static void main(String[] args) throws IOException {
		//System.out.println(regNewPrinter("4004513922", "天府广场店", "cbfc6zuebbvd"));
	}

	public void changest(String code, String gsid) {
		// TODO Auto-generated method stub
		JiayouPrinter printer = (JiayouPrinter) printerDAO.findByMcode(code).get(0);
		JiayouStation gasStation = gasStationDAO.findById(Integer.parseInt(gsid));
		printer.setJiayouStation(gasStation);
		printerDAO.merge(printer);
	}
	
}
