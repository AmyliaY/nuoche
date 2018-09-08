<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport"
			content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<LINK rel="Bookmark"
			href="${pageContext.request.contextPath }/lib/favicon.ico">
		<LINK rel="Shortcut Icon"
			href="${pageContext.request.contextPath }/lib/favicon.ico" />
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/html5.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/respond.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/PIE_IE678.js">
</script>
		<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/skin/default/skin.css"
			rel="stylesheet" type="text/css" id="skin" />
		<link href="${pageContext.request.contextPath }/lib/css/style.css"
			rel="stylesheet" type="text/css" />
		<LINK rel="Bookmark" href="/favicon.ico">
		<LINK rel="Shortcut Icon" href="/favicon.ico" />


		<link href="${pageContext.request.contextPath }/lib/css/H-ui.min.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
			rel="stylesheet" type="text/css" />
		<link
			href="${pageContext.request.contextPath }/lib/skin/default/skin.css"
			rel="stylesheet" type="text/css" id="skin" />
		<link href="${pageContext.request.contextPath }/lib/css/style.css"
			rel="stylesheet" type="text/css" />

		<title>卡卡挪车-超级管理员后台</title>
		<meta name="keywords"
			content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
		<meta name="description"
			content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
	</head>
	<body>
<c:if test="${empty admin}">
	<c:redirect url="/admin/login.jsp"></c:redirect>
