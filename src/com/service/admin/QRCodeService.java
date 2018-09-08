package com.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.dao.HqlDAO;
import com.listener.WeixinGetAccessTokenListen;
import com.pojo.User;
import com.util.T2DMa;
import com.util.URLManager;
import com.util.ZipUtil;

/**
 * 二维码  生成二维码
 * @author trx
 * 在applicationContext.xml ioc本业务层
 *
 */
public class QRCodeService {
	public static void main(String[] args) {
		ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("app*.xml");
		QRCodeService codeService = applicationContext.getBean(QRCodeService.class);
		codeService.createQrCode();
	}

	//二维码存放目录
	private String qrCodePath = WeixinGetAccessTokenListen.SERVER_REAL_PATH+File.separator+"qrcodeimage";
	
	//二维码内容前辍,在登录的action进行赋初值  QRCodeService.qrCodeUrlServer = URLManager.getServerURL(request);
	public static  String qrCodeUrlServer = null;

	public String getQrCodeUrlServer() {
		return qrCodeUrlServer;
	}

	public void setQrCodeUrlServer(String qrCodeUrlServer) {
		this.qrCodeUrlServer = qrCodeUrlServer;
	}

	public HqlDAO getHqlDAO() {
		return hqlDAO;
	}

	public String getQrCodePath() {
		return qrCodePath;
	}

	public void setQrCodePath(String qrCodePath) {
		this.qrCodePath = qrCodePath;
	}
	
	private HqlDAO hqlDAO;
	
	public void setHqlDAO(HqlDAO hqlDAO) {
		this.hqlDAO = hqlDAO;
	}

	public void createQrCode()
	{
		//二维码存放目录不存在则创建
		File qrCodeFile = new File(qrCodePath);
		if (qrCodeFile.exists()==false)
			qrCodeFile.mkdir();
		String hql = " from User ";
		String encoderContent =qrCodeUrlServer+"/move.do?p=saoma&qrid=";
		List<User> users = hqlDAO.findByHQL(hql);
		T2DMa ma  =new T2DMa();
		for (User user : users) {
			String imgPath = qrCodePath+"/"+user.getId()+".png";
			String encoderContent1 = encoderContent + user.getQrcode();
			ma.encoderQRCode(encoderContent1, imgPath, "png");
		}
			
	}
		
}

