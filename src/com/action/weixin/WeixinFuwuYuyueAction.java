package com.action.weixin;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import weixin.popular.api.TokenAPI;
import weixin.popular.bean.Token;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import weixin.popular.bean.AccessToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.action.JccsAction;
import com.action.WeixinConfig;
import com.pojo.Service;
import com.pojo.User;
import com.pojo.WeixinUser;
import com.pojo.Yuyue;
import com.service.weixin.WeixinFuwuYuyueService;
import com.service.weixin.WeiXinMoveCarService;
import com.util.StringUtil;
import com.util.URLManager;

import weixin.popular.api.MessageAPI;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.bean.templatemessage.TemplateMessage;
import weixin.popular.bean.templatemessage.TemplateMessageItem;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;

@Controller
@RequestMapping("/fuwuyuyue.do")
public class WeixinFuwuYuyueAction {
	@Autowired
	private WeixinFuwuYuyueService yuyueService;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private WeiXinMoveCarService movecarservice;
	
	//   查询服务详情
	@RequestMapping(params="p=fuwudetailbyid")
	public String fuwudetailByid(HttpServletRequest request, HttpServletResponse response){
		int fuwuid = Integer.parseInt(request.getParameter("fuwuid"));
		int shopid =Integer.parseInt(request.getParameter("shopid"));
		String openid=request.getParameter("openid");
		String yuyueprice = JccsAction.getVipyuyueprice();
		request.setAttribute("yuyueprice", yuyueprice);
		request.setAttribute("openid", openid);
		Service service = yuyueService.findServiceByid(fuwuid);
		request.setAttribute("service", service);
		
		request.setAttribute("shopid", shopid);
		return "wap/shop/servicedetail.jsp";
	}
	//  进入预约界面
	
	@RequestMapping(params="p=fuwuyuyuebyid")
	public String fuwuYuyuebyid(HttpServletRequest request, HttpServletResponse response){
		int fuwuid = Integer.parseInt(request.getParameter("fuwuid"));
		int shopid =Integer.parseInt(request.getParameter("shopid"));
		Service service = yuyueService.findServiceByid(fuwuid);
		String openid=request.getParameter("openid");
		WeixinUser weixinUser = yuyueService.getWeixinUser(openid);
		String yuyueprice = JccsAction.getVipyuyueprice();
		request.setAttribute("yuyueprice", yuyueprice);
		request.setAttribute("weixinUser", weixinUser);
		request.setAttribute("openid", openid);
		request.setAttribute("service", service);
		request.setAttribute("shopid", shopid);
		return "wap/shop/yuyue.jsp";
	}
	
	//  创建预约订单
	@RequestMapping(params="p=createorder")
	public String createorder(HttpServletRequest request, HttpServletResponse response){
		int fuwuid = Integer.parseInt(request.getParameter("fuwuid"));
		// 获取留言
		String buyerComment = request.getParameter("textarea");
		String openid=request.getParameter("openid");
		String wxtel = request.getParameter("wxtel").trim();
		WeixinUser weixinUser = yuyueService.getWeixinUser(openid);
		//String tel=null;
		 weixinUser.setWxtel(wxtel);
//		if(StringUtil.isNotNull(wxtel)&&!wxtel.equals(tel))
//		{//  用户输入的电话号码与weixinuser表中的电话号码不一致时  更新weixinuser表中的tel
//			yuyueService.updateWeixinUserTel(weixinUser,wxtel);
//		}
		String yuyueprice = JccsAction.getVipyuyueprice();
		
		//  生成订单号
		String orderWx = yuyueService.getOrderid();
//		System.out.println("服务ID"+fuwuid);
//		System.out.println("用户留言："+buyerComment);
//		System.out.println("订单号："+orderWx);
//		System.out.println("openid："+openid);
//		System.out.println("wxtel:"+wxtel);
		Yuyue yuyue = yuyueService.createYuyueOrder(fuwuid,buyerComment,openid,yuyueprice,orderWx);
		//   格式化时间
		Timestamp timestamp = yuyue.getCreated();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String created = sdf.format(timestamp);
		request.setAttribute("created", created);
		request.setAttribute("yuyue", yuyue);
		request.setAttribute("openid", openid);
		return "wap/shop/order-confirm.jsp";
	}
	//  取消预约
	@RequestMapping(params="p=cancel")
	@ResponseBody
	public String cancel(HttpServletRequest request, HttpServletResponse response){
		int yuyueid = Integer.parseInt(request.getParameter("yuyueid"));
		String openid = request.getParameter("openid");
		yuyueService.cancelYuyueOrder(yuyueid);
		return "ok";
	}
	//   支付
	@RequestMapping(params="p=topay")
	public String topay(HttpServletResponse response){
		int yuyueid = Integer.parseInt(request.getParameter("yuyueid"));
		String openid = request.getParameter("openid");
		Yuyue yuyue = yuyueService.findYuyueByid(yuyueid);
		String money =yuyue.getPay().toString();
		String orderid = yuyue.getOrderWx();
		int fuwuid = Integer.parseInt(request.getParameter("fuwuid"));
		int shopid =Integer.parseInt(request.getParameter("shopid"));
		request.setAttribute("fuwuid",fuwuid );
		request.setAttribute("shopid", shopid);
		
		request.getSession().setAttribute("openid", openid);
		String notifyUrl = URLManager.getServerURL(request)+ "/fuwuyuyue.do";
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderid,
				openid);
//		System.out.println("来支付了  宝贝：");
//		System.out.println("支付金额："+money);
//		System.out.println("订单号："+orderid);
//		System.out.println("微信号："+openid);
		// 4.调用微信支付
		return "/wap/pay/pay_example.jsp";
	}
	//  回调
	@RequestMapping
	public String payNotify(HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);
