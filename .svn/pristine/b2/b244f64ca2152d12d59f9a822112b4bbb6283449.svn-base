/*JS Document*/
$(function(){
	
	//控制滚动
	var cur_scrolltop = 0,_stop_scroll = false;
	$(window).scroll(function(){
		if(_stop_scroll){
			$(window).scrollTop(cur_scrolltop);
		}
	})
	

    //输入框效果
    	
		var textarea=$('.maintenance-reservation-textarea .textarea');
		var value = textarea.val();
        if (value==''){
		
        textarea.siblings('.maintenance-reservation-textarea .layer').show();
        }
        else{
			console.log(1)
        textarea.siblings('.maintenance-reservation-textarea .layer').hide();
        }
 	
	
    $('.maintenance-reservation-textarea .layer').on('click',function () {
        $(this).hide().siblings('.textarea').focus();
		console.log(2)
    })
	
    $('.maintenance-reservation-textarea .textarea').on('focusout',function () {
        var value = $(".textarea").val();
		console.log(3)
        if (value==''){
        $(this).siblings('.maintenance-reservation-textarea .layer').show();
        }
        else{
         $(this).siblings('.maintenance-reservation-textarea .layer').hide();
        }
    });
	
	//计算内容上下padding
	reContPadding({main:"#container",header:"#header",footer:"#footer"});
	function reContPadding(o){
		var main = o.main || "#container",
			header = o.header || null,
			footer = o.footer || null;
		var cont_pt = $(header).outerHeight(true),
			cont_pb = $(footer).outerHeight(true);
		$(main).css({paddingTop:cont_pt,paddingBottom:cont_pb});
	}
	
$(function(){
		//加入购物车页面计算内容上下padding
	reContMargin({main:"#menu_con",header:"#header",footer:"#shopcart-footer"});
	function reContMargin(o){
		var main = o.main || "#menu_con",
			header = o.header || null,
			footer = o.footer || null;
		var cont_pt = $(header).outerHeight(true),
			cont_pb = $(footer).outerHeight(true);
		$(main).css({marginTop:cont_pt,paddingBottom:cont_pb});
	}
});
	
	
	$(function(){
	
	//计算内容上下padding
	reContPadding({main:"#menu",header:"#header",footer:"#footer"});
	function reContPadding(o){
		var main = o.main || "#menu",
			header = o.header || null,
			footer = o.footer || null;
		var cont_pt = $(header).outerHeight(true),
			cont_pb = $(footer).outerHeight(true);
		$(main).css({top:cont_pt});
	}
});
	
		$(function(){
	
	//计算内容上下padding
	reContPadding({main:"#nav",header:"#header",footer:"#footer"});
	function reContPadding(o){
		var main = o.main || "#nav",
			header = o.header || null,
			footer = o.footer || null;
		var cont_pt = $(header).outerHeight(true),
			cont_pb = $(footer).outerHeight(true);
		$(main).css({top:cont_pt});
	}
});
	
		$(".form-radio").live("click",function(){
		var _flag = $(this).hasClass("form-radio-selected"); 
		if(_flag){
			$(this).removeClass("form-radio-selected");
			$(this).parent().parent().parent("li").removeClass("selected");
		}else{
			$(this).addClass("form-radio-selected");
			$(this).parent().parent().parent("li").addClass("selected");
		}
	})
	
});



!function(win) {
    function resize() {
        var domWidth = domEle.getBoundingClientRect().width;
        if(domWidth / v > 640){
            domWidth = 640 * v;
        }
        win.rem = domWidth / 16;
        domEle.style.fontSize = win.rem + "px";
    }
    var v, initial_scale, timeCode, dom = win.document, domEle = dom.documentElement, viewport = dom.querySelector('meta[name="viewport"]'), flexible = dom.querySelector('meta[name="flexible"]');
    if (viewport) {
        var o = viewport.getAttribute("content").match(/initial\-scale=(["']?)([\d\.]+)\1?/);
        if(o){
            initial_scale = parseFloat(o[2]);
            v = parseInt(1 / initial_scale);
        }
    } else if(flexible) {
        var o = flexible.getAttribute("content").match(/initial\-dpr=(["']?)([\d\.]+)\1?/);
        if (o) {
            v = parseFloat(o[2]);
            initial_scale = parseFloat((1 / v).toFixed(2))
        }
    }
    if (!v && !initial_scale) {
        var n = (win.navigator.appVersion.match(/android/gi), win.navigator.appVersion.match(/iphone/gi));
        v = win.devicePixelRatio;
        v = n ? v >= 3 ? 3 : v >= 2 ? 2 : 1 : 1, initial_scale = 1 / v
    }
    //没有viewport标签的情况下
    if (domEle.setAttribute("data-dpr", v), !viewport) {
        if (viewport = dom.createElement("meta"), viewport.setAttribute("name", "viewport"), viewport.setAttribute("content", "initial-scale=" + initial_scale + ", maximum-scale=" + initial_scale + ", minimum-scale=" + initial_scale + ", user-scalable=no"), domEle.firstElementChild) {
            domEle.firstElementChild.appendChild(viewport)
        } else {
            var m = dom.createElement("div");
            m.appendChild(viewport), dom.write(m.innerHTML)
        }
    }
    win.dpr = v;
    win.addEventListener("resize", function() {
        clearTimeout(timeCode), timeCode = setTimeout(resize, 300)
    }, false);
    win.addEventListener("pageshow", function(b) {
        b.persisted && (clearTimeout(timeCode), timeCode = setTimeout(resize, 300))
    }, false);
    resize();
}(window);
