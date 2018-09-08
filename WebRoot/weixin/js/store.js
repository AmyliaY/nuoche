$(document).ready(function() {
	mui.init({
		pullRefresh: {
			container: '#pullrefresh',
			up: {
				contentrefresh: '正在加载...',
				callback: pullupRefresh
			}
		}
	});
	var ServerUrl = null;
	var ImgUrl = null;
	var page = 1; 
	var count = null;
	var role=0;
	var none=false;
	mui.plusReady(function() {
		var height = localStorage.getItem("height");
		$(".list_show").css("height", height);
		ServerUrl = plus.storage.getItem("ServerUrl");
		ImgUrl = plus.storage.getItem("ImgUrl");
		getData();
	});
	document.getElementById("search").addEventListener("tap",function(){
		mui.openWindow({
			id: 'search',
			url: 'search.html',
			show: {
				aniShow: 'pop-in',
				duration: 100
			},
			waiting: {
				autoShow: false
			},
			extras:{
				type:2
			}
		});
	});
	$(".segmented-control .control-item").click(function(){
		mui('#pullrefresh').pullRefresh().refresh(true);//重置刷新
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
		$("#sort").html($(this).html());
		var index=parseInt($(this).attr("data-index"));
		if(index!=role){
			role=index;
			page=1;
			document.getElementById("list").innerHTML="";
			plus.nativeUI.showWaiting();
			count=null;
			getData();
			plus.nativeUI.closeWaiting(); 
		}
	});  
	function pullupRefresh() { 
		
		if(none){
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
		}else{
			if(++page>count){
				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
				return;
			}
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
			getData();
		}
		/*
		if(++page>count){
			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			return;
		}
		mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
		getData();*/
	}
	function getData(){
		var data={};
		if(count==null){//说明是第一次加载
			data={
				role:role
			}
		}else{
			data={
				role:role,
				page:page
			}
		}
		mui.ajax(ServerUrl + "home.do?p=dianpu", {
			data: data,
			dataType: 'JSONP ',
			type: 'POST',
			timeout: 10000,
			success: function(data) {
				var map = eval("(" + data + ")");
				var shops=null;
				var goods=null;
				for(var key in map) {
					if(key == "count") {
						count = map[key];
					}
					if(key=="shops"){
						shops=map[key];
					}
					if(key=="listgoods"){
						goods=map[key];
					}  
				}  
				//生成数据 
				var fragment=document.createDocumentFragment();
				if(shops!=null){
					for(var i=0;i<shops.length;i++){
						var content="";
						var li=document.createElement("li");
						li.className="mui-table-view-cell";
						content= 
								'<div class="zdy-shop" id='+shops[i].shopId+'>'+
									'<span class="shop-pic">'+ 
										'<img src="img/layzr.gif" data-layzr="'+ImgUrl+shops[i].shopLogo+'"/>'+
									'</span>'+ 
								 	"<span class='shop_details'>"+
										"<span class='shop_name'>"+shops[i].shopName+"</span>"+
										"<div class='shop_describe'>"+
											'<span style="margin-left:5px">宝贝'+shops[i].countBaobei+'</span>'+
											'<span style="margin-left:5px">销量'+shops[i].shopxl+'</span>'+
										'</div>'+
									'</span>'+
									'<span class="mui-icon mui-icon-arrowright arrow"></span>'+
								'</div>';
						var shop_goods=goods[i];
						content=content+'<div class="inner_ul">';
						for(var j=0;j<shop_goods.length;j++){ 
							content=content+
											'<section class="goods">'+
								                '<a href="#">'+
								                   ' <div class="destination-image">'+
								                    	'<span id='+shop_goods[j].goodsId+' class="goods_img" style="background-image: url('+ImgUrl+shop_goods[j].goodsImg+'); opacity: 1;"></span>'+
								                   ' </div>'+
								                   ' <div class="destination-title">'+
								                       ' <h3>'+shop_goods[j].goodsName+'</h3>'+
								                   ' </div>'+
								               " </a>"+
								           " </section>";
									
						}
						content=content+'</div>';
						li.innerHTML=content;
						fragment.appendChild(li);
					}
					$("#list").append(fragment);
					//设置js以及效果   
					setJs();
				}else{
					var p=document.createElement("p");
    				$(p).css({"color":"#666","text-align":"center","padding-top":"20px","background":"#efeff4"});
    				p.innerHTML="没有搜索到该商店哦，换个名字试试吧";
    				plus.nativeUI.closeWaiting();
    				$("#shopList").append(p);
    				none=true;
				}
				
			},
			error: function(xhr, type, errerThrown) {
				mui.toast('网络异常,请稍候再试');

				mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
			}
		});
	}
	function setJs(){
		var layzr = new Layzr({
			container: null,
			selector: '[data-layzr]',
			attr: 'data-layzr',
			retinaAttr: 'data-layzr-retina',
			bgAttr: 'data-layzr-bg',
			hiddenAttr: 'data-layzr-hidden',
			threshold: 0,
			callback: null
		});
		var shops = document.querySelectorAll(".zdy-shop");
		for(var i = 0; i < shops.length; i++) {
			shops[i].ontouchstart = function() {
				$(this).css("background", "#eee");
			}
			shops[i].ontouchend = function() {
				$(this).css("background", "#FFFFFF");
	
			}
			shops[i].onclick = function() {
				var shopId=$(this).attr("id");
				mui.openWindow({
					id: 'shop_detail',
					url: 'shop_detail.html',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					waiting: {
						autoShow: false
					},
					extras:{
						shopId:shopId
					}
				});
			}
		}
		var goods = document.querySelectorAll(".goods_img");
		for(var i = 0; i < goods.length; i++) {
			goods[i].ontouchstart = function() {
				$(this).css("opacity", "0.7");
			}
			goods[i].ontouchend = function() {
				$(this).css("opacity", "1");
			}
			goods[i].onclick = function() {
				var goodsId=$(this).attr("id");
				mui.openWindow({
					id: 'detail'+Math.random(),
					url: 'detail.html',
					show: {
						aniShow: 'pop-in',
						duration: 100
					},
					waiting: {
						autoShow: false
					},
					extras:{
						type:0,
						sid:goodsId
					}
				});
			}
		}
	}
});