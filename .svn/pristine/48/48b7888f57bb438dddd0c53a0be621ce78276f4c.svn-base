$(document).ready(function(){
  
  $('li.hd_menu_tit').mousemove(function(){
  $(this).find('div.hd_menu_list,div.hd_Shopping_list').show();//you can give it a speed
  });
  $('li.hd_menu_tit').mouseleave(function(){
  $(this).find('div.hd_menu_list,div.hd_Shopping_list').hide();
  });
 $(function(){
	$(".fixed_qr_close").click(function(){
		$(".mod_qr").hide();
	})
})
//按钮点击事件
$(".modify_btn").click(function(){
	 $('.text').attr("disabled", false);
	 $('.text').addClass("add");
	  $('#Personal').find('.info_list').addClass("hover");
	
	});
	$(".confirm").click(function(){
		$('.text').attr("disabled", true);
		$('.text').removeClass("add");
		})
});
/*$(document).ready(function(){
	$("#index_search_main .search-container").click(function(){
			$(this).addClass("hd_menu_hover");
			$(this).children("div.search-container").attr('class','');
		},function(){
			$(this).removeClass("hd_menu_hover");  
			$(this).children("div.search-container").attr('class','');
		}
	); 
	$("#nav li.no_sub").hover(function(){
			$(this).addClass("hover1");
		},function(){
			$(this).removeClass("hover1");  
		}
	); 
});*/

$(document).ready(function(){
$("#allSortOuterbox li").hover(function(){
		$(this).find(".menv_Detail").show();
	},function(){
		$(this).find(".menv_Detail").hide();
});
	$("#allSortOuterbox li.name").hover(function(){
												
			$(this).addClass("hover_nav");
												
		},function(){
			$(this).removeClass("hover_nav" );  
		});
		$("div.display ").hover(function(){
		$(this).addClass("hover");
	},function(){
		$(this).removeClass("hover" );  
});	
});
$(document).ready(function(){
$("#lists li").hover(function(){
		$(this).find(".Detailed").show();
	},function(){
		$(this).find(".Detailed").hide();
});
	$("#lists li").hover(function(){
												
			$(this).addClass("hover_nav");
												
		},function(){
			$(this).removeClass("hover_nav" );  
		}
	); 
});
/**********鼠标移动效果************/
$(document).ready(function(){
	$("ul.products").hover(function() {
		$(this).find("#cell_12428").stop()
		.animate({right: "0", opacity:1}, "fast")
		.css("display","block")

	}, function() {
		$(this).find("#cell_12428").stop()
		.animate({right: "0", opacity: 0}, "fast")
	});
});
$(window).scroll(function() {
		var topToolbar = $("#dd_Section");
		var headerH = $("#Group_outerHeight").outerHeight();
		var headers = $("#header_outerHeight").outerHeight();
		var scrollTop =$(document.body).scrollTop();	
			if( scrollTop >= headerH + headers ){
				topToolbar.stop(false,true).addClass("fixToTop");
			}else if( scrollTop < headerH + headers ){
				topToolbar.stop(false,true).removeClass("fixToTop"); 
			}
});
/***************************/
$(window).scroll(function() {
		var topToolbar = $("#fx_Shop_Info");
		var headerH = $("#Distribution_style").outerHeight();
		//var headers = $("#header_outerHeight").outerHeight();
		var scrollTop =$(document.body).scrollTop();	
			if( scrollTop >= headerH  ){
				topToolbar.stop(false,true).addClass("fixToTop");
			}else if( scrollTop < headerH  ){
				topToolbar.stop(false,true).removeClass("fixToTop"); 
			}
});
/*********************点击事件*********************/
$( document).ready(function(){
  $('#index_searchForm').die().live("click",function(){ 
	$('#index_search_main').find('.search-container').removeClass('search-container, on-focus').attr('class','').addClass('search-container  on-focus');
	$('#scwrapper').hover(function(){
												
			$(this).addClass("hover_nav");
												
		},function(){
			$(this).removeClass("hover_nav" );  
		}); 
	  	
  }); 
      $('.sprite-icon').die().live("click",function(){ 
	$('#index_search_main').find('.search-container').attr('class','').addClass('search-container  on-blur');
	//$(this).addClass('search-container  on-focus');
	  	
  });
 });
