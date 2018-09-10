package com.action.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsAction;
import com.pojo.Admin;
import com.pojo.Proxy;
import com.pojo.User;
import com.service.admin.AdminErWeiMaservice;
import com.service.admin.QRCodeService;
import com.util.StringUtil;
import com.util.URLManager;
import com.util.ZipUtil;

/**
 * pc端 超级管理员后台 二维码管理
 * 
 * @author 唐仁鑫
 */
@Controller
@RequestMapping("/admin_erweima.do")
public class AdminErWeiMaAction {

	@Autowired
	private HttpServletRequest request;
	@Autowired
	private AdminErWeiMaservice adminErWeiMaservice;
	@Autowired
	private QRCodeService qrCodeService;

	// 开卡
	@RequestMapping(params = "p=kaika")
	public String createErWeiMaNum(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int beginnum = adminErWeiMaservice.findEndNum();
		request.setAttribute("beginnum", beginnum);
		return "/admin/createerweimanum.jsp";
	}

	// 开卡go
	@RequestMapping(params = "p=kaikago")
	@ResponseBody
	public String createErWeiMaNumGo(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 得到要添加的数量
		int num = Integer.parseInt(request.getParameter("num"));
		String[] code = adminErWeiMaservice.getUUidNum(num);
		boolean ok = adminErWeiMaservice.savecode(code, num);
		if (ok)
			return "yes";
		return "no";
	}

	// 已激活二维码
	@RequestMapping(params = "p=activated")
	public String findActivatedQrcode(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map qrcodemap = adminErWeiMaservice.findActivatedQrcodeFenye(size,
				page, keywords);
		request.setAttribute("qrcodemap", qrcodemap);
		request.setAttribute("keywords", keywords);
		return "/admin/activatedqrcode.jsp";
	}

	// 未激活二维码
	@RequestMapping(params = "p=noactivated")
	public String findNoActivatedQrcode(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map qrcodemap = adminErWeiMaservice.findNoActivatedQrcodeFenye(size,
				page, keywords);
		request.setAttribute("qrcodemap", qrcodemap);
		request.setAttribute("keywords", keywords);
		return "/admin/noactivatedqrcode.jsp";
	}

	// 过期二维码
	@RequestMapping(params = "p=outofdate")
	public String findOutofdateQrcode(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		String keywords = request.getParameter("keywords");
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		Map qrcodemap = adminErWeiMaservice.findOutofdateQrcodeFenye(size,
				page, keywords);
		request.setAttribute("qrcodemap", qrcodemap);
		request.setAttribute("keywords", keywords);
		return "/admin/outofdateqrcode.jsp";
	}

	// 进入创建二维码图片页面
	@RequestMapping(params = "p=createqrcodeimage")
	public String createErWeiMaImage(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 查询可生成编号
		int kcnum = adminErWeiMaservice.findusableNum();
		int beginnum = adminErWeiMaservice.findstartid();
		request.setAttribute("kcnum", kcnum);
		request.setAttribute("beginnum", beginnum);
		return "/admin/createqrcodeimage.jsp";
	}

	// 执行创建二维码图片
	@RequestMapping(params = "p=createqrcodeimagego")
	@ResponseBody
	public String createErWeiMaImageGo(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 得到 开始生成的编号
		int beginid = Integer.parseInt(request.getParameter("beginid"));
		// 得到要添加的数量
		int num = Integer.parseInt(request.getParameter("num"));
		// 得到要绑定二维码的编号集合
		List<User> users = adminErWeiMaservice.getUsers(beginid, num);
		// 开始生成二维码图片
		String encoderContent = URLManager.getServerURL(request)
				+ "/move.do?p=saoma&qrid=";
		String path = request.getSession().getServletContext().getRealPath(
				"/qrcodeimage");
		File file = new File(path);
		if (file.exists() == false)
			file.mkdir();
		boolean create = adminErWeiMaservice.doCreate(encoderContent, users,
				path);
		boolean ok = false;
		if (create)
			ok = adminErWeiMaservice.updatestatue(beginid, num);// 将状态未 -1 的数据
																// 改为0 表示已生成二维码
		if (ok)
			return "yes";
		return "no";
	}

	// 下载二维码图片页面
	@RequestMapping(params = "p=downloadqrcodeimage")
	public String downloadErWeiMaImage(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 查询可生成编号
		// 二维码图片库存数量
		int kcnum = adminErWeiMaservice.findusableNum2();
		int beginnum = adminErWeiMaservice.findstartid();
		int endnumid = adminErWeiMaservice.findEndNumid();
		request.setAttribute("kcnum", kcnum);
		request.setAttribute("beginnum", beginnum);
		request.setAttribute("endnumid", endnumid);
		return "/admin/downloadqrcodeimage.jsp";
	}

