package com.shop.action.back;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pojo.Admin;
import com.pojo.Goods;
import com.service.back.GoodsXiajiaService;
import com.util.StringUtil;

@Controller
@RequestMapping("/xiajiagoods.do")
public class GoodsXiajiaAction {
	@Autowired
	private GoodsXiajiaService xiajiaService;
	/**
	 * �¼���Ʒ�����ѯ
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(params="p=xjgoodslisting")
	public String xjgoodslisting(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int page=1;		//ҳ��
		int size=6;	//��С
		//ת��int����
		String pageString=request.getParameter("page");
		if(StringUtil.isNotNull(pageString) && pageString.length()>0)
			page=Integer.parseInt(pageString);
		String sizeString=request.getParameter("size");
		if(StringUtil.isNotNull(sizeString) && sizeString.length()>0)
			size=Integer.parseInt(sizeString);
		String gttid=request.getParameter("gttid");		//���� -->  ��ݶ�������ID����
		//����  -->  �۸����
		String minprice=request.getParameter("minprice");	//��߼۸��ı���
		String maxprice=request.getParameter("maxprice");	//�ұ߼۸��ı���
		String keywords=request.getParameter("keywords");	//���� -->  ��Ʒ���
		if(request.getMethod().equalsIgnoreCase("GET"))
		{
			if(keywords!=null)
				keywords=new String(keywords.getBytes("iso8859-1"),"utf-8");
		}
		//List twotypelist=xiajiaService.getAllTwotypegoods();		//��ѯ���еĶ�������
		Map xjgoodsmap=xiajiaService.xjgoodslisting(size,page,gttid,minprice,maxprice,keywords);
		request.setAttribute("xjgoodsmap", xjgoodsmap);
		//request.setAttribute("twotypelist", twotypelist);
		request.setAttribute("keywords", keywords);
		return "/admin/goodsxiajia.jsp";
	}
	/**
	 * ������Ʒ�ϼ�  ���ID
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params="p=xiugaistatus")
	public String xiugaistatus(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id=Integer.parseInt(request.getParameter("id"));
		Goods goods=xiajiaService.xiugaistatus(id);
		response.getWriter().print(goods.getGstatus());
		return null;
	}
	
	
	@RequestMapping(params="p=updateGoods")
	public String updateGoods(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		int id=Integer.parseInt(request.getParameter("id"));
		xiajiaService.delteGoods(id);
	
		return "";
	}
	/**
	 * ����������Ʒ�ϼ�
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=plxiajiagoods")
	public String plxiajiagoods(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		String shangjia=request.getParameter("shangjia");
		xiajiaService.plxiajiagoods(shangjia);
		return null;
	}
}