/***********************商品分类顶部浮动固定层菜单栏**************************/
$(window).scroll(function() {
		var topToolbar = $("#index_search_main");
		var headers = $("#swiper_wrapper").outerHeight();
		var scrollTop =$(document.body).scrollTop();	
			if( scrollTop >= + headers ){
				topToolbar.stop(false,true).addClass("fixToTop");
			}else if( scrollTop < headers ){
				topToolbar.stop(false,true).removeClass("fixToTop"); 
			}
});
/**************邮箱*************/
(function($){
    $.fn.extend({
        "changeTips":function(value){
            value = $.extend({
                divTip:""
            },value)
            
            var $this = $(this);
            var indexLi = 0;
            
            //点击document隐藏下拉层
            $(document).click(function(event){
                if($(event.target).attr("class") == value.divTip || $(event.target).is("li")){
                    var liVal = $(event.target).text();
                    $this.val(liVal);
                    blus();
                }else{
                    blus();
                }
            })
            
            //隐藏下拉层
            function blus(){
                $(value.divTip).hide();
            }
            
            //键盘上下执行的函数
            function keychang(up){
                if(up == "up"){
                    if(indexLi == 1){
                        indexLi = $(value.divTip).children().length-1;
                    }else{
                        indexLi--;
                    }
                }else{
                    if(indexLi ==  $(value.divTip).children().length-1){
                        indexLi = 1;
                    }else{
                        indexLi++;
                    }
                }
                $(value.divTip).children().eq(indexLi).addClass("active").siblings().removeClass();    
            }
            
            //值发生改变时
            function valChange(){
                var tex = $this.val();//输入框的值
                var fronts = "";//存放含有“@”之前的字符串
                var af = /@/;
                var regMail = new RegExp(tex.substring(tex.indexOf("@")));//有“@”之后的字符串,注意正则字面量方法，是不能用变量的。所以这里用的是new方式。


                //让提示层显示，并对里面的LI遍历
                if($this.val()==""){
                    blus();
                }else{
                    $(value.divTip).
                    show().
                    children().
                    each(function(index) {
                        var valAttr = $(this).attr("email");
                        if(index==1){$(this).text(tex).addClass("active").siblings().removeClass();}
                        //索引值大于1的LI元素进处处理
                        if(index>1){
                            //当输入的值有“@”的时候
                            if(af.test(tex)){
                                //如果含有“@”就截取输入框这个符号之前的字符串
                                fronts = tex.substring(tex.indexOf("@"),0);
                                $(this).text(fronts+valAttr);
                                //判断输入的值“@”之后的值，是否含有和LI的email属性
                                if(regMail.test($(this).attr("email"))){
                                    $(this).show();
                                }else{
                                    if(index>1){
                                        $(this).hide();
                                    }    
                                }
                                
                            }
                            //当输入的值没有“@”的时候
                            else{
                                $(this).text(tex+valAttr);
                            }
                        }
                    })
                }    
            }
            
            
            //输入框值发生改变的时候执行函数，这里的事件用判断处理浏览器兼容性;
            if($.browser.msie){
                $(this).bind("propertychange",function(){
                    valChange();
                })
            }else{
                $(this).bind("input",function(){
                    valChange();
                })
            }
            

            //鼠标点击和悬停LI
            $(value.divTip).children().
            hover(function(){
                indexLi = $(this).index();//获取当前鼠标悬停时的LI索引值;
                if($(this).index()!=0){
                    $(this).addClass("active").siblings().removeClass();
                }    
            })
                    
        
            //按键盘的上下移动LI的背景色
            $this.keydown(function(event){
                if(event.which == 38){//向上
                    keychang("up")
                }else if(event.which == 40){//向下
                    keychang()
                }else if(event.which == 13){ //回车
                    var liVal = $(value.divTip).children().eq(indexLi).text();
                    $this.val(liVal);
                    blus();
                }
            })                
        }    
    })    
})(jQuery)