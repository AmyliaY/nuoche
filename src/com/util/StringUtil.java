package com.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

public class StringUtil {

	public static boolean isNull(String str) {
		if (str == null || str.trim().length() == 0 || "null".equalsIgnoreCase(str)) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean isNotNull(String str) {
		return !isNull(str);
	}

	/**
	 * 截取一键加群的href部分
	 * 
	 * @param str
	 * @return
	 * 
	 */
	public static String getLianjie(String str) {
		if (isNotNull(str)) {

			if (str.contains("href")) {
				int start = str.indexOf("href=");
				int end = str.indexOf("><img");
				String sString = str.substring(start, end);
				String[] newString = sString.split("\"");
				str = newString[1];
			}
		}
		return str;
	}

	/**
	 * 判断一个字符串是否都为数字
	 * 
	 * @param strNum
	 * @return
	 */
	public static boolean isDigit(String strNum) {

		try {
			Integer.parseInt(strNum);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * @param request
	 * @param name
	 *            参数名
	 * @param encoding
	 *            编 码
	 * @return 处理后的String
	 * @throws IOException
	 */
	public static String getParameterByEncoding(HttpServletRequest request,
			String name, String encoding) throws IOException {
		return new String(request.getParameter(name).getBytes("iso-8859-1"),
				encoding);
	}

}
