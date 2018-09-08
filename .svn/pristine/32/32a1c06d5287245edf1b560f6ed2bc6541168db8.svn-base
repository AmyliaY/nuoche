package com.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * 通用文件上传
 * 
 * @author lgh
 * 
 */
@Controller
@RequestMapping("/upload.do")
public class FileUploadAction {

	@Autowired
	private HttpServletRequest request;

	/**
	 * 上传到临时目录
	 * 
	 * @param file
	 * @param response
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping
	public String upload(@RequestParam MultipartFile file,
			HttpServletResponse response) throws IllegalStateException,
			IOException {
		// Admin admin = (Admin) request.getSession().getAttribute("admin");
		// Proxy proxy = (Proxy) request.getSession().getAttribute("proxy");
		// if(admin==null&&proxy==null){
		// return "/admin/toLogin.jsp";
		// }
		String path = request.getSession().getServletContext().getRealPath(
				"/tmp");
		System.out.println(path);
		String oldName = file.getOriginalFilename();// 旧的文件名
		String newName = newName(oldName); // 新的文件
		file.transferTo(new File(path + "/" + newName)); // 上传到临时目录
		response.getWriter().print(newName);
		return null;

	}

	@RequestMapping(params = "p=upload")
	public String dailiupload(@RequestParam MultipartFile file,
			HttpServletResponse response) throws IllegalStateException,
			IOException {

		String path = request.getSession().getServletContext().getRealPath(
				"/tempImages");
		String oldName = file.getOriginalFilename();// 旧的文件名
		String newName = newName(oldName); // 新的文件
		file.transferTo(new File(path + "/" + newName)); // 上传到临时目录
		response.getWriter().print(newName);
		return null;

	}

	// 产生新的文件名 a.png
	private String newName(String oldName) {

		int index = oldName.lastIndexOf(".");
		String extName = oldName.substring(index);// 得后辍名
		return System.currentTimeMillis() + extName;
	}

	private String makeFileName(String filename) { // 2.jpg
	// 为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		return filename;
	}

	private String makePath(String filename, String savePath) {
		// 得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
		int hashcode = filename.hashCode();

		// 构造新的保存目录
		String dir = savePath; // upload\2\3 upload\3\5
		// File既可以代表文件也可以代表目录
		File file = new File(dir);
		// 如果目录不存在
		if (!file.exists()) {
			// 创建目录
			file.mkdirs();
		}
		return dir;

	}
}
