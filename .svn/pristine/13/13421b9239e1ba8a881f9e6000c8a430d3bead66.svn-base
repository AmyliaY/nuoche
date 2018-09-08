<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
	</head>
	
	<style>
		#noTongzhi{
			text-align: center;
			margin-top: 150px;
			display: none;
		}
	</style>

	<body>
		
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<!--数据列表-->
				<ul id="tongzhi" class="mui-table-view mui-table-view-chevron">
				</ul>
			</div>
			
			<div id="noTongzhi">
				<img width="200px" height="200px" src="${pageContext.request.contextPath}/weixin/images/fenxiao_none.png" />
				<p  style="font-size: 30px; ">暂无通知</p>
			</div>
			
		</div>
		
		
		<script src="${pageContext.request.contextPath}/weixin/js/jquery-1.9.0.min.js"></script>
		<script type="text/javascript">
			mui.init({
				 pullRefresh : {
				    container:'#pullrefresh',//待刷新区域标识，querySelector能定位的css选择器均可，比如：id、.class等
				    up : {
				      contentrefresh : "正在加载...",//可选，正在加载状态时，上拉加载控件上显示的标题内容
				      contentnomore:'没有更多数据了',//可选，请求完毕若没有更多数据时显示的提醒内容；
				      callback :pullupRefresh //必选，刷新函数，根据具体业务来编写，比如通过ajax从服务器获取新数据；
				    }
				  }
			});
			var page=1;
			//onload从服务器获取列表数据；
			//mui.plusReady(function(){
				//判断轮播图片是否存在1 0
				//var sub=plus.webview.currentWebview();
				//var lunbo=sub.lunbo;
				//获取通知列表
				var fragment2=document.createDocumentFragment();
				mui.get("${pageContext.request.contextPath}/" + "appTongzhi.do?p=getAllTongzhi&page=1",function(data){
					var js = eval("( " + data + ")");
					if(js.length!=0){
						for(var i=0;i<js.length;i++){
							var li=document.createElement("li");
							li.className="mui-table-view-cell mui-media";
							li.id=js[i].tzid;
							var a=document.createElement("a");
							var img=document.createElement("img");
							img.className="mui-pull-left tongzhiimg";
							//图片自定义大小
							img.style.height="60px";
							img.style.width="80px";
							img.style.marginRight="10px";
							img.src="${pageContext.request.contextPath}/"+js[i].tzimages;
							var div=document.createElement("div");
							div.className="mui-media-body";
							var title=document.createElement("span");
							title.innerHTML=js[i].tztitle
							var p=document.createElement("p");
							p.className="mui-ellipsis";
							p.innerHTML=js[i].tzdetail;
							var time=document.createElement("p");
							time.innerHTML=js[i].tztime;
							time.className="time";
	
							li.appendChild(a);
							a.appendChild(img);
							a.appendChild(div);
							div.appendChild(title);
							div.appendChild(p);
							div.appendChild(time);
							
							fragment2.appendChild(li);
						}
						$("#tongzhi").append(fragment2);
					}else if(lunbo==0 && js.length==0){
						document.getElementById("noTongzhi").style.display="block";
					}
				});
			//});	
			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
					page+=1;
					var table = document.body.querySelector('.mui-table-view');
				mui.get("${pageContext.request.contextPath}/" + "appTongzhi.do?p=getAllTongzhi&page="+page,function(data){
					var js = eval("( " + data + ")");
					//如果没有数据就返回
					if(js.length==0){
						page-=1;
						mui('#pullrefresh').pullRefresh().endPullupToRefresh((true));
						return;
					}
					for(var i=0;i<js.length;i++){
						var li=document.createElement("li");
						li.className="mui-table-view-cell mui-media";
						li.id=js[i].tzid;
						var a=document.createElement("a");
						var img=document.createElement("img");
						img.className="mui-pull-left tongzhiimg";
						//图片自定义大小
						img.style.height="60px";
						img.style.width="80px";
						img.style.marginRight="10px";
						img.src="${pageContext.request.contextPath}/"+js[i].tzimages;
						var div=document.createElement("div");
						div.className="mui-media-body";
						var title=document.createElement("span");
						title.innerHTML=js[i].tztitle
						var p=document.createElement("p");
						p.className="mui-ellipsis";
						p.innerHTML=js[i].tzdetail;
						var time=document.createElement("p");
						time.innerHTML=js[i].tztime;
						time.className="time";

						li.appendChild(a);
						a.appendChild(img);
						a.appendChild(div);
						div.appendChild(title);
						div.appendChild(p);
						div.appendChild(time);
						
						table.appendChild(li);
					}
					if(js.length<8){
						mui('#pullrefresh').pullRefresh().endPullupToRefresh((true));
						return;
					}
					mui('#pullrefresh').pullRefresh().endPullupToRefresh((false));
					})
			}
			
			
			/*
			 通过mui.preload()方法预加载，可立即返回对应webview的引用，但一次仅能预加载一个页面；
			 若需加载多个webview，则需多次调用mui.preload()方法；
			 * */
			mui.preload({
			    url:"tongzhi-details.jsp",
			    id:"tongzhi-details.html"//默认使用当前页面的url作为id
			});

			var detailPage = null;
			mui('.mui-content').on('tap', 'li', function(e){
				var id = this.getAttribute('id');
				  //获得详情页面
				/* if(!detailPage){
				    //detailPage = plus.webview.getWebviewById('tongzhi-details.html');
				  }
				  //触发详情页面的事件
				  mui.fire(detailPage,'tongzhiId',{
				    id:id
				  });*/
				//打开详情页面          
				
				window.top.location="${pageContext.request.contextPath}/weixin/center/tongzhi-details.jsp?tzid="+id;
				  /*mui.openWindow({
				  	url:'tongzhi-details.html',
				    id:'tongzhi-details.html',
				    show: {
							 autoShow:true
						},
					extras:{
						tzid:id
					}
				  });*/
			});
		</script>
	</body>

</html>