</c:if>
		<header class="Hui-header cl">
		<a class="Hui-logo l" title="超级管理员后台" href="/">超级管理员后台</a>
		<a class="Hui-logo-m l" href="/" title="H-ui.admin">H-uihit</a>
		<span class="Hui-subtitle l">V1.0</span>
		<nav class="mainnav cl" id="Hui-nav">
		</nav>
		<ul class="Hui-userbar">
			<li>
				欢迎:
			</li>
			<li class="dropDown dropDown_hover">
				<a href="#" class="dropDown_A">${admin.username} <i
					class="Hui-iconfont">&#xe6d5;</i> </a>
				<ul class="dropDown-menu radius box-shadow">
					<li>
						<a onclick="showMessage(this)" target="iframe_box"
					_href="${pageContext.request.contextPath }/admin_admin.do?p=xiugaipsd&id=${admin.id}"
					title="修改密码">修改密码 </a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/login.jsp">切换账户</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/login.jsp">退出</a>
					</li>
				</ul>
			</li>
			<li id="Hui-msg">
				<a onclick="showMessage(this)" target="iframe_box"
					_href="${pageContext.request.contextPath }/uamessages.do?p=messageslisting"
					title="消息"><span id="msgsum" class="badge badge-danger"></span><i
					class="Hui-iconfont" style="font-size: 18px">&#xe68a;</i> </a>
			</li>
			<li id="Hui-skin" class="dropDown right dropDown_hover">
				<a href="javascript:;" title="换肤"><i class="Hui-iconfont"
					style="font-size: 18px">&#xe62a;</i> </a>
				<ul class="dropDown-menu radius box-shadow">
					<li>
						<a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
					</li>
					<li>
						<a href="javascript:;" data-val="blue" title="蓝色">蓝色</a>
					</li>
					<li>
						<a href="javascript:;" data-val="green" title="绿色">绿色</a>
					</li>
					<li>
						<a href="javascript:;" data-val="red" title="红色">红色</a>
					</li>
					<li>
						<a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
					</li>
					<li>
						<a href="javascript:;" data-val="orange" title="绿色">橙色</a>
					</li>
				</ul>
			</li>
		</ul>
		<a href="javascript:;" class="Hui-nav-toggle Hui-iconfont"
			aria-hidden="false">&#xe667;</a>
		</header>
		<aside class="Hui-aside">
		<input runat="server" id="divScrollValue" type="hidden" value="" />
		<div class="menu_dropdown bk_2">
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe67f;</i> 基础参数
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=1"
								data-title="一级代理领取价格">一级代理领取价格</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=2"
								data-title="二维码销售价格">二维码销售价格</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=3"
								data-title="会员预约价格">会员预约价格</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=4"
								data-title="置顶价格">置顶价格</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=5"
								data-title="轮播图价格">轮播图价格</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=6"
								data-title="会员绑定赠送分钟数">会员绑定赠送分钟数</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=7"
								data-title="会员续费赠送分钟数">会员续费赠送分钟数</a>
							<a
								_href="${pageContext.request.contextPath}/admin_jccs.do?p=jccs&type=8"
								data-title="免费电话充值单价设置">免费电话充值单价设置</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 管理员管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_admin.do?p=adminlisting"
								data-title="管理员列表">管理员列表</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_admin.do?p=addadminlisting"
								data-title="新增管理员">新增管理员</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 保险管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin/baoxian/addBaoxianGongshi.jsp"
								data-title="新增保险公司">新增保险公司</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_baoxian.do?p=getAllBaoxianGongshi"
								data-title="保险公司管理">保险公司管理</a>
						</li>
						
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_baoxian.do?p=fenyeBaodan&status=0"
								data-title="未报价管理">未报价管理</a>
						</li>
						
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_baoxian.do?p=fenyeBaodan&status=1"
								data-title="已报价管理">已报价管理</a>
						</li>
						
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_baoxian.do?p=fenyeBaodan&status=2"
								data-title="已支付管理">已支付管理</a>
								
							<a
								_href="${pageContext.request.contextPath}/admin_baoxian.do?p=fenyeBaodan&status=3"
								data-title="已支付管理">交易完成</a>
						</li>
						
						
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 代理管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_daili.do?p=dalilisting"
								data-title="代理人列表">代理人列表</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_daili.do?p=adddaililisting"
								data-title="新增代理人">新增代理人</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 店铺管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_business.do?p=storessj"
								data-title="店铺列表">店铺列表</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 二维码管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=kaika"
								data-title="开卡">开卡</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=createqrcodeimage"
								data-title="生成二维码">生成二维码</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=downloadqrcodeimage"
								data-title="下载二维码">下载二维码</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=dailitakeqrcode"
								data-title="代理领卡">代理领卡</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=noactivated"
								data-title="未激活二维码">未激活二维码</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=activated"
								data-title="已激活二维码">已激活二维码</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_erweima.do?p=outofdate"
								data-title="过期二维码">过期二维码</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-product">
				<dt>
					<i class="Hui-iconfont">&#xe62d;</i> 歌曲管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>

				<dd>
					<ul>
					
						<li>
							<a

								_href="${pageContext.request.contextPath }/admin/back_music/back_add_denji.jsp"
								data-title="新增等级管理" href="javascript:void(0">新增等级管理</a>
							

						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath }/musicBack.do?p=showDenji"
								data-title="歌曲等级管理" href="javascript:void(0)">歌曲等级管理</a>
						</li>
						<li>
							<a
								_href="${pageContext.request.contextPath }/musicBack.do?p=addMusicView"
								data-title="" href="javascript:void(0)">新增歌曲</a>
						</li>
						
						
						<li>
							<a
								_href="${pageContext.request.contextPath }/musicBack.do?p=search"
								data-title="歌曲管理" href="javascript:void(0)">歌曲管理</a>
						</li>
						
						<li>
							   <a
								_href="${pageContext.request.contextPath}/lunboimg_music.do?p=goAdd"
								data-title="新增轮播图">新增轮播图</a>
							</li>
						
						<li>
						    <a
								_href="${pageContext.request.contextPath}/lunboimg_music.do?p=lunboimglisting"
								data-title="轮播图列表">轮播图列表</a>
					    </li>			
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-product">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 商城管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/shangjiagoods.do?p=sjgoodslinting"
								data-title="已上架商品" href="javascript:void(0)">已上架商品</a>
							<a
								_href="${pageContext.request.contextPath}/xiajiagoods.do?p=xjgoodslisting"
								data-title="已下架商品" href="javascript:void(0)">已下架商品</a>
								<a
								_href="${pageContext.request.contextPath}/allgoods.do?p=sjgoodslinting"
								data-title="所有商品" href="javascript:void(0)">所有商品</a>
							<a
								_href="${pageContext.request.contextPath}/shangjiagoods.do?p=addgoodsview"
								data-title="新增商品" href="javascript:void(0)">新增商品</a>
							
							<a
								_href="${pageContext.request.contextPath}/lunboimg.do?p=lunboimglisting"
								data-title="轮播图列表">轮播图列表</a>
							<a
								_href="${pageContext.request.contextPath}/lunboimg.do?p=goAdd"
								data-title="新增轮播图">新增轮播图</a>
								
							<a
								_href="${pageContext.request.contextPath}/goodsorder.do?p=orderslisting&status=10"
								data-title="所有订单">所有订单</a>
							<a
								_href="${pageContext.request.contextPath}/goodsorder.do?p=orderslisting&status=0"
								data-title="未付款订单" href="javascript:void(0)">未付款订单</a>
							<a
								_href="${pageContext.request.contextPath}/goodsorder.do?p=orderslisting&status=1"
								data-title="待发货订单" href="javascript:void(0)">待发货订单</a>
							<a
								_href="${pageContext.request.contextPath}/goodsorder.do?p=orderslisting&status=2"
								data-title="已发货订单" href="javascript:void(0)">已发货订单</a>
						    
						    <a
								_href="${pageContext.request.contextPath}/admin_corp.do?p=corplisting"
								data-title="配送公司">配送公司</a>
								
							<a _href="${pageContext.request.contextPath}/admin/addCorp.jsp"
								data-title="新增配送公司">新增配送公司</a>
							
							<a
								_href="${pageContext.request.contextPath}/admin/messagesdelete.jsp"
								data-title="删除回复消息">删除回复消息</a>
							<a  _href="${pageContext.request.contextPath}/admin/messagesxtdelete.jsp" data-title="删除系统消息">删除系统消息</a>
							<a
								_href="${pageContext.request.contextPath}/uamessages.do?p=messageslisting"
								data-title="回复消息">回复消息</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe63a;</i> 财务管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
								<a
								_href="${pageContext.request.contextPath}/admin_moneytongji.do?p=tongji"
								data-title="财务统计">财务统计</a>
							
						</li>
						<li>
								<a
								_href="${pageContext.request.contextPath}/admin_money.do?p=duizhang&status=1"
								data-title="对账">对账</a>
							
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe63a;</i> 服务管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
								<a
								_href="${pageContext.request.contextPath}/admin_fuwutype.do?p=fuwutypelist"
								data-title="服务类型列表">服务类型列表</a>
							
						</li>
						<li>
								<a
								_href="${pageContext.request.contextPath}/admin_fuwutype.do?p=addfuwutype"
								data-title="新增服务类型">新增服务类型</a>
							
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6a9;</i> 订单管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_order.do?p=orderslisting&status=10"
								data-title="所有订单">所有订单</a>
							<a
								_href="${pageContext.request.contextPath}/admin_order.do?p=orderslisting&status=1"
								data-title="未付款订单" href="javascript:void(0)">未付款订单</a>
							<a
								_href="${pageContext.request.contextPath}/admin_order.do?p=orderslisting&status=2"
								data-title="待发货订单" href="javascript:void(0)">待发货订单</a>
							<a
								_href="${pageContext.request.contextPath}/admin_order.do?p=orderslisting&status=3"
								data-title="已发货订单" href="javascript:void(0)">已发货订单</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe669;</i> 配送管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_corp.do?p=corplisting"
								data-title="配送公司">配送公司</a>
							<a _href="${pageContext.request.contextPath}/admin/peisongaddCorp.jsp"
								data-title="新增配送公司">新增配送公司</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe71d;</i> 充值管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_chongzhirecord.do?p=chongzhilisting"
								data-title="代理充值记录">代理充值记录</a>
							<a
								_href="${pageContext.request.contextPath}/admin_chongzhirecord.do?p=czfaultlisting"
								data-title="充值失败记录">充值失败记录</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe669;</i> 提现管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_tixian.do?p=dailitixianrequestlisting"
								data-title="自提地址">代理提现申请</a>
							
							<a
								_href="${pageContext.request.contextPath}/admin_tixian.do?p=dailitixianlisting"
								data-title="自提地址">代理提现记录</a>
							
							<a
								_href="${pageContext.request.contextPath}/admin_tixian.do?p=usertixianrequestlisting"
								data-title="自提地址">会员提现申请</a>
								
							<a
								_href="${pageContext.request.contextPath}/admin_tixian.do?p=usertixianlisting"
								data-title="自提地址">会员提现记录</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe71f;</i> 支付管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a _href="${pageContext.request.contextPath}/weixinpaycs.do?p=weixinpaycs" data-title="微信参数">微信参数</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe634;</i> 预约管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_yuyue.do?p=yuyuelisting&status=1"
								data-title="预约记录">预约记录</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe669;</i> 模板消息管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_moban.do?p=xiaoxilisting&status=1"
								data-title="模板消息列表">模板消息列表</a>
							<a
								_href="${pageContext.request.contextPath}/admin/addmoban.jsp"
								data-title="新增模板消息">新增模板消息</a>
						</li>
					</ul>
				</dd>
			</dl>
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe669;</i> 短信管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
							<a
								_href="${pageContext.request.contextPath}/admin_messageCount.do?p=messageCount"
								data-title="模板消息列表">剩余短信</a>
						</li>
					</ul>
				</dd>
			</dl>
			 
			<dl id="menu-picture" style="display:none">
				<dt>
					<i class="Hui-iconfont">&#xe62f;</i> 微信活动管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
						<a _href="${pageContext.request.contextPath }/admin_WeixinNews.do?p=newsmanage" data-title="微信新闻管理" href="javascript:void(0)">微信新闻管理</a>
						</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe62f;</i> 关于我们管理
					<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li>
						<a _href="${pageContext.request.contextPath }/admin_aboutwe.do?p=change" data-title="修改关于我们" href="javascript:void(0)">修改关于我们</a>
						</li>
					</ul>
				</dd>
			</dl>
		</div>
		</aside>
		<div class="dislpayArrow">
			<a class="pngfix" href="javascript:void(0);"
				onClick="displaynavbar(this)"></a>
		</div>
		<section class="Hui-article-box">
		<div id="Hui-tabNav" class="Hui-tabNav">
			<div class="Hui-tabNav-wp">
				<ul id="min_title_list" class="acrossTab cl">
					<li class="active">
						<span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em>
					</li>
				</ul>
			</div>
			<div class="Hui-tabNav-more btn-group">
				<a id="js-tabNav-prev" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d4;</i> </a><a
					id="js-tabNav-next" class="btn radius btn-default size-S"
					href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i> </a>
			</div>
		</div>
		<div id="iframe_box" class="Hui-article">
			<div class="show_iframe">
				<div style="display: none" class="loading"></div>
				<iframe scrolling="yes" frameborder="0"
					src="${pageContext.request.contextPath}/admin_moneytongji.do?p=tongji"></iframe>
			</div>
		</div>
		</section>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/jquery/1.9.1/jquery.min.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/lib/layer/2.1/layer.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.js">
