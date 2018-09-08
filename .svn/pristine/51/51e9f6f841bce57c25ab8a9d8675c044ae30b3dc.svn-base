$(document).ready(function() {
	mui.init({
		swipeBack: true //启用右滑关闭功能
	});
	mui('.mui-scroll-wrapper').scroll();
	mui('body').on('shown', '.mui-popover', function(e) {
		//console.log('shown', e.detail.id);//detail为当前popover元素
	});
	mui('body').on('hidden', '.mui-popover', function(e) {
		//console.log('hidden', e.detail.id);//detail为当前popover元素
	});
	var self = null;
	ServerUrl = null;
	targetIndex = 0;
	//查找历史记录
	var db = openDatabase('mylocaldatabase', '1.0', '用户购物车本地数据库', 2 * 1024 * 1024);
    db.transaction(function (tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS search (content TEXT,type INT)");
       /* tx.executeSql("INSERT INTO search (content,type) values(?,?)", ["content",0], null, null);*/
    });
    
	mui.plusReady(function() {
		self = plus.webview.currentWebview();
		targetIndex = self.type;
		$(".target").html($("#topPopover li:nth-child(" + (targetIndex + 1) + ")").find("span").html());
		//从本地数据库遍历出历史搜索记录
		db.transaction(function (tx) {
	        tx.executeSql("SELECT * FROM search", [],
	             function (tx, results) {
	             	if(results.rows.length>0){
	             		for (var i = results.rows.length-1; i >=0; i--) {
		             		var content=results.rows.item(i).content;
		             		var type=parseInt(results.rows.item(i).type);
		             		var p=document.createElement("p");
	             			p.className="content";
	             			p.id=type;
	             			p.innerHTML=content;
	             			p.onclick=function(){
	             				var sid=$(this).attr("id");
	             				var con=$(this).html();
								db.transaction(function (tx) {
									//先删除该条数据 在插入到最后
							        tx.executeSql("DELETE FROM search where content=? and type=?", [content,targetIndex], null, null);
							        tx.executeSql("INSERT INTO search (content,type) values(?,?)", [content,targetIndex], null, null);
								});
								mui.openWindow({
									id: 'searchShow',
									url: 'searchShow.html',
									show: {
										aniShow: 'pop-in',
										duration: 200
									},
									waiting: {
										autoShow: false
									},
									extras: {
										type: sid,
										content: con
									}
								});
	             			}
	             			$("#list").append(p);
	             			$("#clear").show();
		                 }
	             	}else{ 
	             		var p='<p style="color: #A3A3A3;font-size: 14px;text-align: center;padding-top:20px">暂无历史记录</p>';
	             		$("#list").html(p);
	             	}
	                 setJs();
	             },
	        function () {
	            alert("error");
	        });
	    });
		    
		window.addEventListener("refresh",function(event){
			var c=event.detail.cid;
			if(c!=null){
				location.reload();
			}
		});
	});
	$("#topPopover li").click(function() {
		var content = $(this).find("span").html();
		targetIndex = parseInt($(this).attr("index"));
		$(".target").html(content);
		mui(".mui-popover").popover("hide");
	});
	document.getElementById("clear").addEventListener("tap",function(){
		var btnArray = [{title:"确定"}];
			plus.nativeUI.actionSheet( {
				title:"清空历史记录",
				cancel:"取消",
				buttons:btnArray
			}, function(e){
				var index = e.index;
				if(index==1){//确定清空
					db.transaction(function (tx) {
				    	tx.executeSql("DELETE FROM search");
				        /*tx.executeSql("CREATE TABLE IF NOT EXISTS search (content TEXT,type INT)");*/
				    });
					$("#list").html("");
					var p='<p style="color: #A3A3A3;font-size: 14px;text-align: center;padding-top:20px">暂无历史记录</p>';
	             	$("#list").html(p);
				}
			} );
	});
	document.getElementById("search").addEventListener("tap", function() {
		//进入到展示界面
		var content = $("#content").val();
		if(content==""){
			mui.toast("请输入搜素内容");
			return;
		}
		//先查询历史记录里面有没有这条数据 如果没有直接插入 否则将该条数据插入到最后
		db.transaction(function (tx) {
			tx.executeSql("SELECT * FROM search where content=? and type=?", [content,targetIndex], 
			function(tx, results){
					if(results.rows.length>0){//先删除该条数据 在插入到最后
	             		tx.executeSql("DELETE FROM search where content=? and type=?", [content,targetIndex], null, null);
	             	}
	             	tx.executeSql("INSERT INTO search (content,type) values(?,?)", [content,targetIndex], null, null);
	             	
			}, null);
		});
		mui.openWindow({
			id: 'searchShow',
			url: 'searchShow.html',
			show: {
				aniShow: 'pop-in',
				duration: 100
			},
			waiting: {
				autoShow: false
			},
			extras: {
				type: targetIndex,
				content: content
			}
		});
	});
	function setJs(){
		var history=document.querySelectorAll("#list .content");
		if(history.length>0){
			for(var i=0;i<history.length;i++){
				history[i].ontouchstart = function() {
					$(this).css("background", "#eee");
				}
				history[i].ontouchend = function() {
					$(this).css("background", "#FFFFFF");
		
				}
			}
		}
	}
});