<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>物流</title>
		<script src="../js/mui.min.js"></script>
		<link href="../css/mui.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../collection/collection.css">
		<title></title>
		<style>
			.collection_detail {
				border: none;
			}
			
			.Courier {
				height: 60px;
			}
			
			.in-avatar img {
				float: left;
				width: 45px;
				height: 45px;
				margin-left: 5%;
				margin-top: 2%;
				border-radius: 50%;
				border: 1px solid whitesmoke;
			}
			
			.texta {
				float: left;
				width: 100px;
				height: 40px;
				margin-left: 2%;
				margin-top: 2%;
			}
			
			ul li {
				list-style: none;
			}
			
			.track-rcol {
				font-size: 15px;
				width: 100%;
				border: 1px solid #eee;
			}
			
			.track-list {
				margin: 10px;
				padding-left: 5px;
				position: relative;
			}
			
			.track-list li {
				position: relative;
				padding: 35px 0 0 25px;
				line-height: 25px;
			    color: #999;
				border-left: 1px solid #d9d9d9;
			}
			
			.track-list li.first {
				color: red;
				padding-top: 0;
				border-left-color: #fff;
			}
			
			.track-list li .node-icon {
				position: absolute;
				left: -6px;
				top: 50%;
				width: 11px;
				height: 11px;
				background: url(../img/order-icons.png) -21px -72px no-repeat;
			}
			
			.track-list li.first .node-icon {
				background-position: 0 -72px;
			}
			
			.track-list li .time {
				margin-right: 20px;
				position: relative;
				top: 4px;
				display: inline-block;
				vertical-align: middle;
			}
			
			.track-list li .txt {
				position: relative;
				top: 4px;
				display: inline-block;
				vertical-align: middle;
			}
			
			.track-list li.first .time {
				margin-right: 20px;
			}
		</style>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav" style="background-color:#FF7900;margin-top: 0px;">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">物流详情</h1>
		</header>

		<div class="mui-content">

			<ul id="OA_task_1" class="mui-table-view" style="margin-top: 15px;height: 130px;">
				<li class="mui-table-view-cell">
					<div id="url'+coll[i].coId+'" class="mui-slider-handle mui-table collection_product clickme">
						<div class="collection_detail">
							<div class="collection_detail1"><span id='ischeck' style="color:#FF4500; font-size:18px;font-family: '微软雅黑';">已签收</span></div>
							<div class="collection_detail2" style="width: 100%;margin-top: 5%;">
								<span style="color:#999999; font-size:12px"><span id='zhowen'></span>:&nbsp;<span id='orid'></span> 	</span>
							</div>
							<div class="collection_detail3" style="margin-left: 4.8%;"><span style="color:#999999; font-size:12px">官方电话:&nbsp;</span><span id='dianhua' style="color: #007AFF;">95554</span></div>
						</div>
						<div class="collection_img "><img id='img' src="" /></div>
					</div>
				</li>
			</ul>

			<div style="background: whitesmoke; padding-top:8px;padding-bottom: 2px;">

			</div>

			<div class="track-rcol" >
				<div class="track-list">
					<ul id="data" style="margin-left: -9%;">

					</ul>
				</div>
			</div>

		</div>
	</body>

	<script src="../js/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/mui.js" type="text/javascript" charset="utf-8"></script>
	<script>
		mui.init();
		var orid;
		mui.plusReady(function() {
			var myself = plus.webview.currentWebview();
			orid = myself.orid;
			
			mui.ajax(SERVER_URL + "apporder.do?p=queryWuli", {
				data: {
					orid: orid,
				},
				async: true,
				type: "post",
				timeout: 30000,
				success: function(data) {
					var json = eval('(' + data + ')'); //物流公司详情
					if(json.ischeck == 1) {
						$("#ischeck").html("已签收");
					} else {
						$("#ischeck").html("未签收");
					}
					$("#orid").html(json.nu);
					mui.ajax(SERVER_URL + "apporder.do?p=queryKuaidi",{
						data:{
							orid:orid
						},
						async: true,
						type: "post",
						timeout: 30000,
						success:function (data ){
							var json = eval('(' + data + ')');
							$("#zhowen").html(json.zhowen);
							$("#dianhua").html(json.kefu.trim());
							document.getElementById("img").src =SERVER_URL+ json.img;
						}
					});
					//物流信息
					var wuli = json.data;
					if(wuli.length == 0) {
						mui.toast("此订单有误!请尽快联系客服人员");
						return;
					}
					var table = $("#data");
					//遍历物流信息
					for(var i = 0; i < wuli.length; i++) {
						var li = document.createElement("li");
						if(i == 0) {
							li.className = "first";
						}
						var str = '<i class="node-icon"></i>' +
							'<span class="time">' + wuli[i].time + '</span>' +
							'<span class="txt">' + wuli[i].context + '</span>';
						li.innerHTML = str;
						table.append(li);
					}

				}

			});

		});
	</script>

</html>