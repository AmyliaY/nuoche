package com.action.daili;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.daili.PrinterBackService;

/*
 * 
 * 
 */
@Controller
@RequestMapping("/printercfgback.do")
public class PrinterCfgAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private PrinterBackService printerBackService;
	
	@RequestMapping(params = "method=getAllPrinter")
	public String getAllPrinter(HttpServletResponse response) {
		Map map = printerBackService.getAllPrinter(1, 100);
		request.setAttribute("map", map);
		return "/daili/jiayouzhang/PrinterCfg.jsp";
	}
	
	@RequestMapping(params = "method=changest")
	public String changest(HttpServletResponse response) throws IOException {
		String code = request.getParameter("printercode");
		String gsid = request.getParameter("gid");
		System.out.println(code+";"+gsid);
		printerBackService.changest(code,gsid);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script language=\"javascript\">alert('设置已保存！');window.location.href='/printercfgback.do?method=getAllPrinter'</script>");
		out.flush();   
		out.close();
		return null;
	}
	
	@RequestMapping(params = "method=changePrinterStatus")
	public void changePrinterStatus(HttpServletResponse response) throws NumberFormatException, IOException {
		String id = request.getParameter("id");
		response.getWriter().print(printerBackService.changePrinterSta(Integer.parseInt(id)));
	}
	
	@RequestMapping(params = "method=addNewUserCfg")
	public String addNewUserCfg(HttpServletResponse response) throws IOException{
		String partner = request.getParameter("partner");
		String apikey = request.getParameter("apikey");
		String username = request.getParameter("username");
		String mobilephone = request.getParameter("mobilephone");
		//System.out.println(partner+","+apikey+","+username+","+mobilephone);
		printerBackService.addNewUserCfg(partner,apikey,username,mobilephone);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<script language=\"javascript\">alert('设置已保存！');window.location.href='/printercfgback.do?method=getAllPrinter'</script>");
		out.flush();   
		out.close();
		return null;
	}
	
	@RequestMapping(params = "method=addNewPrinter")
	public  String addNewPrinter(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		String mcode = request.getParameter("mcode");
		String pname = new String(request.getParameter("pname").getBytes("iso8859-1"),"utf-8");
		
		String gid = request.getParameter("gid");
		String msign = request.getParameter("msign");
		
		String flag=printerBackService.addNewPrinter(mcode,pname,gid,msign);
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		out.print("<script language=\"javascript\">alert('"+flag+"');window.location.href='/printercfgback.do?method=getAllPrinter'</script>");
		out.flush();   
		out.close();
		return null;
	}
	
	@RequestMapping(params = "method=getPrinterUserCfg")
	public void getPrinterUserCfg( HttpServletResponse response) throws IOException{
		response.getWriter().print(printerBackService.getPrinterUserCfg());
	}
	
}