	// 执行下载二维码图片
	@RequestMapping(params = "p=downloadqrcodeimagego")
	@ResponseBody
	public String downloadErWeiMaImageGo(HttpServletResponse response)
			throws IOException, RowsExceededException, WriteException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 得到 开始生成的编号
		int beginid = Integer.parseInt(request.getParameter("beginid"));
		// 得到要下载的二维码数量
		int num = Integer.parseInt(request.getParameter("num"));
		int endid = beginid + num - 1;

		String type = request.getParameter("type");
		// 下载 图像
		if ("0".equals(type)) {
			// 获取文件根目录，不同框架获取的方式不一样，可自由切换
			String basePath = request.getSession().getServletContext()
					.getRealPath("/qrcodeimage");
			// 创建文件路径的集合，
			List<String> filePath = new ArrayList<String>();
			for (int i = beginid; i <= endid; i++) {
				String targetPath = basePath + File.separator + i + ".jpg";
				filePath.add(targetPath);
			}
			// 设置压缩保存地址 -- 生成临时压缩包 供管理员下载
			File zipPath = new File(basePath + "/zip");
			if (zipPath.exists() == false)
				zipPath.mkdir();
			String zipBasePath = basePath + "/zip/";
			String zipFilePath = zipBasePath + beginid + "-" + endid + ".zip";
			ZipUtil.compress1(filePath, zipFilePath);
			// 要下载的 压缩包zipFilePath
			response.setCharacterEncoding("utf-8");
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;fileName="
					+ beginid + "-" + endid + ".zip");
			// 打开本地文件流
			InputStream inputStream = new FileInputStream(zipFilePath);
			// 激活下载操作
			OutputStream os = response.getOutputStream();
			// 循环写入输出流
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
			// 这里主要关闭。
			os.close();
			inputStream.close();
			return zipFilePath;
		}

		// 下载excel
		List<Object[]> list = adminErWeiMaservice.getUserBetween(beginid, num);
		String baseDir = request.getSession().getServletContext().getRealPath(
				"/tmp");
		String filename = beginid + "-" + endid + ".xls";
		System.out.println("filename:"+filename);
		WritableWorkbook workbook = Workbook.createWorkbook(new File(baseDir,
				filename));
		WritableSheet sheet = workbook.createSheet("二维码", 0);
		Label lblId = new Label(0, 0, "编号");
		Label lblUrl = new Label(1, 0, "地址");
		sheet.addCell(lblId);
		sheet.addCell(lblUrl);
		for (int row = 1; row <= num; row++) {
			Object[] arry = list.get(row - 1);
			String url = URLManager.getServerURL(request) + "/move.do?p=saoma&qrid="
					+ arry[1].toString();
			String id = String.format("%06d", Integer.parseInt(arry[0].toString()));
			Label _lblId = new Label(0, row, id);
			Label _lblUrl = new Label(1, row, url);
			sheet.addCell(_lblId);
			sheet.addCell(_lblUrl);
		}
		workbook.write();
		workbook.close();
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ filename);
		// 打开本地文件流
		InputStream inputStream = new FileInputStream(new File(baseDir,
				filename));
		// 激活下载操作
		OutputStream os = response.getOutputStream();
		// 循环写入输出流
		byte[] b = new byte[2048];
		int length;
		while ((length = inputStream.read(b)) > 0) {
			os.write(b, 0, length);
		}
		// 这里主要关闭。
		os.close();
		inputStream.close();
		return baseDir + File.separator + filename;

	}

	// 进入代理领卡界面
	@RequestMapping(params = "p=dailitakeqrcode")
	public String dailiTakeQrcode(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}

		// 得到所有代理
		List<Proxy> proxys = adminErWeiMaservice.findProxy();
		// 查询未被代理领卡的二维码数量
		int kcnum = adminErWeiMaservice.findkeling();
		int beginnum = adminErWeiMaservice.findstartid2();
		int endnumid = adminErWeiMaservice.findEndNumid2();
		request.setAttribute("kcnum", kcnum);
		request.setAttribute("beginnum", beginnum);
		request.setAttribute("endnumid", endnumid);// 判断输入的起始编号+num是合理
		request.setAttribute("proxys", proxys);
		return "/admin/dailitakeqrcode.jsp";
	}

	// 执行代理领卡
	@RequestMapping(params = "p=dailitakeqrcodego")
	@ResponseBody
	public String dailiTakeQrcodeGo(HttpServletResponse response)
			throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		// 得到 开始生成的编号
		int beginid = Integer.parseInt(request.getParameter("beginid"));
		// 得到 领卡代理的ID
		int proxyid = Integer.parseInt(request.getParameter("proxyid"));
		// 得到要二维码数量
		int num = Integer.parseInt(request.getParameter("num"));
		int endid = beginid + num;
		// 得到以及代理领卡价格
		float price = Float.parseFloat(JccsAction.getQrcodeProxyprice());
		boolean b = adminErWeiMaservice.doDailiTakeQrcode(beginid, proxyid,
				endid, admin.getId());
		adminErWeiMaservice.updateProxy(proxyid, num);
		adminErWeiMaservice.addProxyCard(proxyid, admin, num, price);
		return "yes";
	}
}
