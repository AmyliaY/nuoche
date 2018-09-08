package com.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

/*
 * //微信获取当前坐标  经度  纬度
							location = "http://map.qq.com/nav/drive#routes/page?start="
									+ res.longitude
									+ ","
									+ res.latitude
									+ "&dest=${j},${w}&sword=start&eword=end&showSimunavi=1&roadtest=1&ref=mobilemap&referer=wxmp";

 *  
 *  http://lbs.qq.com/javascript_v2/case-run.html#sample-map
 */
public class MapUtil {
	
	public static void main(String[] args) {
	    Map<String,Double> map = getLngAndLatByBaidu("湖南省株洲市天元区泰山西路88号");
	    if (map==null)
	    {
	    	System.out.println("没找到");
	    }
	    else
	    {
	    	Double j = map.get("j");
	    	Double w = map.get("w");
	    	System.out.println("经度:"+j+",纬度:"+w);
	    	map = getLngAndLatByTencent(j,w);
	    	System.out.println(map);
	    	 
	    }
	}
	
	public static Map getLngAndLatByTencent(String address)
	{
		Map<String,Double> map = getLngAndLatByBaidu(address); 
		double jingdu = map.get("j");
		double weidu = map.get("w");
		double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
		double x = jingdu - 0.0065, y = weidu - 0.006;
		double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * x_pi);
		double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * x_pi);
		double gg_lon = z * Math.cos(theta);
		double gg_lat = z * Math.sin(theta);
		Map mapT = new HashMap();
		mapT.put("j", gg_lon);
		mapT.put("w", gg_lat);
		return mapT;
	}
	
	
	public static Map getLngAndLatByTencent(double baidu_jindu,double baidu_weidu)
	{
		double x_pi = 3.14159265358979324 * 3000.0 / 180.0;
		double x = baidu_jindu - 0.0065, y = baidu_weidu - 0.006;
		double z = Math.sqrt(x * x + y * y) - 0.00002 * Math.sin(y * x_pi);
		double theta = Math.atan2(y, x) - 0.000003 * Math.cos(x * x_pi);
		double gg_lon = z * Math.cos(theta);
		double gg_lat = z * Math.sin(theta);
		Map mapT = new HashMap();
		mapT.put("j", gg_lon);
		mapT.put("w", gg_lat);
		return mapT;
	}
	
	
	/**
	 * 获取百度地址经伟度
	 * @param address
	 * @return
	 */
	public static Map<String,Double> getLngAndLatByBaidu(String address){ 	
		Map<String,Double> map=new HashMap<String, Double>();
		 String url = "http://api.map.baidu.com/geocoder/v2/?address="+address+"&output=json&ak=072ea993bfc90d5ce4954abffaca1e6d";
	        String json = loadJSON(url);
	        String str=null;
	        JSONObject obj= null;
	        try {
	        	obj = JSONObject.fromObject(json);
	        	str="normal";
			} catch (Exception e) {
				// TODO: handle exception
				str="error";
			}
	        if("error".equals(str)){
	        	return null;
	        }
	        if(obj.get("status").toString().equals("0")){
	        	double lng=obj.getJSONObject("result").getJSONObject("location").getDouble("lng");
	        	double lat=obj.getJSONObject("result").getJSONObject("location").getDouble("lat");
	        	map.put("j", lng);
	        	map.put("w", lat);
	        	//System.out.println("经度："+lng+"---纬度："+lat);
	        }else{
	        	return null;
	        }
		return map;
	}
	
	 public static String loadJSON (String url) {
	        StringBuilder json = new StringBuilder();
	        try {
	            URL oracle = new URL(url);
	            URLConnection yc = oracle.openConnection();
	            BufferedReader in = new BufferedReader(new InputStreamReader(
	                                        yc.getInputStream()));
	            String inputLine = null;
	            while ( (inputLine = in.readLine()) != null) {
	                json.append(inputLine);
	            }
	            in.close();
	        } catch (MalformedURLException e) {
	        } catch (IOException e) {
	        }
	        return json.toString();
	    }

		   
		  

}