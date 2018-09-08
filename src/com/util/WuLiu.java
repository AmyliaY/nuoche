package com.util;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class WuLiu {
	
	
	
	
	//��ʾ��������
	public static String[] chineseName={"��ͨ","Բͨ","˳��","��ͨ","�ϴ�"};
	
	//��ʾ��Ӣ����
	public static String[] englishName={"sto","yto","sf-express","zto","yunda"};
	
	//��ѯʱ������������
	public static String[] pinyin={"shentong","yuantong","shunfeng","zhongtong","yunda"};
	
	//����
	public static String[] url = {"http://www.sto.cn","http://www.yto.net.cn","http://www.sf-express.com","http://www.zto.cn","http://www.yundaex.com"};
	//�����������Ų�������Ϣ
	//����json�ַ���(������ƣ�����)
	//һ��������250��(δ���룩
	/*
//	 * ��ͨ:118567603987
Բͨ:7414860657
˳��:118567603987
��ͨ��762354799203

http://baidu.kuaidi100.com/query?type=shunfeng&postid=118567603987&id=4&valicode=&temp=0.8110215236072128&sessionid=0640CE1272FE6CD5EF304FF354270B47
	 */
	public static String getKuaidi(String pinyin,String id){
		String url = "http://baidu.kuaidi100.com/query?type="+pinyin+"&postid="+id+"&id=4&valicode=%E9%AA%8C%E8%AF%81%E7%A0%81&temp="+Math.random()+"&sessionid="+Math.random();
        return getHttpContent(url);
	}
	
	
	public static void main(String[] args) {
		System.out.println(WuLiu.getKuaidi("shunfeng", "118567603987"));
	}
	
	// ��ȡָд��ҳ�������� http://baidu.com
	static private HttpClient client = new HttpClient();
	public static String getHttpContent(String url) {
		String responseStr = null;
		try {
			String encoding="utf-8";
			client.getParams().setParameter(
					HttpMethodParams.HTTP_CONTENT_CHARSET, encoding);
			GetMethod getMethod = new GetMethod(url);
			//getMethod.setRequestHeader("User-Agent","Mozilla/5.0(iPad; U; CPU iPhone OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B314 Safari/531.21.10");
			//getMethod.setRequestHeader("Referer","http://live.gslb.letv.com/");
			int ret = client.executeMethod(getMethod);
			responseStr = getMethod.getResponseBodyAsString();
			getMethod.releaseConnection();
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
		return responseStr;

	}


}
