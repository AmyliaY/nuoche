package com.service.back;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JsonConfig;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dao.GoodsimagesDAO;
import com.dao.HqlDAO;
import com.pojo.Goods;
import com.pojo.Goodsimages;
import com.util.JsonFilter;
import com.util.StringUtil;

@Service
public class GoodsShangjiaService {
	@Autowired
	private HqlDAO hqlDAO;
	@Autowired
	private GoodsDAO goodsDAO;

	@Autowired
	private GoodsimagesDAO goodsimagesDAO;
	
	
	
	
	

	public Map sjgoodslinting(int size, int page, String gttid,
			String keywords, String minprice, String maxprice) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(gttid) && gttid.trim().length() > 0) {
			sb.append(" and goodstwotype.gttId=?");
			paramList.add(Integer.parseInt(gttid));
		}
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and gname like ?");
			paramList.add("%" + keywords + "%");
		}
		if (StringUtil.isNotNull(minprice) && minprice.trim().length() > 0) {
			sb.append(" and gprice>=?");
			paramList.add(Double.parseDouble(minprice));
		}
		if (StringUtil.isNotNull(maxprice) && maxprice.trim().length() > 0) {
			sb.append(" and gprice<=?");
			paramList.add(Double.parseDouble(maxprice));
		}

		String hqlsum = "select count(*) from Goods" + sb.toString()
				+ " and gstatus=1";
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Goods" + sb.toString()
				+ " and gstatus=1 order by gid desc";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("size", size);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		return map;
	}
	
	
	
	
	
	
	
	/**
	 * 得到所有商品
	 * @param size
	 * @param page
	 * @param gttid
	 * @param keywords
	 * @param minprice
	 * @param maxprice
	 * @return
	 */
	public Map allgoodslinting(int size, int page, String gttid,
			String keywords, String minprice, String maxprice,String gstate) {
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List paramList = new ArrayList();
		if (StringUtil.isNotNull(gttid) && gttid.trim().length() > 0) {
			sb.append(" and goodstwotype.gttId=?");
			paramList.add(Integer.parseInt(gttid));
		}
		if (StringUtil.isNotNull(gstate) && gstate.trim().length() > 0) {
			sb.append(" and gstatus = ?");
			paramList.add(Integer.parseInt(gstate));
		}
		if (StringUtil.isNotNull(keywords) && keywords.trim().length() > 0) {
			sb.append(" and gname like ?");
			paramList.add("%" + keywords + "%");
		}
		if (StringUtil.isNotNull(minprice) && minprice.trim().length() > 0) {
			sb.append(" and gprice>=?");
			paramList.add(Double.parseDouble(minprice));
		}
		if (StringUtil.isNotNull(maxprice) && maxprice.trim().length() > 0) {
			sb.append(" and gprice<=?");
			paramList.add(Double.parseDouble(maxprice));
		}
		String hqlsum = "select count(*) from Goods" + sb.toString();
		int sum = (int) hqlDAO.unique(hqlsum, paramList.toArray());
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Goods" + sb.toString()
				+ " order by gstatus";
		List list = hqlDAO.pageQuery(hql, size, page, paramList.toArray());
		Map map = new HashMap();
		map.put("page", page);
		map.put("gstate", gstate);
		map.put("size", size);
		map.put("count", count);
		map.put("sum", sum);
		map.put("list", list);
		map.put("keywords", keywords);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	

	public Goods xiugaizystatus(int id) {
		Goods goods = goodsDAO.findById(id);
		int zystatus = goods.getGziying();
		if (goods != null)
			goods.setGziying(1 - zystatus);
		goods.setGbegintime(null);
		goods.setGendtime(null);
		goodsDAO.save(goods);
		return goods;
	}

	public Goods xiugaistatus(int id) {
		Goods goods = goodsDAO.findById(id);
		if (goods != null){
			Integer gstatus = goods.getGstatus();
			if(gstatus == 0){
				goods.setGstatus(1);
			}else if(gstatus == 1 ){
				goods.setGstatus(0);
			}
		}
		goods.setGzhongchou(0);
		goodsDAO.save(goods);
		return goods;

	}

	/**
	 * 修改显示隐藏
	 * @param id
	 * @return
	 */
	public Goods xiugaixianshi(int id) {
		Goods goods = goodsDAO.findById(id);
		if (goods != null){
			Integer gstatus = goods.getGstatus();
			if(gstatus == 2){
				goods.setGstatus(0);
			}else {
				goods.setGstatus(2);
			}
		}
		goods.setGzhongchou(0);
		goodsDAO.save(goods);
		return goods;

	}
	
	
	
	
	
	
	
	

	public void plxiajiagoods(String xiajia) {
		String hql = "update Goods set gstatus=0 , gzhongchou=0 where gid in("
				+ xiajia + ")";
		hqlDAO.bulkUpdate(hql);

	}

	
	

	// 新增商品
		public void addgoods(HttpServletRequest request, String gname,
				String gchandi, String gjanjie,String gpinpai, String gimages,
				String gprice, String gvipprice,String gstatus, String gziying,
				String gdelia, String gdanwei,
				String imageLstJson) throws IOException {
			Goods goods = new Goods();
			goods.setGname(gname);
			goods.setGchandi(gchandi);
			goods.setJianjie(gjanjie);
			goods.setGpinpai(gpinpai);
			// goods.setGimages("/admin/images/goods/" + gimages);
			goods.setGprice(Double.parseDouble(gprice));
			goods.setGvipprice(Double.parseDouble(gvipprice));
			goods.setGstatus(Integer.parseInt(gstatus));
			System.out.println("gziying:"+gziying);
			goods.setGziying(Integer.parseInt(gziying));
			goods.setGdetail(gdelia);
			//goods.setGoodstwotype(goodstwotype);
			goods.setGdanwei(gdanwei);
			goods.setGtime("");
			goods.setGcollectionsnum(0);
			goods.setGsellnum(0);
			goods.setGcoder("/admin/images/goodscoder/" + gimages);
			goodsDAO.save(goods);

			// 临时目录
			String temppath = request.getSession().getServletContext().getRealPath(
					"/tmp");

			// 商品图片
			String detailpath = request.getSession().getServletContext()
					.getRealPath("/admin/images/goods/");

			JSONArray jsonArray = new JSONArray(imageLstJson);
			String detaImage = null;
			// 复制默认图片

			// 复制其他图片
			if (jsonArray.length() > 0) {
				// 将图片写入图片表及复制

				for (int i = 0; i < jsonArray.length(); i++) {
					JSONObject jsonObject = jsonArray.getJSONObject(i);
					int id = jsonObject.getInt("id");
					detaImage = jsonObject.getString("image").trim();

					// 默认图片
					// 默认图片
					if (id == 0) {

						goods.setGimages("/admin/images/goods/" + detaImage);
						goodsDAO.merge(goods);
					}
					// 商品详情界面的5个图片
					else {
						// 添加字段
						Goodsimages gimage = new Goodsimages();
						gimage.setGimages("/admin/images/goods/" + detaImage);
						gimage.setGoods(goods);
						gimage.setGimgStatus(1);
						gimage.setGoods(goods);
						gimage.setIndex(id);
						goodsimagesDAO.save(gimage);

						
						/****************************************************************************/
					}
					/****************************************************************************/

					/***** 添加到图片服务器 **/
					final FileInputStream in = new FileInputStream(temppath + "/"
							+ detaImage);
					final FileOutputStream out = new FileOutputStream(detailpath
							+ "/" + detaImage);

					int byteread = 0;
					byte[] buffer = new byte[1024];
					byteread = in.read(buffer);
					while (byteread > 0) {
						// 将读取的字节写入输出流
						out.write(buffer, 0, byteread);
						byteread = in.read(buffer);
					}

					out.close();

					in.close();
					new File(temppath + "/" + detaImage).delete(); //
					// 删除临时文件夹中的图片
				}

			}

		}
	
	// 新增商品
	public void addgoods2(HttpServletRequest request, String gname,
			String gchandi, String gjanjie,String gpinpai, String gimages,
			String gprice, String gvipprice,String gstatus, String gziying,String gzhongchou,
			String gdelia, String gdanwei,
			String imageLstJson) throws IOException {
		Goods goods = new Goods();
		goods.setGname(gname);
		goods.setGchandi(gchandi);
		goods.setJianjie(gjanjie);
		goods.setGpinpai(gpinpai);
		// goods.setGimages("/admin/images/goods/" + gimages);
		goods.setGprice(Double.parseDouble(gprice));
		goods.setGvipprice(Double.parseDouble(gvipprice));
		goods.setGstatus(Integer.parseInt(gstatus));
		//System.out.println("gziying:"+gziying);
		goods.setGziying(0);
		//System.out.println("gzhongchou:"+gzhongchou);
		goods.setGzhongchou(0);
		//System.out.println("gttid:"+goodstwotype);
		//goods.setGoodstwotype(goodstwotype);
		goods.setGdetail(gdelia);
		goods.setGdanwei(gdanwei);
		goods.setGtime("");
		goods.setGcollectionsnum(0);
		goods.setGsellnum(0);
		goods.setGcoder("/admin/images/goodscoder/" + gimages);
		goodsDAO.save(goods);

		// 临时目录
		String temppath = request.getSession().getServletContext().getRealPath(
				"/tmp");

		// 商品图片
		String detailpath = request.getSession().getServletContext()
				.getRealPath("/admin/images/goods/");

		JSONArray jsonArray = new JSONArray(imageLstJson);
		String detaImage = null;
		// 复制默认图片

		// 复制其他图片
		if (jsonArray.length() > 0) {
			// 将图片写入图片表及复制

			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				int id = jsonObject.getInt("id");
				detaImage = jsonObject.getString("image").trim();

				// 默认图片
				// 默认图片
				if (id == 0) {

					goods.setGimages("/admin/images/goods/" + detaImage);
					goodsDAO.merge(goods);
				}
				// 商品详情界面的5个图片
				else {
					// 添加字段
					Goodsimages gimage = new Goodsimages();
					gimage.setGimages("/admin/images/goods/" + detaImage);
					gimage.setGoods(goods);
					gimage.setGimgStatus(1);
					gimage.setGoods(goods);
					gimage.setIndex(id);
					goodsimagesDAO.save(gimage);

					
					/****************************************************************************/
				}
				/****************************************************************************/

				/***** 添加到图片服务器 **/
				final FileInputStream in = new FileInputStream(temppath + "/"
						+ detaImage);
				final FileOutputStream out = new FileOutputStream(detailpath
						+ "/" + detaImage);

				int byteread = 0;
				byte[] buffer = new byte[1024];
				byteread = in.read(buffer);
				while (byteread > 0) {
					// 将读取的字节写入输出流
					out.write(buffer, 0, byteread);
					byteread = in.read(buffer);
				}

				out.close();

				in.close();
				new File(temppath + "/" + detaImage).delete(); //
				// 删除临时文件夹中的图片
			}

		}

	}

	// 修改商品
	public void update_goods(HttpServletRequest request, String gname,
			String gchandi, String gpinpai,String jianjie, String gimages,
			String gprice, String gvipprice,
			String gstatus,String gziying, String gdelia, String gdanwei,
			String imageLstJson, String gid) throws IOException {
		Goods goods = goodsDAO.findById(Integer.parseInt(gid));
		goods.setGname(gname);
		goods.setGchandi(gchandi);
		goods.setGpinpai(gpinpai);
		goods.setJianjie(jianjie);
		// goods.setGimages("/admin/images/goods/" + gimages);
		goods.setGprice(Double.parseDouble(gprice));
		goods.setGvipprice(Double.parseDouble(gvipprice));
		goods.setGstatus(Integer.parseInt(gstatus));
	    goods.setGzhongchou(0);
		goods.setGziying(0);
		goods.setGdetail(gdelia);
	//	goods.setGoodstwotype(goodstwotype);
		goods.setGdanwei(gdanwei);
		goods.setGtime("");
		goods.setGcollectionsnum(0);
		goods.setGsellnum(0);
		goods.setGcoder("/admin/images/goodscoder/" + gimages);
		goodsDAO.save(goods);

		// 临时目录
		String temppath = request.getSession().getServletContext().getRealPath(
				"/tmp");

		// 商品图片
		String detailpath = request.getSession().getServletContext()
				.getRealPath("/admin/images/goods/");

		JSONArray jsonArray = new JSONArray(imageLstJson);
		String detaImage = null;
		// 复制默认图片

		// 复制其他图片
		if (jsonArray.length() > 0) {
			// 将图片写入图片表及复制

			for (int i = 0; i < jsonArray.length(); i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				int id = jsonObject.getInt("id");
				detaImage = jsonObject.getString("image").trim();

				// 默认图片
				// 默认图片
				if (id == 0) {

					goods.setGimages("/admin/images/goods/" + detaImage);
					goodsDAO.merge(goods);
				}
				// 商品详情界面的5个图片
				else {
					// 添加字段
					String hql = "from Goodsimages g where g.goods=? and index=?";
					List list = hqlDAO.pageQuery(hql, 1, 1, goods, id);
					if (list.size() > 0) {
						Goodsimages gimage = (Goodsimages) list.get(0);
						gimage.setGimages("/admin/images/goods/" + detaImage);
						// gimage.setIndex(id);
						goodsimagesDAO.merge(gimage);
					}
					else
					{
						Goodsimages gimage = new Goodsimages();
						gimage.setGimages("/admin/images/goods/" + detaImage);
						gimage.setGoods(goods);
						gimage.setGimgStatus(1);
						gimage.setGoods(goods);
						gimage.setIndex(id);
						goodsimagesDAO.save(gimage);
					}

					
					/****************************************************************************/
				}
				/****************************************************************************/

				/***** 添加到图片服务器 **/
				try {
					final FileInputStream in = new FileInputStream(temppath + "/"
							+ detaImage);
					final FileOutputStream out = new FileOutputStream(detailpath
							+ "/" + detaImage);

					int byteread = 0;
					byte[] buffer = new byte[1024];
					byteread = in.read(buffer);
					while (byteread > 0) {
						// 将读取的字节写入输出流
						out.write(buffer, 0, byteread);
						byteread = in.read(buffer);
					}

					out.close();
					in.close();
					
					new File(temppath + "/" + detaImage).delete(); //
				} catch (Exception e) {
					// TODO: handle exception
				}
				// 删除临时文件夹中的图片
			}

		}

	}


	public boolean yzgoodsname(String gname) {
		String hql = "from Goods where gname=?";
		List list = hqlDAO.query(hql, gname);
		if (list.size() > 0)
			return true;
		return false;
	}

	public Goods gzhongchouset(int id) {
		Goods goods = goodsDAO.findById(id);
		if (goods != null)
			goods.setGzhongchou(1);
		goodsDAO.save(goods);
		return goods;
	}

	public Goods findByIdGood(int id) {
		return goodsDAO.findById(id);
	}


	public void addGoodsImagesView(int id, String gimgstatus, String gimages,
			String img, String gimgdetailwenzi) {
		Goods goods = goodsDAO.findById(id);
		Goodsimages goodsimages = new Goodsimages();
		goodsimages.setGimgStatus(Integer.parseInt(gimgstatus));
		goodsimages.setGimages("/admin/images/goods/" + gimages);
		goodsimages.setGimgDetail(img + "+" + gimgdetailwenzi);
		goodsimages.setGoods(goods);
		goodsimages.setGimgTime(new Timestamp(System.currentTimeMillis()));
		goodsimagesDAO.save(goodsimages);

	}

	public Map checkGoodsImages(int size, int page, int id) {
		String hqlsum = "select count(*) from Goodsimages where goods.gid=?";
		int sum = (int) hqlDAO.unique(hqlsum, id);
		int count = sum % size == 0 ? sum / size : sum / size + 1;
		if (page < 1)
			page = 1;
		if (page > count)
			page = count;
		String hql = "from Goodsimages where goods.gid=?";
		List list = hqlDAO.pageQuery(hql, size, page, id);
		Map map = new HashMap();
		map.put("count", count);
		map.put("sum", sum);
		map.put("page", page);
		map.put("size", size);
		map.put("list", list);
		return map;
	}

	public Goodsimages updateGoodsImageStatus(int id) {
		Goodsimages goodsimages = goodsimagesDAO.findById(id);
		int status = goodsimages.getGimgStatus();
		if (goodsimages != null)
			goodsimages.setGimgStatus(1 - status);
		goodsimagesDAO.save(goodsimages);
		return goodsimages;
	}

	public int lastGoodsId() {
		String hql = "select max(gid) from Goods";
		int gid = (int) hqlDAO.unique(hql);
		System.out.println("最后一条ID：" + gid);
		return gid;
	}

	/**
	 * 获取图片
	 * 
	 * @param parseInt
	 * @return
	 */
	public List<Goodsimages> getDetailImage(int gid) {
		String hql = "from Goodsimages g  where g.goods.gid=?";
		List list = hqlDAO.findByHQL(hql, gid);
		return list;
	}

	public void updateGoods(Goods goods) {
		goodsDAO.merge(goods);
	}
	

}
