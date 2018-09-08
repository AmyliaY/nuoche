package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

public class FileUtil {
	
	/**
	 * 
	 * @param request
	 * @param srcDir        源文件所在目录(虚拟路径,/开头)
	 * @param srcFileName   源文件文件名
	 * @param desdir        目标目录(虚拟路径,/开头)
	 */
	public static void copy(HttpServletRequest request, String srcDir,String srcFileName, String desdir)
	{
		String _srcDir = request.getSession().getServletContext().getRealPath(srcDir);
		String _desDir = request.getSession().getServletContext().getRealPath(desdir);
		try {
			InputStream is = new FileInputStream(_srcDir+"/"+srcFileName);
			OutputStream out = new FileOutputStream(_desDir+"/"+srcFileName);
			byte[] b= new byte[10240];
			int size = is.read(b);
			while (size>0)
			{
				out.write(b,0,size);
				size = is.read(b);
			}
			//删除临时文件
			File file = new File(_srcDir);
			if(file.isFile()){
				file.delete();
			}
			out.close();
			is.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	

	/**
	 * 
	 * @param request
	 * @param srcDir        源文件所在目录(虚拟路径,/开头)
	 * @param srcFileName   源文件文件名
	 * @param desdir        目标目录(虚拟路径,/开头)
	 */
	public static void copys(HttpServletRequest request, String srcDir,String srcFileName, String desdir)
	{
		String _srcDir = request.getSession().getServletContext().getRealPath(srcDir);
		String _desDir = request.getSession().getServletContext().getRealPath(desdir);
		try {
			System.out.println("test:"+srcFileName);
			System.out.println("_srcDir:"+_srcDir+"/"+srcFileName);
			System.out.println("_desDir:"+_desDir);
			InputStream is = new FileInputStream(_srcDir+"/"+srcFileName);
			OutputStream out = new FileOutputStream(_desDir+"/"+srcFileName);
			

			byte[] b= new byte[10240];
			int size = is.read(b);
			while (size>0)
			{
				out.write(b,0,size);
				size = is.read(b);
			}
			out.close();
			is.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("报错了。 ");
		}
		
	}
	
	
	/**
     * 递归删除目录下的所有文件及子目录下所有文件
     * @param dir 将要删除的文件目录
     * @return 
     */
    public static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
    
    public static void delFile(String filename)
	{
		File file = new File(filename);
		file.delete();
	}
    public static void main(String[] args) throws IOException {
    	InputStream stream = new FileInputStream("D:/apache-tomcat-7.0.75/apache-tomcat-7.0.75/webapps/iStudent/pc/back/images/tmpImage/1503403482091.png");
    	System.out.println(stream);
	}
}
