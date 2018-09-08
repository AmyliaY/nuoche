package com.shop.action.back;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pojo.Admin;
import com.pojo.Goods;
import com.pojo.Goodsimages;
import com.service.back.GoodsShangjiaService;
import com.util.StringUtil;
import com.util.T2DMa;
import com.util.URLManager;
import com.util.Upload;

@Controller
@RequestMapping("/shangjiagoods.do")
public class GoodsShangjiaAction {
	@Autowired
	private GoodsShangjiaService shangjiaService;

	/**
	 * 上架商品列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping(params = "p=sjgoodslinting")
	public String sjgoodslinting(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int page = 1; // ҳ��
		int size = 6; // ��С
		// ����ҳ�洫�����Ĳ��� ת��int����
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);

		String gttid = request.getParameter("gttid"); // ���� --> ���������ID
		String keywords = request.getParameter("keywords"); // ����
															// -->ģ���ѯ��Ʒ���
		if (request.getMethod().equalsIgnoreCase("GET")) {
			if (keywords != null)
				keywords = new String(keywords.getBytes("iso8859-1"), "utf-8");
		}
		// ���� --> �۸����
		String minprice = request.getParameter("minprice"); // ���
		String maxprice = request.getParameter("maxprice"); // �ұ�

		Map sjgoodsMap = shangjiaService.sjgoodslinting(size, page,gttid,
				keywords, minprice, maxprice);
		//List twotypelist = shangjiaService.getAllTwotypegoods(); // ��ѯ���еĶ�������
		request.setAttribute("sjgoodsMap", sjgoodsMap);
		//request.setAttribute("twotypelist", twotypelist);
		request.setAttribute("keywords", keywords);
		return "/admin/goodsshangjia.jsp";
	}

	

	/**
	 * 根据商品ID 设置状态 为 下架
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=xiugaistatus")
	public String xiugaistatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		int id = Integer.parseInt(request.getParameter("id")); // ��ƷID
		Goods goods = shangjiaService.xiugaistatus(id);
		response.getWriter().print(goods.getGstatus());
		return null;

	}

	/**
	 * 修改商品第一步 得到所选商品信息
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(params = "p=updateone")
	public String updateGoodsOne(HttpServletRequest request,
			HttpServletResponse response) {
		String gid = request.getParameter("gid");
		String name = request.getParameter("gname");
		if (name != null) {
			try {
				name = new String(name.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		Goods goods = shangjiaService.findByIdGood(Integer.parseInt(gid));
		List<Goodsimages> detaillist = shangjiaService.getDetailImage(Integer
				.parseInt(gid));
		request.setAttribute("g", goods);// b2b中的商品
		request.setAttribute("images", detaillist);// 商品详情中的五个图片
		//String onetype = shangjiaService.getAllOnetypeName(name);
		//List onetypelist = shangjiaService.getAllOnetype();
		//List twotypelist = shangjiaService.twotypegoodsAll();
		//request.setAttribute("gid", goods.getGoodstwotype().getGoodsonetype().getGtId());
		//request.setAttribute("onetype", onetype);
		//request.setAttribute("onetypelist", onetypelist);
		//request.setAttribute("twotypelist", twotypelist);
		return "/admin/goods_edit.jsp";

	}

	
	
	/**
	 * 批量下架商品
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=plxiajiagoods")
	public String plxiajiagoods(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String xiajia = request.getParameter("xiajia");
		shangjiaService.plxiajiagoods(xiajia);
		return null;
	}

	
	/**
	 * 新增商品
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updategoods")
	@ResponseBody
	public String updategoods(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		
		String gid = request.getParameter("gid");// 商品编号
		String path = request.getSession().getServletContext()
				.getRealPath("/admin/images/goods");
		String defaultImage = request.getParameter("defaultImage");// 默认图片
		String json = request.getParameter("imagelist"); // 其它图片
		String gname = request.getParameter("gname");
		String gchandi = request.getParameter("gchandi");
		String gpinpai = request.getParameter("gpinpai");
		String gjianjie = request.getParameter("gjanjie");
		String gimages = request.getParameter("defaultImage");
	//	String gttid = request.getParameter("gttid");
	//	Goodstwotype goodstwotype = shangjiaService.findById(gttid);
		String gprice = request.getParameter("gprice");
		String gvipprice = request.getParameter("gvipprice");
		String gstatus = request.getParameter("gstatus");
		String gziying = request.getParameter("gziying");
	//	System.out.println("自营:"+gziying);
	//	String gzhongchou = request.getParameter("gzhongchou");
		String gdelia = request.getParameter("gdelia");
		// gdelia=URLDecoder.decode(gdelia, "utf-8");
		String gdanwei = request.getParameter("gdanwei");
		// gdanwei=URLDecoder.decode(gdanwei,"utf-8");
		// int gid=shangjiaService.lastGoodsId();
		String pp = request.getSession().getServletContext()
				.getRealPath("/admin/images/goodscoder");
		String imgPath = pp + "\\" + gimages;
		String content = "/goodsdetail/detail.html+" + gname;
		String ccbPath = path + "/" + gimages;
		T2DMa ma = new T2DMa();
		ma.encoderQRCode(content, imgPath, "png");
		// System.out.println("二维码："+ma);
		// String decoderContent = ma.decoderQRCode(imgPath);
		// System.out.println("解析结果如下：");
		// System.out.println(decoderContent);
		shangjiaService.update_goods(request, gname, gchandi, gpinpai,
				gjianjie, gimages, gprice, gvipprice, gstatus,gziying,
				gdelia, gdanwei, json, gid);
		// response.getWriter().print("ok");
		return "ok";
	}

	/**
	 * 新增商品
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=addgoods")
	@ResponseBody
	public String addGoods(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String path = request.getSession().getServletContext()
				.getRealPath("/admin/images/goods");
		String defaultImage = request.getParameter("defaultImage");// 默认图片
		String json = request.getParameter("imagelist"); // 其它图片

		String gname = request.getParameter("gname");
		String gchandi = request.getParameter("gchandi");
		String gpinpai = request.getParameter("gpinpai");
		String gjanjie = request.getParameter("gjanjie");
		String gimages = request.getParameter("defaultImage");
		//String gttid = request.getParameter("gttid");
	//	System.out.println("gttid:"+gttid);
		//Goodstwotype goodstwotype = shangjiaService.findById(gttid);
		String gprice = request.getParameter("gprice");
		String gvipprice = request.getParameter("gvipprice");
		String gstatus = request.getParameter("gstatus");
		String gziying = request.getParameter("gziying");
		//String gzhongchou = request.getParameter("gzhongchou");
		String gdelia = request.getParameter("gdelia");
		// gdelia=URLDecoder.decode(gdelia, "utf-8");
		String gdanwei = request.getParameter("gdanwei");
		// gdanwei=URLDecoder.decode(gdanwei,"utf-8");
		// int gid=shangjiaService.lastGoodsId();
		String pp = request.getSession().getServletContext()
				.getRealPath("/admin/images/goodscoder");
		String imgPath = pp + "/" + gimages;
		String content = "/goodsdetail/detail.html+" + gname;
		String ccbPath = path + "/" + gimages;
		T2DMa ma = new T2DMa();
		ma.encoderQRCode(content, imgPath, "png");
		// System.out.println("二维码："+ma);
		// String decoderContent = ma.decoderQRCode(imgPath);
		// System.out.println("解析结果如下：");
		// System.out.println(decoderContent);
		shangjiaService.addgoods2(request, gname, gchandi, gjanjie,gpinpai,
				gimages, gprice, gvipprice, gstatus, gziying, null,
				gdelia, gdanwei, json);
		// response.getWriter().print("ok");
		return "ok";
	}

	/**
	 * 查出所有一级分类 到 新增商品页面中
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addgoodsview")
	public String addgoodsview(HttpServletRequest request,
			HttpServletResponse response) {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		//List onetypelist = shangjiaService.getAllOnetype();
		//request.setAttribute("onetypelist", onetypelist);
		return "/admin/addgoodsview.jsp";
	}


	/**
	 * 添加时 验证该商品是否存在
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=yzgoodsname")
	public String yzgoodsname(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin == null) {
			return "/admin/login.jsp";
		}
		String gname = request.getParameter("gname");
		boolean f = shangjiaService.yzgoodsname(gname);
		if (f)
			response.getWriter().print(true);
		else
			response.getWriter().print(false);
		return null;
	}


	/**
	 * 进入新增商品图片页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addGoodsImagesView")
	public String addGoodsImagesView(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		int page = Integer.parseInt(request.getParameter("page"));
		request.setAttribute("id", id);
		request.setAttribute("page", page);
		return "/admin/addGoodsImages.jsp";
	}

	/**
	 * 新增商品图片
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=addGoodsImages")
	public String addGoodsImages(HttpServletRequest request,
			HttpServletResponse response) {
		String path = request.getSession().getServletContext()
				.getRealPath("/admin/images/goods");
		Map<String, String> map = Upload.upload(request, 5 * 1024 * 1024, path);
		int id = Integer.parseInt(request.getParameter("id")); // 商品ID
		int page = Integer.parseInt(request.getParameter("page")); // 页面
		String gimgstatus = map.get("gimgstatus");
		String gimages = map.get("gimages");
		String gimgdetailwenzi = map.get("gimgdetailwenzi");
		String gimgdetail = map.get("gimgdetail");
		Pattern pattern = Pattern
				.compile("(<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>)");
		Matcher matcher = pattern.matcher(gimgdetail);
		String img = null;
		while (matcher.find()) {
			img = matcher.group(2);
			System.out.println(img);
		}
		System.out.println(gimgdetailwenzi);
		shangjiaService.addGoodsImagesView(id, gimgstatus, gimages, img,
				gimgdetailwenzi);
		return "/shangjiagoods.do?p=sjgoodslinting&page=" + page;
	}

	/**
	 * 查看商品图片
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=checkGoodsImages")
	public String checkGoodsImages(HttpServletRequest request,
			HttpServletResponse response) {
		int page = 1;
		int size = 10;
		String pageString = request.getParameter("page");
		if (StringUtil.isNotNull(pageString) && pageString.trim().length() > 0)
			page = Integer.parseInt(pageString);
		String sizeString = request.getParameter("size");
		if (StringUtil.isNotNull(sizeString) && sizeString.trim().length() > 0)
			size = Integer.parseInt(sizeString);
		int id = Integer.parseInt(request.getParameter("id")); // 商品ID
		Goods goods = shangjiaService.findByIdGood(id);
		Map map = shangjiaService.checkGoodsImages(size, page, id);
		request.setAttribute("gimgmap", map);
		request.setAttribute("goods", goods);
		request.setAttribute("id", id);
		return "/admin/goodsimageslisting.jsp";
	}

	/**
	 * 查看商品二维码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params = "p=checkGoodsCoder")
	public String checkGoodsCoder(HttpServletRequest request,
			HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id")); // 商品ID
		Goods goods = shangjiaService.findByIdGood(id);

		String pp = request.getSession().getServletContext()
				.getRealPath("/admin/images/goodscoder");
		String fileName = goods.getGimages();
		int index = fileName.lastIndexOf("/");
		String name = fileName.substring(index);
		String imgPath = pp + name;
		File f = new File(imgPath);
//		if (f.exists() == false || goods.getGcoder() == null
//				|| goods.getGcoder().length() < 1) 
		{
			String content = URLManager.getServerURL(request)+"/weixin/goodsdetail/detail.jsp?gid="+goods.getGid()+"&state="+goods.getGstatus();
			System.out.println(content);
			T2DMa ma = new T2DMa();
			ma.encoderQRCode(content, imgPath, "png");
			goods.setGcoder("/admin/images/goodscoder" + name);
			shangjiaService.updateGoods(goods);
		}

		request.setAttribute("goods", goods);
		return "/admin/goodscoder.jsp";
	}

	/**
	 * 修改商品图片状态 禁用 or 启用
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "p=updateGoodsImageStatus")
	public String updateGoodsImageStatus(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Goodsimages goodsimages = shangjiaService.updateGoodsImageStatus(id);
		response.getWriter().print(goodsimages.getGimgStatus());
		return null;
	}
}
