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
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
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
<link href="${pageContext.request.contextPath }/lib/css/H-ui.admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/lib/Hui-iconfont/1.0.7/iconfont.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/lib/skin/default/skin.css"
	rel="stylesheet" type="text/css" id="skin" />
<link href="${pageContext.request.contextPath }/lib/css/style.css"
	rel="stylesheet" type="text/css" />

<title>卡卡挪车-代理管理员后台</title>
<meta name="keywords"
	content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description"
	content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body onload="yincang()">
	<c:if test="${empty proxy}">
		<c:redirect url="/daili/login.jsp"></c:redirect>
	</c:if>
	<header class="Hui-header cl">
		<a class="Hui-logo l" title="代理管理员后台" href="/">代理管理员后台</a> <a
			class="Hui-logo-m l" href="/" title="H-ui.admin">H-uihit</a> <span
			class="Hui-subtitle l">V1.0</span>
		<nav class="mainnav cl" id="Hui-nav"></nav>
		<ul class="Hui-userbar">
			<li>欢迎:</li>
			<li class="dropDown dropDown_hover"><a href="#"
				class="dropDown_A">${proxy.realname} <i class="Hui-iconfont">&#xe6d5;</i>
				
			</a>
				<ul class="dropDown-menu radius box-shadow">
					<li><a onclick="showMessage(this)" target="iframe_box"
						_href="${pageContext.request.contextPath }/daili_updatepsw.do?p=updatepsd"
						title="修改密码">修改密码 </a></li>
					<li><a
						href="${pageContext.request.contextPath}/daili/login.jsp">切换账户</a>
					</li>
					<li><a
						href="${pageContext.request.contextPath}/daili/login.jsp">退出</a></li>
				</ul></li>
			<li id="Hui-msg"><a onclick="showMessage(this)"
				target="iframe_box"
				_href="${pageContext.request.contextPath }/uamessages.do?p=messageslisting"
				title="消息"><span id="msgsum" class="badge badge-danger"></span><i
					class="Hui-iconfont" style="font-size: 18px">&#xe68a;</i> </a></li>
			<li id="Hui-skin" class="dropDown right dropDown_hover"><a
				href="javascript:;" title="换肤"><i class="Hui-iconfont"
					style="font-size: 18px">&#xe62a;</i> </a>
				<ul class="dropDown-menu radius box-shadow">
					<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a>
					</li>
					<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
					<li><a href="javascript:;" data-val="green" title="绿色">绿色</a>
					</li>
					<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
					<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a>
					</li>
					<li><a href="javascript:;" data-val="orange" title="橙色">橙色</a>
					</li>
				</ul></li>
		</ul>
		<a href="javascript:;" class="Hui-nav-toggle Hui-iconfont"
			aria-hidden="false">&#xe667;</a>
	</header>
	<aside class="Hui-aside">
		<input runat="server" id="divScrollValue" type="hidden" value="" />
		<div class="menu_dropdown bk_2">
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe67f;</i> 基础参数 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_jccs.do?p=jccs&type=1"
							data-title="会员二维码价格">会员二维码价格</a> <a
							_href="${pageContext.request.contextPath}/daili_jccs.do?p=jccs&type=2"
							data-title="子代理二维码价格">子代理二维码价格</a> 
							</li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6cc;</i>子代理管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/dailimanage.do?p=listzidaili"
							data-title="子代理列表">子代理列表</a> <a
							_href="${pageContext.request.contextPath}/dailimanage.do?p=addzidaili"
							data-title="新增子代理">新增子代理</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6cc;</i> 会员管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=1"
							data-title="会员列表">会员列表</a> <a
							_href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=2"
							data-title="已到期">已到期</a> <a
							_href="${pageContext.request.contextPath}/daili_users.do?p=userlisting&type=3"
							data-title="即将到期">即将到期</a> <!--   <a_href="${pageContext.request.contextPath}/daili_users.do?p=usersyuyuelisting&status=1"
							data-title="会员预约记录">会员预约记录</a>   --></li>
					</ul>
				</dd>
			</dl>
			
			
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6cc;</i> 加油站管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili/jiayouzhang/add_jiayouzhan.jsp"
							data-title="新增加油站">新增加油站</a>
							
							 <a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getStationByProxy&type=1"
							data-title="加油站列表">加油站列表</a> 
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getStationByProxy&type=2"
							data-title="员工管理">员工管理</a> 
							
							<a
							_href="${pageContext.request.contextPath}/printercfgback.do?method=getAllPrinter"
							data-title="打印机管理">打印机管理</a> 
							
							
							
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getStationByProxy&type=4"
							data-title="油价管理">油价管理</a> 
							
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getStationByProxy&type=5"
							data-title="一键召回管理">加油返余额</a> 
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getUser"
							data-title="一键召回管理">一键召回管理</a> 
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=getStationByProxy&type=7"
							data-title="老带新管理">老带新管理</a> 
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=order"
							data-title="加油记录">加油记录</a> 
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?p=vipSetting"
							data-title="VIP用户设置">VIP用户设置</a> 
							
							
							<a
							_href="${pageContext.request.contextPath}/daili_jiayouzhang.do?method=getviplist"
							data-title="列表 ">VIP列表</a> 
							
						</li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 服务管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_service.do?p=servicelisting"
							data-title="服务列表" href="javascript:void(0)">服务列表</a> <a
							_href="${pageContext.request.contextPath}/daili_service.do?p=goAdd"
							data-title="新增服务" href="javascript:void(0)">新增服务</a></li>
					</ul>
				</dd>
			</dl>



			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe620;</i> 店铺管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_business.do?p=storessj"
							data-title="店铺列表" href="javascript:void(0)">店铺列表</a> <a
							_href="${pageContext.request.contextPath}/daili_business.do?p=storesxj"
							data-title="下架店铺" href="javascript:void(0)">下架店铺</a> <a
							_href="${pageContext.request.contextPath}/daili_business.do?p=storesxz"
							data-title="新增店铺" href="javascript:void(0)">新增店铺</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6be;</i> 置顶管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/dailiTop.do?p=zhidinglisting"
							data-title="置顶列表">置顶列表</a> <a
							_href="${pageContext.request.contextPath}/dailiTop.do?p=addZhidingView"
							data-title="新增置顶">新增置顶</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture33">
				<dt>
					<i class="Hui-iconfont">&#xe6be;</i> 轮播图管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_lunboimg.do?p=lunboimglisting"
							data-title="轮播列表">轮播列表</a> <a
							_href="${pageContext.request.contextPath}/daili_lunboimg.do?p=goAdd"
							data-title="新增轮播">新增轮播</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture" style="display: none;">
				<dt>
					<i class="Hui-iconfont">&#xe6be;</i> 二维码管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/lunboimg.do?p=lunboimglisting"
							data-title="二维码收售记录">二维码收售记录</a></li>
					</ul>
				</dd>
			</dl>

			<dl id="menu-picture">
				<dt>
					<!-- 唐仁鑫   -->
					<i class="Hui-iconfont">&#xe6be;</i> 个人信息管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/dailiinfo.do?p=findUserInfoByid&update=0&id=${proxy.id}"
							data-title="查看个人信息">查看个人信息</a> <!-- 要修改也要先查询  设置update=1 判定符  使action返回修改页面 -->
							<a
							_href="${pageContext.request.contextPath}/dailiinfo.do?p=findUserInfoByid&update=1&id=${proxy.id}"
							data-title="修改个人信息">修改个人信息</a></li>
					</ul>
				</dd>
			</dl>
			<dl id="menu-picture">
				<dt>
					<i class="Hui-iconfont">&#xe6be;</i> 财务管理 <i
						class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
				</dt>
				<dd>
					<ul>
						<li><a
							_href="${pageContext.request.contextPath}/daili_chongzhi.do?p=chongzhilisting"
							data-title="充值记录">充值记录</a> <a
							_href="${pageContext.request.contextPath}/daili_tixian.do?p=tixianlisting&proxyid=${proxy.id }"
							data-title="提现申请">提现申请</a></li>
						<li><a
							_href="${pageContext.request.contextPath}/daili_zhidingjilu.do?p=zhidinglisting"
							data-title="置顶记录">置顶记录</a> <a
							_href="${pageContext.request.contextPath}/daili_lunbojilu.do?p=lunbolisting"
							data-title="轮播图记录">轮播图记录</a></li>
						<li><a
							_href="${pageContext.request.contextPath}/daili_yuyue.do?p=yuyuelisting"
							data-title="预约记录">预约记录</a><a
							_href="${pageContext.request.contextPath}/daili_huiyuanxufei.do?p=xufeilisting"
							data-title="会员续费记录">会员续费记录</a></li>
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
					<li class="active"><span title="我的桌面" data-href="welcome.html">我的桌面</span><em></em>
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
					src="${pageContext.request.contextPath}/dailiinfo.do?p=findUserInfoByid&update=2&id=${proxy.id}"></iframe>
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
		$(document).ready(function() {
			msg();
		});
		function msg() {
			$.ajax({
				url : "${pageContext.request.contextPath}/uamessages.do?p=msgtishi",
				type : "post",
				success : function(data) {
					$("#msgsum").html("" + data + "");
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
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*图片-添加*/
		function picture_add(title, url) {
			var index = layer.open({
				type : 2,
				title : title,
				content : url
			});
			layer.full(index);
		}
		/*产品-添加*/
		function product_add(title, url) {
			var index = layer.open({
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

	<script type="text/javascript">
		function yincang()
		{
			if(${proxy.level}!=1)
			{
				document.getElementById("menu-picture33").style.display='none';
			}
		}
		/*用window.onload调用myfun()*/
		window.onload=yincang;//不要括号
</script>
</body>
</html>
