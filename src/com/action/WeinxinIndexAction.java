package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import weixin.popular.api.MenuAPI;
import weixin.popular.api.UserAPI;
import weixin.popular.bean.EventMessage;
import weixin.popular.bean.MenuButtons;
import weixin.popular.bean.User;
import weixin.popular.bean.MenuButtons.Button;
import weixin.popular.util.ExpireSet;
import weixin.popular.util.XMLConverUtil;

import com.listener.WeixinGetAccessTokenListen;
import com.service.weixin.WeixinUserService;
import com.thoughtworks.xstream.XStream;
import com.util.URLManager;
import com.weixin.pojo.TextMessage;

/**
 * 微信开发首页
 * 
 * @author lgh
 * 
 * 
 */
// 创建对象
@Controller
// 形成映射
@RequestMapping("/weixin.do")
public class WeinxinIndexAction {
	
	
	@Autowired
	private WeixinUserService weixinUserService;

	// 重复通知过滤 时效60秒
	private static ExpireSet<String> expireSet = new ExpireSet<String>(60);


	@RequestMapping
	public String index(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		ServletInputStream inputStream = request.getInputStream();

		String echostr = request.getParameter("echostr");


		// 首次请求申请验证,返回echostr
		if (echostr != null) {
			response.getWriter().print(echostr);
			return null;
		}

		try {
			addMenu(request);

			// 获取公众号ID
			EventMessage eventMessage = XMLConverUtil.convertToObject(
					EventMessage.class, inputStream);
			// 推荐人
			String eventKey = eventMessage.getEventKey();
			String Ticket = eventMessage.getTicket();
			/*if (Ticket != null && eventKey != null) {
				String[] key = eventKey.split("_");
				if (key.length > 1) {
					System.out.println("分享注册 ");
					request.getSession().setAttribute("eventKey", key[1]);

					// 注册的url
					String jyz_url = URLManager.getServerURL(request)
							+ "/weixin_zhuce.do?w=weixin_zhuceschool&tjr="
							+ key[1];
					String jyz_newUrl = "https://open.weixin.qq.com/connect/authorize?appid="
							+ WeixinConfig.APPID
							+ "&redirect_uri="
							+ URLEncoder.encode(jyz_url, "utf-8")
							+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

					StringBuffer sb = new StringBuffer("欢迎关注米禾校园\n");
					sb.append("你的推荐人是:");
					//sb.append(userService.queryTjr(key[1]));
					sb.append("\n");
					sb.append("点击此处即可注册,并领取抽奖机会\t<a href='" + jyz_newUrl
							+ "'>注册</a>");

					response.setCharacterEncoding("utf-8");
					com.weixin.pojo.TextMessage textMessage = new com.weixin.pojo.TextMessage();
					textMessage.setContent(sb.toString());
					textMessage.setCreateTime(new Date().getTime());
					textMessage.setFromUserName(eventMessage.getToUserName());
					textMessage.setMsgType("text");
					textMessage.setMsgId(eventMessage.getMsgId());
					textMessage.setToUserName(eventMessage.getFromUserName());
					response.getWriter().print(TextMessageToXml(textMessage));
					return null;
				}

			}*/
			

			String msgType = eventMessage.getMsgType();
			String weixinhao = eventMessage.getFromUserName();

			UserAPI userAPI = new UserAPI();
			Integer flag = -1;
			User user = userAPI.userInfo(
					WeixinGetAccessTokenListen.access_token, weixinhao);

			String Event = eventMessage.getEvent();
			System.out.println("当前事件：" + Event);
			// ----------------- 关注-----------------------
			if ("subscribe".equals(Event)) {
				addMenu(request);
				weixinUserService.addUser(user);
				//关注了以后，设置其推荐人
				go(eventMessage,request,response,user);
			}
			// ----------------- 取消-----------------------
			if ("unsubscribe".equals(Event)) {
				weixinUserService.quxiaoSubscribe(user);
			}

			// --------------------智能回答系统-----------------------------------
			if ("text".equals(msgType)) {
				response.setCharacterEncoding("utf-8");
				String content = eventMessage.getContent();
				if ("m".equalsIgnoreCase(content)) {
					addMenu(request);
				}
				com.weixin.pojo.TextMessage textMessage = new com.weixin.pojo.TextMessage();
				textMessage.setContent("我是机器人Robert，感谢您的回复，我会把您的信息转告给主人。");
				textMessage.setCreateTime(new Date().getTime());
				textMessage.setFromUserName(eventMessage.getToUserName());
				textMessage.setMsgType("text");
				textMessage.setMsgId(eventMessage.getMsgId());
				textMessage.setToUserName(eventMessage.getFromUserName());
				response.getWriter().print(TextMessageToXml(textMessage));
				return null;
			}
			// -----------------------------------------------------------------

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void go(EventMessage eventMessage,HttpServletRequest request, HttpServletResponse response, User user) throws IOException
	{
		String Ticket = eventMessage.getTicket();
		//EventKey关注事件
		String eventKey = eventMessage.getEventKey();
		System.out.println(Ticket);
		System.out.println(eventKey);
		
		if (Ticket != null && eventKey != null) {
			String[] key = eventKey.split("_");
			if (key.length > 1) {
				System.out.println("挪车的分享注册 ");
				request.getSession().setAttribute("eventKey", key[1]);
				//key[1]就是myExtention.jsp页面传过来的id
				//根据id查出推荐人，设置当前用户的推荐人
				String tjr = key[1];
				System.out.println("tjr--------"+tjr);
				weixinUserService.setTuijianren(tjr,user);
				
				// 申请二维码的url
				String url3_1 = URLManager.getServerURL(request)
						+ "/applyforqrcode.do?method=applyforqrcodeindex";
				String newurl3_1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
						+ WeixinConfig.APPID
						+ "&redirect_uri="
						+ URLEncoder.encode(url3_1, "utf-8")
						+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";

				String aboutMeUrl = URLManager.getServerURL(request)+"/aboutwe.do?p=aboutwe";
				StringBuffer sb = new StringBuffer("欢迎关注卡卡挪车\n");
				sb.append("<a href='"+aboutMeUrl+"'>关于我们</a>");
				//sb.append(userService.queryTjr(key[1]));
				sb.append("\n");
				sb.append("点击此处即可注册成为我们的会员，让您的爱车享受一体化完美呵护！\t<a href='" + newurl3_1
						+ "'>购买车贴</a>");

				response.setCharacterEncoding("utf-8");
				com.weixin.pojo.TextMessage textMessage = new com.weixin.pojo.TextMessage();
				textMessage.setContent(sb.toString());
				textMessage.setCreateTime(new Date().getTime());
				textMessage.setFromUserName(eventMessage.getToUserName());
				textMessage.setMsgType("text");
				textMessage.setMsgId(eventMessage.getMsgId());
				textMessage.setToUserName(eventMessage.getFromUserName());
				response.getWriter().print(TextMessageToXml(textMessage));
				return;
				
			}

		}
	}

	/**
	 * 文本消息对象转换成xml
	 * 
	 * @param textMessage
	 *            文本消息对象
	 * @return xml
	 */
	public static String TextMessageToXml(TextMessage textMessage) {

		XStream stream = new XStream();

		stream.alias("xml", textMessage.getClass());

		return stream.toXML(textMessage);
	}

	
	/*
	 * 修改部分   康旺 唐仁鑫
	 * 
	 * */
	
	/**
	 * 新增微信菜单
	 * 
	 * @param request
	 * @throws UnsupportedEncodingException
	 */
	private void addMenu(HttpServletRequest request)
			throws UnsupportedEncodingException {

		// -----------------------菜单1选项--------------------
		Button btnOne = new Button();// 第一个按钮
		btnOne.setType("view");
		btnOne.setName("扫码挪车");
		btnOne.setKey("MENU_ONE");
		String url = URLManager.getServerURL(request)
				+ "/move.do?p=moveCar2";
		btnOne.setUrl(url);
		
		// -------------菜单2选项--------------
		Button btnTwo = new Button();// 第二个按钮
		btnTwo.setType("click");
		btnTwo.setName("车友");
		btnTwo.setKey("MENU_TWO");
		
		// 2.1
		Button btnTwo1 = new Button();
		btnTwo1.setType("view");
		btnTwo1.setName("9折预约");
		
		String btnTwo1_url = URLManager.getServerURL(request)
				+ "/weixinCheyou.do?p=yuyue";
		String newUrl_btnTwo1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(btnTwo1_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo1.setUrl(newUrl_btnTwo1);// 两个不同的浏览器 session不一样 .do有缓存
		
		Button btnTwo2 = new Button();
		btnTwo2.setType("view");
		btnTwo2.setName("88折加油");
		String btnTwo2_url = URLManager.getServerURL(request)
				+ "/weixinCheyou.do?p=jiaoyou";
		String newUrl_btnTwo2 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(btnTwo2_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo2.setUrl(newUrl_btnTwo2);// 两个不同的浏览器 session不一样 .do有缓存
	
		Button btnTwo3 = new Button();
		btnTwo3.setType("view");
		btnTwo3.setName("7折商城");
		String btnTwo3_url = URLManager.getServerURL(request)
				+ "/weixinCheyou.do?p=shop";
		String newUrl_btnTwo3 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(btnTwo3_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo3.setUrl(newUrl_btnTwo3);// 两个不同的浏览器 session不一样 .do有缓存
	
		
		Button btnTwo4 = new Button();
		btnTwo4.setType("view");
		btnTwo4.setName("6折车险");
		String btnTwo4_url = URLManager.getServerURL(request)
				+ "/weixinCheyou.do?p=chexian";
		String newUrl_btnTwo4 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(btnTwo4_url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnTwo4.setUrl(newUrl_btnTwo4);// 两个不同的浏览器 session不一样 .do有缓存
	
		List<Button> list2 = new ArrayList<Button>();
		list2.add(btnTwo1);
		list2.add(btnTwo2);
		list2.add(btnTwo3);
		list2.add(btnTwo4);
		
		btnTwo.setSub_button(list2);
		//-------------------------菜单3选项----------------
		Button btnThree = new Button();// 第三个按钮
		btnThree.setType("click");
		btnThree.setName("我");
		btnThree.setKey("MENU_THREE");

		// 3.1 申请二维码
		Button btnThree1 = new Button();
		btnThree1.setName("申请二维码");
		btnThree1.setType("view");
		String url3_1 = URLManager.getServerURL(request)
				+ "/applyforqrcode.do?method=applyforqrcodeindex";
		String newurl3_1 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_1, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree1.setUrl(newurl3_1);

		// 3.2 绑定车牌
		Button btnThree2 = new Button();
		btnThree2.setType("view");
		btnThree2.setName("绑定车牌");
		String url3_2 = URLManager.getServerURL(request)
				+ "/move.do?p=moveCar2";
		String newUrl3_2 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_2, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree2.setUrl(newUrl3_2);

		//3.3 个人中心
		Button btnThree3 = new Button();
		btnThree3.setName("个人中心");
		btnThree3.setType("view");
		String url3_3 = URLManager.getServerURL(request)
				+ "/personCenter.do?method=index";
		String newUrl3_3 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_3, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree3.setUrl(newUrl3_3);
		
		Button btnThree4 = new Button();
		btnThree4.setName("免费电话");
		btnThree4.setType("view");
		String url3_4 = URLManager.getServerURL(request)
				+ "/move.do?p=dhtongzhi";
		String newUrl3_4 = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ WeixinConfig.APPID
				+ "&redirect_uri="
				+ URLEncoder.encode(url3_4, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		btnThree4.setUrl(newUrl3_4);
		
		List<Button> list3 = new ArrayList<Button>();
		list3.add(btnThree1);//  申请二维码
		list3.add(btnThree2); // 绑定车牌
		list3.add(btnThree4); // 免费电话
		list3.add(btnThree3); // 个人中心
		btnThree.setSub_button(list3);
		
		
        //-------------------------------------------------
		List list = new ArrayList(); // 多个menu集合
		list.add(btnOne);
		list.add(btnTwo);
		list.add(btnThree);
		MenuButtons menus = new MenuButtons();
		Button[] arrayButton = new Button[list.size()];
		list.toArray(arrayButton);// list转为数组（类型为Button）
		menus.setButton(arrayButton);
		new MenuAPI()
				.menuCreate(WeixinGetAccessTokenListen.access_token, menus);

	}

	public static void main(String[] args) throws UnsupportedEncodingException {

		String url = "http://miheschool.com/newsIndex.do?method=findAll";

		String appid = WeixinConfig.APPID;
		String newUrl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid="
				+ appid
				+ "&redirect_uri="
				+ URLEncoder.encode(url, "utf-8")
				+ "&response_type=code&scope=snsapi_base&state=1#wechat_redirect";
		System.out.println(newUrl);
	}

}
