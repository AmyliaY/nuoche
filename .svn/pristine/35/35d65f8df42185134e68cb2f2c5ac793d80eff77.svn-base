/*
添加人：王影
时间：2016-04-21
版本：1.0
版权：量硕宏程投资管理（北京）有限公司
*/


//选项卡
function fnTab(obj){
	$(obj).each(function(){
		var $this=$(this);
		$this.find(obj+'_hd').children().each(function(index){
			$(this).click(function() {
				$(this).siblings().removeClass('cur');
				$this.find(obj+'_bd').eq(index).siblings(obj+'_bd').hide();
				$(this).addClass('cur');
				$this.find(obj+'_bd').eq(index).show();
			});
		});
	});
}

//切换样式
function toggleClass(obj, name){
	$(obj).bind('click', function(event) {
		$(this).children().toggleClass(name);
		$(this).siblings().children().removeClass(name);
	});
}

//数量加
function numPlus(obj, numObj, lessObj){
	var n=$(obj).parent().find(numObj).eq(0).text();
	n++;
	$(obj).parent().find(numObj).eq(0).text(n);
	if(n>1){
		$(obj).siblings(lessObj).removeClass('failed');
	}
}

//数量减
function numLess(obj, numObj){
	var n=$(obj).parent().find(numObj).eq(0).text();
	if(n>=2){
		if(n==2) $(obj).addClass('failed');
		n--;
		$(obj).parent().find(numObj).eq(0).text(n);
	}else{
		$(obj).addClass('failed');
		return false;
	}
}

//删除dom
function delOrder(obj, parentObj){
	$(obj).bind('click', function(event) {
		$(this).parentsUntil(parentObj).parent().remove();
	});
}

/*手机号码验证：只允许以13、14、15、17、18开头的号码*/
function chkMobile(str){
  return str.search(/^1[3,4,5,7,8]\d{9}$/) == 0 ? true: false
}


//编辑按钮
function editCollect(checkObj, totalObj){
	$(totalObj).toggleClass('dis_none');
	$(checkObj).find('ul').each(function(){
		$(this).children('li:first').toggleClass('hide');
	});
	$('body').toggleClass('pb100');
}

//多项删除
function delCollect(obj){
	$(obj).find('.checked').parentsUntil(obj).remove();
}

function fnCount(numObj ,obj){
	var n= $(obj).find('ul').size()>0 ? $(obj).find('ul').size() : 0;
	$(numObj).text(n);
}

function setWidth(obj, addWidthObj){
	$(obj).each(function(){
		var w=$(document).width()+$(this).find(addWidthObj).outerWidth();
		$(this).css('width', w);
	});
}

//触屏滑动
function touchMove(obj ,subObj , wDistance){
    var aContainer=document.getElementById(obj).getElementsByTagName(subObj);

    for(var i=0; i<aContainer.length; i++){
        var _start = {}, _move = {}, _end = {}; //开始和移动的鼠标位置

        aContainer[i].addEventListener('touchstart', function (e) {
            _start.x = e.changedTouches[0].pageX;
            _start.y = e.changedTouches[0].pageY;

            this.style['-webkit-transition'] = 'none';
            this.style.transition = 'none';
        }, true);

        aContainer[i].addEventListener('touchmove', function (e) {
            _move.x = e.changedTouches[0].pageX;
            _move.y = e.changedTouches[0].pageY;

            var distance = _move.x - _start.x; //计算水平移动的距离
            if(distance>0){//右滑动
                distance= 0;
            };
            if(distance<0){ //左滑动
                distance=-wDistance;

                for(var j=0; j< aContainer.length; j++){
                    aContainer[j].style['-webkit-transform'] = 'translate3d(0, 0, 0)';
                    aContainer[j].style.transform = 'translate3d(0, 0, 0)';
                }
            }

            var translate = 'translate3d(' + distance + 'px, 0, 0)';
            this.style['-webkit-transform'] = translate;
            this.style.transform = translate;
        }, true);
    }
}

function reSetTouch(obj ,subObj){
    var aArry=document.getElementById(obj).getElementsByTagName(subObj);
    for(var j=0; j< aArry.length; j++){
        aArry[j].style['-webkit-transform'] = 'translate3d(0, 0, 0)';
        aArry[j].style.transform = 'translate3d(0, 0, 0)';
    }
}

//无缝滚动
function marquee(obj){
	$(obj).each(function(){
		var $this=$(this);
		var w=Math.ceil($this.find('li').outerWidth())*$this.find('li').size()+2;
		var h=Math.ceil($this.find('li').outerHeight());
		$this.children('ul').css({
			'width':w,
			'height':h
		});
		$this.find('li').css('height',h);
		$this.parent().css('height', h);
	});
}

function setTotalWidth(obj){
	$(obj).each(function(){
		var w=0;
		var _this=$(this);
		$.each(_this.children(),function(){
			w+=$(this).outerWidth();
		})
		w+=4;
		_this.css('width',w);
	});
}

  //蒙版生成div
  function BtPopload(showId) {
    var h = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + 'px';
    var w = document.documentElement.scrollWidth + 'px';
    var popCss = "background:#000;opacity:0.3;filter:alpha(opacity=30);position:absolute;left:0;top:0;overflow:hidden;"
    var exsit = document.getElementById("popBox");
    if (!exsit) {
      pop_Box = document.createElement("div");
      pop_Box.id = "popBox";
      document.getElementsByTagName("body")[0].appendChild(pop_Box);
      pop_Box.style.cssText = popCss;
      pop_Box.style.zIndex = "10";
      pop_Box.style.height = h;
      pop_Box.style.width = w;
    }
    BtShow("popBox");
    BtShow(showId);
    pop_Win = document.getElementById(showId);
    pop_Win.style.position = "absolute";
    pop_Win.style.zIndex = "11";
    var scroll_top;
    if (document.documentElement && document.documentElement.scrollTop){
      scroll_top = document.documentElement.scrollTop;
    }
      else if (document.body) {
        scroll_top = document.body.scrollTop;
      }
    pop_Win.style.top = scroll_top + document.documentElement.clientHeight / 2 - pop_Win.offsetHeight / 2 + 'px';
    pop_Win.style.left = (document.documentElement.clientWidth / 2 - pop_Win.offsetWidth / 2) + 'px';
  }
  //隐藏
  function BtHide(id) {
    var Div = document.getElementById(id);
    if (Div) {
      Div.style.display = "none";
    }
  }
  //显示
  function BtShow(id) {
    var Div = document.getElementById(id);
    if (Div) {
      Div.style.display = "block";
    }
  }
function BtPopHide(Did) {
    BtHide(Did);
    BtHide("popBox");
  }