//		System.out.println("封装的xml："+str);
		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		String sign = payNotify.getSign();

		boolean f = SignatureUtil.validateAppSignature(payNotify,
				WeixinConfig.PAY_KEY);
//		System.out.println("签名判断："+f);
		

		
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			
			//  支付成功次改订单状态
			Yuyue yuyue = yuyueService.updateStatusByOrderid(trade_no);
			
			int shopid = yuyue.getService().getBusiness().getId();//商家ID
			
			int fuwuleixingid = yuyue.getService().getServiceType().getId();//  服务类型id
			
			String yuyueopenid = yuyue.getUser().getOpenid();  //  得到预约人的微信号
			
			User user = yuyueService.getUserByWXuser(yuyueopenid);
			String chepaihao =user.getPlateNumber(); //得到车牌号
			
			String shangjiaopenid = yuyue.getService().getBusiness().getOpenid();//   得到商家的微信号

			String kehunicheng = yuyue.getUser().getNickname();   //得到微信用户的昵称
			
			String sjname = yuyue.getService().getBusiness().getShopname();   //得到商店名
			
			String realname = yuyue.getService().getBusiness().getRealname();  //店主姓名
			
			String sjtel = yuyue.getService().getBusiness().getTel();
			
			String kehudianhua = yuyue.getUser().getWxtel();
			String tel = "";//yuyue.getUser().getTel();
			response.getOutputStream().write("success".getBytes());
			
			
			
			
			
		
				TemplateMessage templateMessage = new TemplateMessage();
				String jyz_url = "";  //  URLManager.getServerURL(request) + "/move.do?p=xgjl&wxh=" + wxh;
				String jyz_newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
						+ WeixinConfig.APPID
						+ "&redirect_uri="
						+ URLEncoder.encode(jyz_url, "utf-8")
						+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
				templateMessage.setUrl(jyz_url);
				templateMessage.setTopcolor("#173177");
				templateMessage.setTouser(shangjiaopenid); // 接收者
				templateMessage.setTemplate_id("Vap9WOykqE1jZBxMvKb2ERq1aRVl6z8OC2F4upbuH8g");
				// TemplateMessageItem item = new TemplateMessageItem(value, color)
				LinkedHashMap linkedHashMap = new LinkedHashMap();
				linkedHashMap.put("first", new TemplateMessageItem("您有一个新预约","#173177"));
				linkedHashMap.put("remark", new TemplateMessageItem("请在24小时内与客户联系确认", "#173177"));
				Date date = new Date();
				SimpleDateFormat spd = new SimpleDateFormat("yyyy年MM月dd日  HH:mm");
				String t = spd.format(date);
				linkedHashMap.put("keyword1",new TemplateMessageItem(kehunicheng, "#173177"));   //客户呢称
				linkedHashMap.put("keyword2", new TemplateMessageItem(chepaihao, "#173177"));  //客户车牌   可有可无
				linkedHashMap.put("keyword3", new TemplateMessageItem(kehudianhua, "#173177"));  //客户电话
				linkedHashMap.put("keyword4", new TemplateMessageItem(t, "#173177"));  //预约时间
				
				templateMessage.setData(linkedHashMap);
				MessageAPI messageAPI = new MessageAPI();
	
				String appid = WeixinConfig.APPID;
				String secret = WeixinConfig.APPSECRET;
				Token token = new TokenAPI().token(appid, secret);
				String access_token = token.getAccess_token();
				messageAPI.messageTemplateSend(access_token, templateMessage);
			}
			
		
        
		return null;

	}
	
	

}
