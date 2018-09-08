package weixin.popular.redbag;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * 企业向个人打款（发放红包）功能
 * 
 * @author lgh
 * 
 *         <xml>
 * 
 *         <mch_appid>wxe062425f740c30d8</mch_appid>
 * 
 *         <mchid>10000098</mchid>
 * 
 *         <nonce_str>3PG2J4ILTKCH16CQ2502SI8ZNMTM67VS</nonce_str>
 * 
 *         <partner_trade_no>100000982014120919616</partner_trade_no>
 * 
 *         <openid>ohO4Gt7wVPxIT1A9GjFaMYMiZY1s</openid>
 * 
 *         <check_name>OPTION_CHECK</check_name>
 * 
 *         <re_user_name>张三</re_user_name>
 * 
 *         <amount>100</amount>
 * 
 *         <desc>节日快乐!</desc>
 * 
 *         <spbill_create_ip>10.2.3.10</spbill_create_ip>
 * 
 *         <sign>C97BDBACF37622775366F38B629F45E3
 * 
 * 
 */
@XmlRootElement
public class Redbag implements Serializable {

	private String mch_appid; // 公众账号appid
	private String mchid; // mchid
	private String device_info; // 设备号
	private String nonce_str; // 设备号
	private String sign; // 签名
	private String partner_trade_no; // 商户订单号
	private String openid; // 用户openid
	private String check_name; // 用户openid
	private String re_user_name; // 收款用户姓名
	private String amount; // 金额
	private String desc; // 企业付款描述信息
	private String spbill_create_ip; // ip
	private String body ;
	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getMch_appid() {
		return mch_appid;
	}

	public void setMch_appid(String mchAppid) {
		mch_appid = mchAppid;
	}

	public String getMchid() {
		return mchid;
	}

	public void setMchid(String mchid) {
		this.mchid = mchid;
	}

	public String getDevice_info() {
		return device_info;
	}

	public void setDevice_info(String deviceInfo) {
		device_info = deviceInfo;
	}

	public String getNonce_str() {
		return nonce_str;
	}

	public void setNonce_str(String nonceStr) {
		nonce_str = nonceStr;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getPartner_trade_no() {
		return partner_trade_no;
	}

	public void setPartner_trade_no(String partnerTradeNo) {
		partner_trade_no = partnerTradeNo;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getCheck_name() {
		return check_name;
	}

	public void setCheck_name(String checkName) {
		check_name = checkName;
	}

	public String getRe_user_name() {
		return re_user_name;
	}

	public void setRe_user_name(String reUserName) {
		re_user_name = reUserName;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}

	public void setSpbill_create_ip(String spbillCreateIp) {
		spbill_create_ip = spbillCreateIp;
	}

}
