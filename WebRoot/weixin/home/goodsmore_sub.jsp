<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.getSession().setAttribute("page", 0);

String gtname = request.getParameter("gtname");
if (gtname!=null)
{
  gtname = new String(gtname.getBytes("iso8859-1"),"utf-8");
  pageContext.setAttribute("gtname",gtname);
}
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>分类</title>
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<link href="${pageContext.request.contextPath}/weixin/css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/collection/collection.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/gg.css">

	</head>
	<style>
		.gli: {
			border: 1px solid red;
		}
		.hr{
			height: 5px;
			background-color: #cccccc;
			border: none;
		}
		
	</style>

	<body>
		<header class="mui-bar mui-bar-nav" style="background: #FF7900;">
			<span class="mui-icon mui-icon-arrowleft mui-action-back" style="color: white;"></span>
			<span  class="mui-btn-link" style="color: white;">米禾分类</span>
		</header>
		
			
		<div class="mui-content mui-scroll-wrapper" style="margin-top: -15px;" >
			
			<div class="mui-content"  >
			<div class="mui-card-link" >
				<ul class="mui-table-view" >
					<li class="mui-table-view-cell mui-collapse" id="yijili" ><a class="mui-navigate-right" style="font-size: 1.1em;margin-right: -5px;" id="gtname"></a>
						
						<ul class="mui-table-view mui-table-view-chevron" id="yijilist">
						
						</ul>
						
					</li>
					
				</ul>
			</div>
		</div>
		<hr class="hr"/>
			
			<div class="mui-content mui-scroll" id="pullrefresh">	
				<ul id="goodsmorelist" class="mui-table-view" >
					<!--<li>
					<div class="mui-slider-hgoodsmorelistandle collection_product">
						<a href="javascript:void(0)">
							<div class="collection_detail ">
								<span id="gname" class="collection_gname ">twoList[i].gname</span>
								<span class="collection_gprice ">￥twoList[i].gprice</span>
								<span class="collection_name ">twoList[i].gdetail</span>
						</div	>
							<div class="collection_img ">
								<img src="'+"${pageContext.request.contextPath}/"+twoList[i].gimages+'" />
							</div>
						</a>
					</div>
				</li>-->

				</ul>
			</div>
		</div>
		

		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
		
		<!--  
		<script src="${pageContext.request.contextPath}/weixin/js/layzr.min.js" type="text/javascript" charset="utf-8"></script>
		-->
		
		<script type="text/javascript">
		    
			mui.init({
				pullRefresh: {
					container: '#pullrefresh',
					up: {
						contentrefresh: "正在加载·····",
						auto: true,
						callback: pullupRefresh
					}
				}
			});
			
			
			
			
			
			
			
			
			
			var page = 1;
			var size = 10;
			   	//详情页面
			  	
			
			   	
			   	
			//上拉加载
			function pullupRefresh() {
			    setTimeout(function() {
				document.getElementById("yijilist").innerHTML="";
				//document.getElementById("goodsmorelist").innerHTML="";
				var twoList = null;
				var count = null;
				var url = null;
				//mui.plusReady(function() {
					//var goodsmore = plus.webview.currentWebview();
					var gtname = document.getElementById("gtname");

					gtid = '${param.gtid}';
								
					gtname.innerHTML = '&nbsp;'+'&nbsp;'+'${gtname}';
					url = "${pageContext.request.contextPath}/goodstype.do?p=findByOneTypeToTwoType&gtid=" + gtid;
				
					
						mui.post(url, {
								"page": page,
								"size": size
							},
							function(data) {
								
								var map = eval("(" + data + ")");
								for(var key in map) {
									if(key == "goodsmorelist") {
										twoList = map[key];
									}
									if(key == "count") {
										count = map[key];

									}
								}
								page = page * 1 + 1;
                                mui("#pullrefresh").pullRefresh().endPullupToRefresh(page > count);
								var goodsmorefragment = document.createDocumentFragment();
							
								var yijiul = document.getElementById("yijilist")
								
								for(var j = 0; j < map.one.length; j++) {
								var oneli = document.createElement("li");
								oneli.id = map.one[j][0];
								oneli.className = "mui-table-view-cell gli";
								oneli.style.padding = '8px';
								oneli.style.fontSize = '16px';
								oneli.innerHTML = ' <li class="mui-table-view-cell" onclick="goodslei(\''+map.one[j][0]+'\',\''+map.one[j][1]+'\')"> '+map.one[j][1]+ '<a class="mui-navigate-right" style="right:17%;"></a></li>';
								yijiul.appendChild(oneli);
								}
								
								var list = document.getElementById("goodsmorelist");
								for(var i = 0; i < map.twoList.length; i++) {
									
									//-------------------------------------------------------
									var goodsli = document.createElement("li");
									//goodsli.id = map.twoList[i].goodsonetype.gtId;
									goodsli.className = "mui-table-view-cell mui-media";
									if (i==0)
									  goodsli.style.borderTop = "1px solid #c1c1c1";
									goodsli.style.borderBottom="1px solid #c1c1c1";
									
									
									//goodsli.style.padding = '8px';
									//sgoodsli.style.fontSize = '16px';
									
									var a = document.createElement("a");
									a.className="mui-navigate-right";
									a.href="javascript:;";
									
									//$(goodsli).click(function(){alert(1);});
									
									goodsli.appendChild(a);
									
									var img = document.createElement("img");
									img.className="mui-media-object mui-pull-left";
									img.src=map.twoList[i].gttLogo;
									a.appendChild(img);
									
									var div = document.createElement("div");
									div.className="mui-media-body";
									div.innerHTML = map.twoList[i].gttName+"<p class='mui-ellipsis'>${gtname}</p>";
									a.appendChild(div);
								
									
									
									goodsli.onclick = function(){
									  alert(1);
									}
									
									
								
									
									
									//goodsli.innerHTML = '<div onclick="goods(\''+map.twoList[i].gttId+'\',\''+map.twoList[i].gttName+'\')">'+
									//'<li class="mui-table-view-cell li" gttId ="'+map.twoList[i].gttId+'" gttName="'+map.twoList[i].gttName+'"   ><a href="javascript:void(0)"  onclick="goods(\''+map.twoList[i].gttId+'\',\''+map.twoList[i].gttName+'\')" class="">' + map.twoList[i].gttName + '</a></li>'+
									//	   '</div>';
										   
									 list.appendChild(goodsli);
									//goodsmorefragment.appendChild(twodiv);
								}
							//}
							   
							   
								
								//list.appendChild(goodsmorefragment);

								

						        
							}

						);
					}, 3000);
				//});

			}
			/*if(mui.os.plus) {
				mui.plusReady(function() {
					setTimeout(function() {
						mui("#pullrefresh").pullRefresh().pullupLoading();
					}, 1000)
				});
			} else {
				mui.plusReady(function() {
					mui("#pullrefresh").pullRefresh().pullupLoading();
				});
			}
			*/
			/*
			//进入详情页面
			function goodsdetail(gid,gname,gprice,gvipprice,gimages,gdetail,gdanwei)
			{
				mui.openWindow({
					url:'/goodsdetail/detail.html',
					id:'detail',
					extras:{
						gid:gid,
						gname:gname,
						gprice:gprice,
						gvipprice:gvipprice,
						gimages:gimages,
						gdetail:gdetail,
						gdanwei:gdanwei
					}
				});
			}*/

		function goodslei(gtid,gtname) {
				//mui('#pullrefresh').pullRefresh().refresh(true);
				document.getElementById("goodsmorelist").innerHTML="";
				document.getElementById("yijilist").innerHTML="";
				var yijili = document.getElementById("yijili");
				yijili.className='mui-table-view-cell mui-collapse';
				var gtnameyi = document.getElementById("gtname");
				
				var twoList = null;
				var count = null;
				var url = null;
					gtid = gtid;
					gtname1 = gtname;
					gtnameyi.innerHTML = '&nbsp;'+'&nbsp;'+gtname1;
					url = "${pageContext.request.contextPath}/goodstype.do?p=findByOneTypeToTwoType&gtid=" + gtid;			
						mui.post(url, {
								"page": page,
								"size": size
							},
							function(data) {
								var map = eval("(" + data + ")");
								for(var key in map) {
									if(key == "goodsmorelist") {
										twoList = map[key];
									}
									if(key == "count") {
										count = map[key];

									}
								}
								page = page * 1 + 1;
								var goodsmorefragment = document.createDocumentFragment();
								
								var yijiul = document.getElementById("yijilist")
								for(var j = 0; j < map.one.length; j++) {
								var oneli = document.createElement("li");
								oneli.id = map.one[j][0];
								oneli.className = "onejidetail";
								oneli.style.padding = '8px';
								oneli.style.fontSize = '16px';
								oneli.innerHTML = ' <li class="mui-table-view-cell gli" onclick="goodslei(\''+map.one[j][0]+'\',\''+map.one[j][1]+'\')"> '+ map.one[j][1]+ '<a class="mui-navigate-right" style="right:17%;"></a></li>';
								yijiul.appendChild(oneli);
								}
								
								for(var i = 0; i < map.twoList.length; i++) {
									var twodiv = document.createElement("div");		//创建标签名为 div 的节点
									twodiv.className = "twojidetail";		//设置class
									twodiv.innerHTML ='<div style="height: 10px; background-color: gainsboro"></div>'+
									'<div class="twoji"' + map.twoList[i].gttName + ''+
									'</div>'+
									'<div style="height: 10px; background-color: gainsboro"></div>';
									var goodsli = document.createElement("li");
									goodsli.id = map.twoList[i].goodsonetype.gtId;
									goodsli.className = "mui-table-view-cell gli";
									goodsli.style.padding = '8px';
									goodsli.style.fontSize = '16px';
									goodsli.innerHTML = '<div onclick="goods(\''+map.twoList[i].gttId+'\',\''+map.twoList[i].gttName+'\')">'+
									'<li  gttId ="'+map.twoList[i].gttId+'" gttName="'+map.twoList[i].gttName+'"  class="mui-table-view-cell"><a href="javascript:void(0)">' + map.twoList[i].gttName + '</a></li>'+
										   '</div>';
									goodsmorefragment.appendChild(goodsli);
									twodiv.addEventListener("tap", function(e) {
										
									});
								}
							//}
								var list = document.getElementById("goodsmorelist");
								list.appendChild(goodsmorefragment);

							//	mui("#pullrefresh").goodslei().endPullupToRefresh(page > count);

								
							}

						);
			
			}
	//商品列表
//	mui('#goodsmorelist').on('tap', 'li', function(e) {
//				var id = this.getAttribute('id');
//				var gid = 1;
//				var gttname='苹果类';
//				alert(id)
//				alert(gttname)
//				
//				mui.openWindow({
//					url: 'goods.html',
//					id: 'goods',
//					extras: {
//						gttid: gid,
//						gttname:gttname
//					},
//					show:
//					{
//						autoShow:true
//					}
//				});
//			});
function goods(gttId,gttName)
{	
	//return;
	window.top.location = "${pageContext.request.contextPath}/weixin/home/goods.jsp?gttid="+gttId+"&gttname="+gttName;
	/*mui.openWindow({
		url:'goods.html',
		id:'goods',
		extras:{
			gttid:gttId,
			gttname:gttName
		},
		show:
		{
			autoShow:true
		}
	});*/
}
	
		
		</script>
	</body>

</html>