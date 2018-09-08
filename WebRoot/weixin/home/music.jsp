<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>识歌打折</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/bbalance.css" />
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css" />
	    <script src="${pageContext.request.contextPath}/lib/lib/jquery/1.9.1/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/weixin/js/mui.min.js"></script>
</head>

<body>
   <div class="quanbu">
		<header class="mui-bar mui-bar-nav" style="background: #FF7900;;height:45px;">
			<h1 class="mui-title" style="margin-top: 2px;color: white;">听歌识曲</h1>
		</header>
			<div class="zhong" style="margin-top: 45px;">
				<div class="tu-yue">
					 <!-- 
					<img src="${pageContext.request.contextPath}/weixin/images/music.jpg" /> 
					 -->
					 
					<!--轮播-->	
					<div id="slider" class="mui-slider" style="height:180px">
						<div class="mui-slider-group mui-slider-loop" id="lunbo">
						</div>
						<div class="mui-slider-indicator" id="lunboNum">
						</div>
					</div>
							
					<p style="color:#c1c1c1;">听歌打折-15秒内完成</p>
					<p id="msg" style="font-size: 18px;">挑战商品折扣:<span id="zhekou">9</span>折</p>
					<p style="color: green;" id="time">15秒</p>
					<div class="mui-input-row">
					    <div class="mui-content-padded">
						<input name="name" id="name" type="text" placeholder="输入歌名" style="color: #c1c1c1">
						</div>
					</div>
				</div>
				<div class="mui-table-view-cell  mui-table">
				    <div class="mui-table-cell mui-col-xs-6">
				          <div class="mui-content-padded">
					      <button type="button" id="btnStart" class="mui-btn mui-btn-primary mui-btn-block">开始挑战</button>
					      </div>
					</div>
					
					<div class="mui-table-cell mui-col-xs-6">
					       <div class="mui-content-padded">
					       <button id="btnSubmit" disabled="true" type="button" class="mui-btn mui-btn-primary  mui-btn-block mui-disabled">提交歌名</button>
				           </div>
				    </div>
				</div>
			</div>
		</div>
