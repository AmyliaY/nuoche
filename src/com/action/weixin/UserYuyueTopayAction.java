package com.action.weixin;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.JccsAction;
import com.action.WeixinConfig;
import com.pojo.Yuyue;
import com.service.weixin.UserYuyueTopayService;
import com.util.URLManager;

import weixin.popular.api.MessageAPI;
import weixin.popular.api.TokenAPI;
import weixin.popular.bean.Token;
import weixin.popular.bean.pay.PayNotify;
import weixin.popular.bean.templatemessage.TemplateMessage;
import weixin.popular.bean.templatemessage.TemplateMessageItem;
import weixin.popular.util.JSSDKUtil;
import weixin.popular.util.SignatureUtil;
import weixin.popular.util.XMLConverUtil;
/**
 * 用户预约服务支付Action-查仕龙
 * @author dell
 *
 */



@Controller
@RequestMapping("/useryuyuetopay.do")
public class UserYuyueTopayAction {
	
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private UserYuyueTopayService yuyueService;
	
//  支付
	@RequestMapping(params="p=topay")
	public String topay(HttpServletResponse response){
		int yuyueid = Integer.parseInt(request.getParameter("yuyueid"));
		String openid = request.getParameter("openid");
		Yuyue yuyue = yuyueService.findYuyueByid(yuyueid);
		String money =yuyue.getPay().toString();
		String orderid = yuyueService.updateOrderId(yuyue);
	    
		openid = yuyue.getUser().getOpenid();
		
		
		
		
		
		request.getSession().setAttribute("openid", openid);
		String notifyUrl = URLManager.getServerURL(request)+ "/useryuyuetopay.do";
		String json = JSSDKUtil.setPayParam(request, notifyUrl, money, orderid,
				openid);
		
		// 4.调用微信支付
		return "/wap/pay/pay_example2.jsp";
	}
//  回调
	@RequestMapping
	public String payNotify(HttpServletResponse response) throws IOException {
		InputStream is = request.getInputStream();
		byte[] b = new byte[1024];
		int size = is.read(b);
		String str = new String(b, 0, size);
		//System.out.println("封装的xml："+str);
		// 获取请求数据
		PayNotify payNotify = XMLConverUtil.convertToObject(PayNotify.class,
				str);

		// 签名判断略...
		String sign = payNotify.getSign();

		boolean f = SignatureUtil.validateAppSignature(payNotify,
				WeixinConfig.PAY_KEY);
		//System.out.println("签名判断："+f);
		

		
		// 支付成功
		if ("SUCCESS".equals(payNotify.getResult_code())
				&& "SUCCESS".equals(payNotify.getReturn_code())) {
			String trade_no = payNotify.getOut_trade_no();
			
			//  支付成功次改订单状态
			Yuyue yuyue = yuyueService.updateStatusByOrderid(trade_no);
			
			int shopid = yuyue.getService().getBusiness().getId();//商家ID
			
			int fuwuleixingid = yuyue.getService().getServiceType().getId();//  服务类型id
			
			String yuyueopenid = yuyue.getUser().getOpenid();  //  得到预约人的微信号
			
			String shangjiaopenid = yuyue.getService().getBusiness().getOpenid();//   得到商家的微信号

			String kehunicheng = yuyue.getUser().getNickname();   //得到微信用户的昵称
			
			String sjname = yuyue.getService().getBusiness().getShopname();   //得到商店名
			
			String realname = yuyue.getService().getBusiness().getRealname();  //店主姓名
			
			String sjtel = yuyue.getService().getBusiness().getTel();
			
			String shangjiadianhua = yuyue.getService().getBusiness().getTel();
			String kehudianhua = yuyue.getUser().getWxtel();
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
			//linkedHashMap.put("keyword2", new TemplateMessageItem("", "#173177"));  //客户车牌   可有可无
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
