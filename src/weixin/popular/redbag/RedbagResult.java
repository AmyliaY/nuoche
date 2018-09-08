package weixin.popular.redbag;

/**
 * <xml>
		<return_code><![CDATA[SUCCESS]]></return_code>
		<return_msg><![CDATA[]]></return_msg>
		<mch_appid><![CDATA[wx6a1e70a87f9fb08e]]></mch_appid>
		<mchid><![CDATA[1231794002]]></mchid>
		<device_info><![CDATA[iphone6s]]></device_info>
		<nonce_str><![CDATA[9801d548c99b4a9b81ea21b9f6bf25a5]]></nonce_str>
		<result_code><![CDATA[SUCCESS]]></result_code>
		<partner_trade_no><![CDATA[99cdadfa4cfe40f3b5eee01f0c559279]]></partner_trade_no>
		<payment_no><![CDATA[1000018301201607270072742844]]></payment_no>
		<payment_time><![CDATA[2016-07-27 22:10:43]]></payment_time>
		</xml>
 */
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import weixin.popular.bean.AdaptorCDATA;

@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class RedbagResult {
	
		@XmlElement
		@XmlJavaTypeAdapter(value = AdaptorCDATA.class)
		private String return_code;
		
		
		public String getReturn_code() {
			return return_code;
		}

		public void setReturn_code(String returnCode) {
			return_code = returnCode;
		}

		public String getReturn_msg() {
			return return_msg;
		}

		public void setReturn_msg(String returnMsg) {
			return_msg = returnMsg;
		}

		public String getResult_code() {
			return result_code;
		}

		public void setResult_code(String resultCode) {
			result_code = resultCode;
		}

		@XmlElement
		private String return_msg;
		
		@XmlElement
		private String result_code;
		
}
