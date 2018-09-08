package com.util;

/**
 * 支付回调的参数实体类
 * 
 * @author zhoutingting
 */
public class PaySaPi {

	/**
	 * paysapi生成的订单ID号
	 */
	private String paysapi_id;

	/**
	 * 您的自定义订单号
	 */
	private String orderid;

	/**
	 * 订单定价
	 */
	private String price;

	/**
	 * 实际支付金额
	 */
	private String realprice;

	/**
	 * 您的自定义用户ID
	 */
	private String orderuid;

	/**
	 * 秘钥
	 */
	private String key;

	public String getPaysapi_id() {
		return paysapi_id;
	}

	public void setPaysapi_id(String paysapi_id) {
		this.paysapi_id = paysapi_id;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRealprice() {
		return realprice;
	}

	public void setRealprice(String realprice) {
		this.realprice = realprice;
	}

	public String getOrderuid() {
		return orderuid;
	}

	public void setOrderuid(String orderuid) {
		this.orderuid = orderuid;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
