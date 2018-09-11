package com.service.weixin;

import java.io.InputStream;
import java.util.Properties;

/**
 * 获取微信制等级金额
 */
public class WeixinZhiduService {
	public static void main(String[] args) {
		
	}
	//最大7级
    public static int MAX = 7;
	public static float[] money = { 25, 15, 10, 8, 6, 3, 3 };

	static {
		try {
			InputStream is = WeixinZhiduService.class
					.getResourceAsStream("/zhidu.properties");
			Properties p = new Properties();
			p.load(is);
			for (int i = 0; i < MAX; i++) {
				money[i] = Float.parseFloat(p.getProperty(i+1 + ""));
			}
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