</body>
<audio src="" id="Jaudio" class="media-audio"  preload>
</audio>

 <script type="text/javascript">
             
            var gid = '${empty param.gid ? "1" : param.gid}';
 
            $("#btnStart").click(function(){
                 
                 $("#time").html("15秒");
                 $("#btnStart").addClass("mui-disabled");
                 $("#btnStart").attr("disabled",true);
                 $("#btnSubmit").removeClass("mui-disabled");
                 $("#btnSubmit").attr("disabled",false);
                 $("#name").val("");
                 getMusic();
                 audioAutoPlay('Jaudio');
                 var count = 15;
                 var ret = window.setInterval(function(){
                       count--;
                       $("#time").html(count+"秒");
                       if (count==0)
                       {
                           window.clearInterval(ret);
                           $("#btnStart").html("超时，再次挑战");
                           $("#btnSubmit").addClass("mui-disabled");
                           $("#btnSubmit").attr("disabled",true);
                           $("#btnStart").attr("disabled",false);
                           $("#btnStart").removeClass("mui-disabled");
                       }   
                 
                 },1000);
            });
   
            function audioAutoPlay(id){
                var audio = document.getElementById(id);
                audio.play();
                document.addEventListener("WeixinJSBridgeReady", function () {
                    audio.play();
                }, false);
                document.addEventListener('YixinJSBridgeReady', function() {
                    audio.play();
                }, false);
            }
            
            function getMusic()
            {
                 
                 $.ajaxSetup({async:false});
                
	                $.post("${pageContext.request.contextPath}/music.do?p=getNextDenji",{gid:gid},function(music){
	                     if (music=="")
	                     {
	                        mui.toast("最高等级");
	                        return false;
	                     }
	                     var json = eval("("+music+")");
	                     var zhekou = json.MLevel.zhekou*10;
	                     var mp3 = json.filename;
	                     $("#zhekou").html(zhekou.toFixed(2));
	                     document.getElementById("Jaudio").src = "${pageContext.request.contextPath}/mp3/"+mp3;
	                     
	                     
	                
	                });
                
                $.ajaxSetup({async:true});
            }
            
            
            $(function(){
                     $.post("${pageContext.request.contextPath}/music.do?p=getNextDenji",{gid:gid},function(music){
                     
                      if (music=="")
	                     {
	                       $("#msg").html("好厉害，过通关!");
	                       $("#btnStart").html("已经最高级别了");  
	                       $("#btnStart").attr("disabled",true);
	                       $("#time").hide();
	                       $("#name").hide();
	                       $("#btnSubmit").hide();
                           $("#btnStart").addClass("mui-disabled");
	                        return false;
	                     }
	                     
	                     var json = eval("("+music+")");
	                     var zhekou = json.MLevel.zhekou*10;
	                     var mp3 = json.filename;
	                     $("#zhekou").html(zhekou.toFixed(2));
	                     //document.getElementById("Jaudio").src = "${pageContext.request.contextPath}/mp3/"+mp3;
	                     
	                     
	                
	                });
            });
            
            
            $(function(){
               
               var fragment1 = document.createDocumentFragment();
			   mui.ajax("${pageContext.request.contextPath}/appLunbo.do?p=getAllLunbo_muic", {
					
					//dataType: 'json', //服务器返回json格式数据
					type: 'post', //HTTP请求类型
					timeout: 30000, //超时时间设置为10秒；	
					success: function(data) {
						//服务器返回响应，根据响应结果，分析是否登录成功；
						var js = eval("( " + data + ")");
						var div_last = document.createElement("div");
						div_last.className = "mui-slider-item";
						var a_last = document.createElement("a");

						var img_last = document.createElement("img");
						img_last.src = "${pageContext.request.contextPath}" + js[js.length - 1].cimages;
						img_last.style.height = '180px';
						div_last.appendChild(a_last);
						a_last.appendChild(img_last);
						fragment1.appendChild(div_last);
						for(var i = 0; i < js.length; i++) {
						   
							var div = document.createElement("div");
							div.className = "mui-slider-item";
							var a = document.createElement("a");
							$(a).attr("onclick", "lb(\'" + js[i].cimgType + '\',\'' + js[i].cimgUrl + '\',\'' + js[i].cimgDescribe.trim() + '\',\'' + js[i].cimgTitle + '\',\'' + js[i].cimages + "\')");
							var img = document.createElement("img");
							img.src = "${pageContext.request.contextPath}" + js[i].cimages;
							img.style.height = "180px";
							div.appendChild(a);
							a.appendChild(img);

							fragment1.appendChild(div);
							var div2 = document.createElement("div");
							if(js.length >= 2) {
								if(i == 0) {
									div2.className = "mui-indicator mui-active";
								} else {
									div2.className = "mui-indicator";
								}

							}
							document.getElementById("lunboNum").appendChild(div2);

						}
						var div_first = document.createElement("div");
						div_first.className = "mui-slider-item mui-slider-item-duplicate";
						var a_first = document.createElement("a");

						var img_first = document.createElement("img");
						img_first.src = "${pageContext.request.contextPath}" + js[0].cimages;
						img_first.style.height = "180px"; 
						div_first.appendChild(a_first);
						a_first.appendChild(img_first);
						fragment1.appendChild(div_first);

						$("#lunbo").append(fragment1);

						//图片轮播
						var slider = mui("#slider");

						if(js.length == 1) {
							slider.slider({
								interval: 0
							});
						} else {
							slider.slider({
								interval: 3000
							});
						}
						/*if(js.length > 0) {
							var lunboNum = document.getElementById("lunboNum");
							var html =
								'<div class="mui-slider-item mui-slider-item-duplicate">' +
								'<a onclick="lb(1)" href="javascript:void(0)">' +
								'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[0].cimages + '">' +
								'</a>' +
								'</div>';
							var htmlLunboNum = "";
							for(var i = 0; i < js.length; i++) {
								html = html +
									'<div class="mui-slider-item">' +
									'<a onclick="lb(\''+js[i].cimgType+'\',\''+js[i].cimgUrl+'\',\''+js[i].cimgDescribe+'\',\''+js[i].cimgTitle+'\')" href="javascript:void(0)">' +
									'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[i].cimages + '">' +
									'</a>' +
									'</div>';
									
								if(i == 0)
									htmlLunboNum = htmlLunboNum + '<div class="mui-indicator mui-active"></div>';
								else
									htmlLunboNum = htmlLunboNum + '<div class="mui-indicator"></div>';

							}

							html = html + '<div class="mui-slider-item mui-slider-item-duplicate">' +
								'<a href="javascript:void(0)">' +
								'<img style="height:120px;" src="' + "${pageContext.request.contextPath}/" + js[js.length - 1].cimages + '">' +
								'</a>' +
								'</div>';
								
							var lunbo = document.getElementById("lunbo");
							lunbo.innerHTML = html;
							lunboNum.innerHTML = htmlLunboNum;

						}*/
					},

					error: function(xhr, type, errorThrown) {
						//异常处理；
						if(type == 'timeout') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
						if(type == 'abort') {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						} else {
							layer.open({
								content: '<div style="height:100%;width:100%"><div><img src="${pageContext.request.contextPath}/weixin/images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
								time: 2
							});
							//$(".hidden_div2").show();
							//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
							return;
						}
					}

				}

			);
               
            });
            
            //提交 
            $("#btnSubmit").click(function(){
                 var name = $("#name").val().trim();
                 if (name=="")
                 {
                    mui.toast("歌名不能为空");
                    return false;
                 } 
                 
                 var url = "${pageContext.request.contextPath}/music.do?p=checkMusic";
                 $.post(url,{name:name,gid:gid},function(data){
                     //salert(data);
                     var json = eval("("+data+")");
                     var msg = json.msg;
                     var _zhekou = json.zhekou*10;
                     var zhekou = _zhekou.toFixed(2);
                     var buttons = [zhekou+"折购买","再次挑战"];
                     mui.confirm("提示",msg,buttons,function(e){
                            
                           if (e.index==0)
                           {
                              addCar();
                           }
                           else
                           {
                              parent.location.reload();
                           }
                     });
                     
                 });
                 
            });
            
            function addCar()
            {
                var catnum = 1;
				$.post("${pageContext.request.contextPath}/appgoods.do?p=addCat", {
					gid: gid,
					catnum: catnum
				}, function(data) {
					mui.toast("成功加入购物车");
				});
            }
         
        </script>
