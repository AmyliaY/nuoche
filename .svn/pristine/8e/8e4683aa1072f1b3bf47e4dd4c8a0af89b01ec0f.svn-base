package weixin.popular.material;

import org.apache.commons.httpclient.HttpClient;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;

import net.sf.json.JSONObject;
import weixin.popular.api.BaseAPI;

/**
 * @author tjx 2017/11/12
 * 获取素材列表
 */
public class MaterialApi extends BaseAPI{
	
	private static String URI = "https://api.weixin.qq.com/cgi-bin/material/batchget_material?access_token="; 

	public static String getMaterial(){
		
		String url = "{ \"type\":TYPE, \"offset\":OFFSET,\"count\":COUNT }";
		
		HttpClient client = new HttpClient();
		HttpPost post = new HttpPost(URI+WeixinGetAccessTokenListen.access_token);
		
		
		return "";
	}
	
	
	
	
	
	
	
	public static String httpGetWithJSON(String url) throws Exception{
		
		HttpGet httpGet = new HttpGet(url);
		CloseableHttpClient client = HttpClients.createDefault();
		String respContent = null;
		
		HttpResponse resp = client.execute(httpGet);
        if(resp.getStatusLine().getStatusCode() == 200) {
            HttpEntity he = resp.getEntity();
            respContent = EntityUtils.toString(he,"UTF-8");
        }
        return respContent;
		
	}
	
	
	public static String httpPostWithJSON(String url) throws Exception {
		 
		          HttpPost httpPost = new HttpPost(url);
		          CloseableHttpClient client = HttpClients.createDefault();
		          String respContent = null;
		          
		  //        json方式
		         JSONObject jsonParam = new JSONObject();  
		         jsonParam.put("type", "news");
		         jsonParam.put("offset", "0");
		         jsonParam.put("count", "20");
		         System.out.println(jsonParam.toString());
		         StringEntity entity = new StringEntity(jsonParam.toString(),"utf-8");//解决中文乱码问题    
		         entity.setContentEncoding("UTF-8");    
		         entity.setContentType("application/json");    
		         httpPost.setEntity(entity);		         
		     
		 //        表单方式
		 //        List<BasicNameValuePair> pairList = new ArrayList<BasicNameValuePair>(); 
		 //        pairList.add(new BasicNameValuePair("name", "admin"));
		 //        pairList.add(new BasicNameValuePair("pass", "123456"));
		 //        httpPost.setEntity(new UrlEncodedFormEntity(pairList, "utf-8"));   
		         
		         
		         HttpResponse resp = client.execute(httpPost);
		         if(resp.getStatusLine().getStatusCode() == 200) {
		             HttpEntity he = resp.getEntity();
		             respContent = EntityUtils.toString(he,"UTF-8");
		         }
		         return respContent;
		     }
	
	
	
	
	public static void main(String[] args) throws Exception {
		
		
		//获取access_token
		String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential"
				+ "&appid=wxa62c851cb5adcdd2"
				+ "&secret=69e7db4225738b97e591606a865c9f4b";
		String access_token = httpGetWithJSON(url);
		System.out.println(access_token);
		
		//String result = httpPostWithJSON(URI+WeixinGetAccessTokenListen.access_token);
		//System.out.println(result);
		
		
		
	}
	
}
