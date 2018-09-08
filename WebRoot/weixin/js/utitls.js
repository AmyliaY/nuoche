/**
 * 返回数据交互的url路径
 */
function getUrl(){
	var url = "http://192.168.28.114:8000/web";
	return url;
}
/**
 * 返回系统环境
 * */
function getOsType(){
	var osType = 'Android';
	return osType;
} 

/**
 * 弹出原生提示对话框
 */
function myAlert(tip){
	plus.nativeUI.alert(tip,null,"提示信息");
}

/**
 * 返回标准的日期格式：年-月-日
 * @param {Object} value
 */
function getStandardDate(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var day = v_date.getDate();
		var month = v_date.getMonth()+1;
		var year = v_date.getFullYear();
	
		day = (day.toString()).length<2?("0"+day):day;
		month = (month.toString()).length<2?("0"+month):month;

		return year + '-' + month + '-' + day;
	}
	
}
/**
 * 返回标准的日期格式：月-日
 * @param {Object} value
 */
function getStandardDateMD(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var day = v_date.getDate();
		var month = v_date.getMonth()+1;
		var year = v_date.getFullYear();
	
		day = (day.toString()).length<2?("0"+day):day;
		month = (month.toString()).length<2?("0"+month):month;

		return month + '-' + day;
	}
	
}
/**
 * 返回标准的时间格式：时:分:秒
 * @param {Object} value
 */
function getStandardTime(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var hour = v_date.getHours();
		var minute = v_date.getMinutes();
		var second = v_date.getSeconds();
	
		hour = (hour.toString()).length<2?("0"+hour):hour;
		minute = (minute.toString()).length<2?("0"+minute):minute;
		second = (second.toString()).length<2?("0"+second):second;
	
		return hour + ':' + minute + ':' + second;
	}
}

/**
 * 返回标准的时间格式：时:分:秒
 * @param {Object} value
 */
function getStandardTimeHm(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var hour = v_date.getHours();
		var minute = v_date.getMinutes();
		var second = v_date.getSeconds();
	
		hour = (hour.toString()).length<2?("0"+hour):hour;
		minute = (minute.toString()).length<2?("0"+minute):minute;
		second = (second.toString()).length<2?("0"+second):second;
	
		return hour + ':' + minute;
	}
}
/**
 * 返回中文的星期几格式，比如：星期一
 * @param {Object} value
 */
function getStandardWeekDay(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var weekday = v_date.getDay();
	
		if (weekday=="1") {weekday="一";}
		if (weekday=="2") {weekday="二";}
		if (weekday=="3") {weekday="三";}
		if (weekday=="4") {weekday="四";}
		if (weekday=="5") {weekday="五";}
		if (weekday=="6") {weekday="六";}
		if (weekday=="7") {weekday="日";}

		return "星期" + weekday;
	}
}
/**
 * 返回日期格式：xxxx-xx-xx  HH:MM:SS
 * @param {Object} value
 */
function getStandardDT(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var year = v_date.getFullYear();
		var month = v_date.getMonth()+1;
		var day = v_date.getDate();
		var hour = v_date.getHours();
		var minute = v_date.getMinutes();
		var second = v_date.getSeconds();
		day = (day.toString()).length<2?("0"+day):day;
		month = (month.toString()).length<2?("0"+month):month;
		hour = (hour.toString()).length<2?("0"+hour):hour;
		minute = (minute.toString()).length<2?("0"+minute):minute;
		second = (second.toString()).length<2?("0"+second):second;
		return year + '-' + month + '-' + day + '  ' + hour + ':' + minute + ':' + second;
	}
}

/**
 * 返回日期格式：xxxx-xx-xx  HH:MM
 * @param {Object} value
 */
function getStandardDTymdhm(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var year = v_date.getFullYear();
		var month = v_date.getMonth()+1;
		var day = v_date.getDate();
		var hour = v_date.getHours();
		var minute = v_date.getMinutes();
		var second = v_date.getSeconds();
		day = (day.toString()).length<2?("0"+day):day;
		month = (month.toString()).length<2?("0"+month):month;
		hour = (hour.toString()).length<2?("0"+hour):hour;
		minute = (minute.toString()).length<2?("0"+minute):minute;
		second = (second.toString()).length<2?("0"+second):second;
		return year + '-' + month + '-' + day + '  ' + hour + ':' + minute;
	}
}

