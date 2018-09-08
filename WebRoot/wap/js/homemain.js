//得到工程路径
function getRootPath() {
	//http://localhost:8083/uimcardprj/share/meun.jsp
	var curWwwPath = window.document.location.href;
	//uimcardprj/share/meun.jsp
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	//http://localhost:8083
	var localhostPaht = curWwwPath.substring(0, pos);
	// uimcardprj
	var projectName = pathName
			.substring(0, pathName.substr(1).indexOf('/') + 1);
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/weixin"  || projectName == "/wap")
		projectName = "";

	return (projectName);
}
var root = getRootPath();
mui.ajax(root + "/wapgoods.do?p=findAlllbt", 
	{
		
		type: 'post', //HTTP请求类型
		timeout: 30000, //超时时间设置为10秒；
		success: function(json) {
			var map = eval("(" + json + ")");
			var list = map.list;
			var tempHtml = "";
			var jiedian="";
			if (list.length>0)
				{
                    
				    var first = '<div class="mui-slider-item mui-slider-item-duplicate"><a ><img src="'+(root+list[0].cimages)+'"></a></div>'
				    tempHtml = tempHtml+first;
					for (var i=0;i<list.length;i++)
					{
					   var image =root +list[i].cimages;

					   var middle = '<div class="mui-slider-item"><a data-type='+list[i].cimgType+' data-url='+list[i].cimgUrl+' data-neiro='+list[i].cimgDescribe.trim()+' data-title='+list[i].cimgTitle+' data-image='+list[i].cimages+' onclick="detail2(this)" ><img src="'+(root+list[i].cimages)+'"></a></div>';
					   var jie="<div class='mui-indicator'></div>";
					   var jie2="<div class='mui-indicator mui-active'></div>";
					     if (i==0)
						      jiedian+=jie2;
					     else
					    	 jiedian+=jie;
					   tempHtml = tempHtml + middle;
					}
				    
				    var last = '<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="'+(root+list[list.length-1].cimages)+'"></a></div>'
				
				    tempHtml = tempHtml + last;
				    document.getElementById("lunboDiv").innerHTML = tempHtml;
				    document.getElementById("jie").innerHTML=jiedian;  
				    
				    var slider = mui("#slider");
					slider.slider({
						interval : 2000
					});
				}
			//alert(json);
			//alert(obj[0].cimgUrl);
		},
		error: function(xhr, type, errorThrown) {
			//异常处理；
			if(type == 'timeout') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
			if(type == 'abort') {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			} else {
				layer.open({
					content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
					time: 2
				});
				//$(".hidden_div2").show();
				//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
		}
	});


mui.ajax(root + "/wapgoods.do?p=findAllgoods", 
		{
			
			type: 'post', //HTTP请求类型
			timeout: 30000, //超时时间设置为10秒；
			success: function(json) {
				var map = eval("(" + json + ")");
				var list = map.list;
				var zong="";
				
				if(list.length>0){
					for (var i=0;i<list.length;i++){
					var goodsfenlei="<li class='mui-table-view-cell mui-media mui-col-xs-6' style='width: 49%;background: #fff;padding: 0px;margin-left: 7px;height: 170px;'><div ><a onclick='detail(this)' data-id="+list[i].gid+" ><img class='mui-media-object' data-lazyload='"+(root+list[i].gimages)+"' style='width:  100%;height: 110px;'>";
					if(list[i].gziying==1){
						var ziyin="<span style='top: 0px; left: -1px; position:absolute; '><img src='../img/zy.png' height='60px' width='60px'  /></span>";
					}else{
						var ziyin="";
					}
					var goodslast="<div class='mui-media-body'>"+(list[i].jianjie)+"</div><div class='mui-media-body'><b style='color: red; font-size: 10px;'>￥"+(list[i].gprice)+"</b><span style='color: darkgrey; text-decoration:line-through;'>￥"+(list[i].gshiprice)+"</span></div></a></div></li>";
						zong=zong+goodsfenlei+ziyin+goodslast;
				   }
					 document.getElementById("ulmain").innerHTML=zong;  
				}
				
				mui(document).imageLazyload({
					placeholder: '../img/timg.gif'
				});	
				
			},
			error: function(xhr, type, errorThrown) {
				//异常处理；
				if(type == 'timeout') {
					layer.open({
						content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="60px" height="60px" style="margin-top:-10px"/></div>服务器开了小差，请求超时了</div>',
						time: 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				}
				if(type == 'abort') {
					layer.open({
						content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>亲，您的网络有点问题哦！</div>',
						time: 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				} else {
					layer.open({
						content: '<div style="height:100%;width:100%"><div><img src="../images/jnweb-kulian.png" width="30px" height="30px" style="margin-top:-10px"/></div>服务器拒绝了连接，稍后再试吧！</div>',
						time: 2
					});
					//$(".hidden_div2").show();
					//mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
					return;
				}
			}
		
		});
	

//商品内容 or 链接
function detail(e) {
	
		var gid = e.getAttribute("data-id");
		//alert(gid);
		
		window.top.location = urldomain+"/weixin/goodsdetail/detail.jsp?gid="+gid+"&state=1";
	}
		
//轮播图内容 or 链接
function detail2(e){
	var type = e.getAttribute("data-type");
	var url = e.getAttribute("data-url");
	var neiro = e.getAttribute("data-neiro");
	var title = e.getAttribute("data-title");
	var img = e.getAttribute("data-img");
	if(type == 1){
		window.top.location = urldomain+"/weixin/goodsdetail/detail.jsp?gid="+url+"&state=1";
	}else if(type == 2){
		plus.runtime.openURL(url);
	}else{
		window.top.location = urldomain+"/weixin/home/lunbo.jsp?neiro="+neiro+"&title="+title+"&img="+img;
	}
}


	
