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
import java.util.Date;
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
import org.apache.log4j.Logger;

import com.action.WeixinConfig;

import weixin.popular.api.BaseAPI;
import weixin.popular.client.XmlResponseHandler;
import weixin.popular.util.MapUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

/**
 * 企业到个人零钱
 * @author tjx
 *
 */
public class RedbagApi extends BaseAPI {

	String URI = "https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
	Logger logger = Logger.getRootLogger();
	/**
	 * 
	 * @param name    打款人姓名
	 * @param openId  打款人微信号
	 * @param money   打款金额：单位分
	 * @return  true打款成功
	 */
	public boolean sendMoney(String name, String openId, String money) {
		logger.error("到了。 ");
		Redbag redbag = new Redbag();
		redbag.setMch_appid(WeixinConfig.APPID); //"wx6a1e70a87f9fb08e"
		redbag.setAmount(money);
		redbag.setCheck_name("NO_CHECK");
		redbag.setDesc("提现");
		redbag.setDevice_info("iphone6s");
		redbag.setMchid(WeixinConfig.MCH_ID);
		redbag.setNonce_str(UUID.randomUUID().toString().replaceAll("-", ""));
		redbag.setPartner_trade_no(UUID.randomUUID().toString().replaceAll("-",
				""));
		redbag.setOpenid(openId);
		redbag.setRe_user_name(name);
		redbag.setSpbill_create_ip("192.168.1.100");

		Map map = MapUtil.objectToMap(redbag, "sign");
		String sign = SignatureUtil.generateSign(map,
				WeixinConfig.PAY_KEY);
		redbag.setSign(sign);
		

		RedbagResult redbagResult = null;
		try {
			redbagResult = new RedbagApi().send(redbag);
			logger.error(redbagResult.getResult_code());
			logger.error(redbagResult.getReturn_code());
			logger.error(redbagResult.getReturn_msg());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if ("SUCCESS".equals(redbagResult.getResult_code())
				&& "SUCCESS".equals(redbagResult.getReturn_code())) {
			return true;
		} else {
			return false;
		}
	}

	public static void main(String[] args) throws KeyManagementException,
			UnrecoverableKeyException, NoSuchAlgorithmException,
			KeyStoreException, java.security.cert.CertificateException,
			IOException {
		Redbag redbag = new Redbag();
		redbag.setMch_appid("wxa62c851cb5adcdd2");
		redbag.setAmount("100");
		redbag.setCheck_name("NO_CHECK");
		redbag.setDesc("红包");
		redbag.setDevice_info("123123");
		redbag.setMchid("1487594662");
		redbag.setNonce_str(UUID.randomUUID().toString().replaceAll("-", ""));
		redbag.setPartner_trade_no(UUID.randomUUID().toString().replaceAll("-",
				""));
		redbag.setOpenid("oveDNvyEzaEx8GPowCk2brDiLjOA");
		redbag.setSpbill_create_ip("192.168.0.1");

		Map map = MapUtil.objectToMap(redbag, "sign");
		String sign = SignatureUtil.generateSign(map,"miheschool15021288172admin123456");
		redbag.setSign(sign);
		
		RedbagResult redbagResult = new RedbagApi().send(redbag);
		System.out.println(redbagResult.getResult_code());
		System.out.println(redbagResult.getReturn_code());
		System.out.println(redbagResult.getReturn_msg());
		if ("SUCCESS".equals(redbagResult.getResult_code())
				&& "SUCCESS".equals(redbagResult.getReturn_code())) {
		} else {
		}

	}

	public RedbagResult send(Redbag redbag) throws KeyManagementException,
			UnrecoverableKeyException, NoSuchAlgorithmException,
			KeyStoreException, java.security.cert.CertificateException,
			IOException {
		String unifiedorderXML = XMLConverUtil.convertToXML(redbag); //以前的
		try {
			unifiedorderXML = XMLConverUtil.BeantoXml(redbag);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		unifiedorderXML = unifiedorderXML.replaceAll("&lt;!\\[CDATA\\[", "")
				.replaceAll("]]&gt;", "");

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
		SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore,
				WeixinConfig.REDBAG_KEY.toCharArray()).build();
		// Allow TLSv1 protocol only
		SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(
				sslcontext, new String[] { "TLSv1" }, null,
				SSLConnectionSocketFactory.BROWSER_COMPATIBLE_HOSTNAME_VERIFIER);

		// System.out.println(new StringEntity(unifiedorderXML,
		// Charset.forName("utf-8")));
		HttpUriRequest httpUriRequest = RequestBuilder.post().setHeader(
				xmlHeader).setUri(URI).setEntity(
				new StringEntity(unifiedorderXML, Charset.forName("UTF-8")))
				.build();

		CloseableHttpClient httpclient = HttpClients.custom()
				.setSSLSocketFactory(sslsf).build();

		return httpclient.execute(httpUriRequest, XmlResponseHandler
				.createResponseHandler(RedbagResult.class));
	}

}