/**
 * 返回日期格式：xx-xx hh24:mi
 * @param {Object} value
 */
function getStandardDTT(value){
	if(!value || typeof(value) == "undefined" || value == ""||value=="null"||value==null){
		return '';
	}else{
		var v_date = new Date(value);
		var year = v_date.getFullYear();
		var month = v_date.getMonth()+1;
		var day = v_date.getDate();
		var hour = v_date.getHours();
		var minute = v_date.getMinutes();
		var second = v_date.getSeconds();
		day = (day.toString()).length<2?("0"+day):day;
		month = (month.toString()).length<2?("0"+month):month;
		hour = (hour.toString()).length<2?("0"+hour):hour;
		minute = (minute.toString()).length<2?("0"+minute):minute;
		second = (second.toString()).length<2?("0"+second):second;
		return month + '-' + day + '  ' + hour + ':' + minute ;
	}
}




/**
 * 拍照压缩上传
 * @param obj 显示照片的img对象
 * @param url 拍照后的本地路径
 * @param qt  压缩质量
 * @param fun  压缩上传后的执行的操作
 */
function uploadImg(obj,url,qt,fun) {
	var imgele = new Image();
	imgele.src = url;
	imgele.onload = function() {
		var that = this;
         //生成比例
	    var w = that.width,
	        h = that.height,
	        scale = w / h;
		 //生成canvas
	    var canvas = document.createElement('canvas');
	    var ctx = canvas.getContext('2d');
	    $(canvas).attr({width : w, height : h});
	    ctx.drawImage(that, 0, 0, w, h);
	    /**
	     * 生成base64 
	     * 兼容修复移动设备需要引入mobileBUGFix.js
	     */
	    var base64 = canvas.toDataURL('image/jpeg', qt || 0.8 );
	
	    // 修复IOS
	    if( navigator.userAgent.match(/iphone/i) ) {
	        var mpImg = new MegaPixImage(img);
	        mpImg.render(canvas, { maxWidth: w, maxHeight: h, quality: qt || 0.8});
	        base64 = canvas.toDataURL('image/jpeg', qt || 0.8 );
	    }
	
	    // 修复android
	    if( navigator.userAgent.match(/Android/i) ) {
	        var encoder = new JPEGEncoder();
	        base64 = encoder.encode(ctx.getImageData(0,0,w,h), qt * 100 || 80 );
	    }		
		obj.src = base64;
		var vt = base64.substr( base64.indexOf(',') + 1 )
		$.ajax({
			type: 'post',
			url: getUrl() + '/wq/wq02/wq0204/saveZpImgNew.ht',
			data: {imgData:vt,type:'0401'},
			cache: false,
			dataType: 'json',
			success: function(data) {
				fun(data);
			},
			error: function() {
				alert("上传照片错误，请联系管理员");
				return;
			}
		});
	}
}
//根据系统 引入不同的js
function addCssByLink(){
	if (plus.os.name == "Android") {
		
	} else {
		var doc=document;
		var link=doc.createElement("link");
		link.setAttribute("rel", "stylesheet");
		link.setAttribute("type", "text/css");
		link.setAttribute("href", '../../css/pt20.css');
		var heads = doc.getElementsByTagName("head");
		if(heads.length)
			heads[0].appendChild(link);
		else
	    doc.documentElement.appendChild(link);
	}
} 

//根据系统 引入不同的js
function loadCss(){
	var doc=document;
	var link=doc.createElement("link");
	link.setAttribute("rel", "stylesheet");
	link.setAttribute("type", "text/css");
	link.setAttribute("href", '../../css/pt20.css');
	var heads = doc.getElementsByTagName("head");
	if(heads.length)
		heads[0].appendChild(link);
	else
    	doc.documentElement.appendChild(link);
} 

if (getOsType() != "Android") {
	loadCss();
}



