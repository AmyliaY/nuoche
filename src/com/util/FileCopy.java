package com.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

public class FileCopy {

	/**
	 * 
	 * @param request
	 * @param srcDir  源目录
	 * @param desDir  目的目录
	 * @param oldFile 源文件名
	 * @return
	 */
	public static boolean copy(HttpServletRequest request, String srcDir,
			String desDir, String oldFile) {
		try {
			String realSrcDir = request.getSession().getServletContext()
					.getRealPath(srcDir);
			String realDesDir = request.getSession().getServletContext()
					.getRealPath(desDir);
			InputStream is = new FileInputStream(realSrcDir + "/" + oldFile);
			OutputStream os = new FileOutputStream(realDesDir + "/" + oldFile);
			byte[] b = new byte[10240];
			int size = is.read(b);
			while (size > 0) {
				os.write(b, 0, size);
				size = is.read(b);
			}
			os.close();
			is.close();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

}
