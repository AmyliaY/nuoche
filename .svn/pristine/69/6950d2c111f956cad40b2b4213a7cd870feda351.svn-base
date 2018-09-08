package weixin.popular.redbag;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.util.Map;
import java.util.UUID;

import javax.net.ssl.SSLContext;

import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.ssl.SSLContexts;

import com.action.WeixinConfig;
import com.listener.WeixinGetAccessTokenListen;
import com.sun.java_cup.internal.Main;

import weixin.popular.api.BaseAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.User;
import weixin.popular.client.XmlResponseHandler;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

/**
 * 企业到个人红包形式
 * 
 * @author tjx
 *
 */
public class RedPacketApi extends BaseAPI {

	private final String URI = "https://api.mch.weixin.qq.com/mmpaymkttransfers/sendredpack";

	public RedPacketResult send(RedPacket redbag) throws KeyManagementException, UnrecoverableKeyException,
			NoSuchAlgorithmException, KeyStoreException, java.security.cert.CertificateException, IOException {
		String unifiedorderXML = XMLConverUtil.convertToXML(redbag); // 以前的
		unifiedorderXML = unifiedorderXML.replaceAll("&lt;!\\[CDATA\\[", "").replaceAll("]]&gt;", "");

		KeyStore keyStore = KeyStore.getInstance("PKCS12");
		FileInputStream instream = new FileInputStream(new File(WeixinConfig.REDBAG_CERTPATH));// 加载本地的证书进行https加密传输
		try {
			keyStore.load(instream, WeixinConfig.REDBAG_KEY.toCharArray());// 设置证书密码
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} finally {
			instream.close();
		}

		// Trust own CA and all self-signed certs
		SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, WeixinConfig.REDBAG_KEY.toCharArray())
				.build();
		// Allow TLSv1 protocol only
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslcontext, new String[] { "TLSv1" }, null,
				SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);

		// System.out.println(new StringEntity(unifiedorderXML,
		// Charset.forName("utf-8")));
		HttpUriRequest httpUriRequest = RequestBuilder.post().setHeader(xmlHeader).setUri(URI)
				.setEntity(new StringEntity(unifiedorderXML, Charset.forName("UTF-8"))).build();

		CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(sslsf).build();

		return httpclient.execute(httpUriRequest, XmlResponseHandler.createResponseHandler(RedPacketResult.class));
	}
	
	
	/**
	 * @param openid         用户ID
	 * @param total_amount   金额(单位分)
	 * @param wishing        红包祝福语
	 * @return
	 */
	public boolean sendRedPacket(String openid,int total_amount,String wishing){
		
		User userInfo = new UserAPI().userInfo(WeixinGetAccessTokenListen.access_token, openid);
		if(userInfo.getNickname()==null){
			return false;
		}
		
		RedPacket packet = new RedPacket();
		packet.setNonce_str(UUID.randomUUID().toString().replaceAll("-",""));
		packet.setMch_billno("miheschool"+System.currentTimeMillis());
		packet.setMch_id(WeixinConfig.MCH_ID);
		packet.setWxappid(WeixinConfig.APPID);
		packet.setSend_name("米禾学长");
		packet.setRe_openid(openid);
		packet.setTotal_amount(total_amount);
		packet.setTotal_num(1);
		packet.setWishing(wishing);
		packet.setClient_ip("192.168.0.1");
		packet.setAct_name("米禾学长");
		packet.setRemark("米禾学长");
		
		Map map = MapUtil.objectToMap(packet, "sign");
		String sign = SignatureUtil.generateSign(map,"miheschool15021288172admin123456");
		packet.setSign(sign);
		
		
		RedPacketResult send = null;
		try {
			send = new RedPacketApi().send(packet);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(send==null){
			return false;
		}
		if("SUCCESS".equals(send.getResult_code())
				&& "SUCCESS".equals(send.getReturn_code())) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public static void main(String [] agrs) throws KeyManagementException, UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, CertificateException, IOException{
		
		RedPacket packet = new RedPacket();
		packet.setNonce_str(UUID.randomUUID().toString().replaceAll("-",""));
		packet.setMch_billno("miheschool"+System.currentTimeMillis());
		packet.setMch_id("1487594662");
		packet.setWxappid("wxa62c851cb5adcdd2");
		packet.setSend_name("米禾学长");
		packet.setRe_openid("oveDNv21povuq-ObpoyWF-509qsk");
		packet.setTotal_amount(100);
		packet.setTotal_num(1);
		packet.setWishing("好好透书");
		packet.setClient_ip("192.168.0.1");
		packet.setAct_name("测试活动");
		packet.setRemark("快来");
		
		Map map = MapUtil.objectToMap(packet, "sign");
		String sign = SignatureUtil.generateSign(map,"miheschool15021288172admin123456");
		packet.setSign(sign);
		
		
		RedPacketResult send = new RedPacketApi().send(packet);
		System.out.println(send.getReturn_code());
		System.out.println(send.getResult_code());
		System.out.println(send.getErr_code());
	}
}
