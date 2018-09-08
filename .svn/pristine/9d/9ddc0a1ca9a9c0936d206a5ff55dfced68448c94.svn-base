package weixin.popular.redbag;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import weixin.popular.bean.AdaptorCDATA;

/**
 * @author tjx
 * 2017/11/06
 * 企业到个人 (红包形式)
 * 返回的结果pojo
	<xml>
		<return_code><![CDATA[SUCCESS]]></return_code>
		<return_msg><![CDATA[发放成功.]]></return_msg>
		<result_code><![CDATA[SUCCESS]]></result_code>
		<err_code><![CDATA[0]]></err_code>
		<err_code_des><![CDATA[发放成功.]]></err_code_des>
		<mch_billno><![CDATA[0010010404201411170000046545]]></mch_billno>
		<mch_id>10010404</mch_id>
		<wxappid><![CDATA[wx6fa7e3bab7e15415]]></wxappid>
		<re_openid><![CDATA[onqOjjmM1tad-3ROpncN-yUfa6uI]]></re_openid>
		<total_amount>1</total_amount>
	</xml>
 */
@XmlRootElement(name="xml")
@XmlAccessorType(XmlAccessType.FIELD)
public class RedPacketResult {

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
	
	@XmlElement
	private String err_code;
	@XmlElement
	private String err_code_des;


	public String getErr_code() {
		return err_code;
	}

	public void setErr_code(String err_code) {
		this.err_code = err_code;
	}

	public String getErr_code_des() {
		return err_code_des;
	}

	public void setErr_code_des(String err_code_des) {
		this.err_code_des = err_code_des;
	}
	
	
}
