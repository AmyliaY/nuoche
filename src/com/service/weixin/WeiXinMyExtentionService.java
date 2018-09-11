package com.service.weixin;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.action.WeixinConfig;
import com.dao.HqlDAO;
import com.util.T2DMa;
import com.util.URLManager;

@Service
public class WeiXinMyExtentionService {
	
	@Autowired
	private HqlDAO hqlDAO;
	
	public String doCreate(String encoderContent, String weixinhao, String path) throws Exception {
		T2DMa ma  =new T2DMa();
		String imgPath = path+File.separator+weixinhao+".png";
		//该用户的个人推广二维码url
		String encoderContent1 = encoderContent + weixinhao;
		System.out.println(encoderContent1);
		System.out.println("图片最终路径："+imgPath);
		ma.encoderQRCode(encoderContent1, imgPath, "png");//二维码对应的网站，图片的路径，图片的格式
		String returnimg = weixinhao+".png";
		return returnimg;
	}

}