</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath }/lib/js/H-ui.admin.js">
</script>
		<script type="text/javascript">
$(document).ready(function(){
	msg();
});
function msg()
{
	$.ajax({
		url:"${pageContext.request.contextPath}/uamessages.do?p=msgtishi",
		type:"post",
		success:function(data)
		{
			$("#msgsum").html(""+data+"");
		}
	});
}
		
		
/*用户-编辑*/
function member_edit(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*房间-查看*/
function member_show(title, url, id, w, h) {
	layer_show(title, url, w, h);
}
/*资讯-添加*/
function article_add(title, url) {
	var index = layer.open( {
		type : 2,
		title : title,
		content : url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title, url) {
	var index = layer.open( {
		type : 2,
		title : title,
		content : url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title, url) {
	var index = layer.open( {
		type : 2,
		title : title,
		content : url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title, url, w, h) {
	layer_full(title, url, w, h);
}

function member_add(title, url, w, h) {
	layer_show(title, url, w, h);
}
</script>
		<script type="text/javascript">
function showMessage(a) {
	var _href = $(a).attr('_href');
	var topWindow = $(window.parent.document);
	var iframe_box = $(window.parent.document.getElementById("iframe_box"))
			.find("iframe");
	iframe_box.attr("src", _href);
}
</script>
	</body>
</html>
