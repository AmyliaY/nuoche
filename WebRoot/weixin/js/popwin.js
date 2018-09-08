
function openPop(id) {
	document.getElementById(id).style.display="block";
}

function closePop(id){
	document.getElementById(id).style.display="none";
}


function showPopWin(wintype,msg){
	//$('#popbg').show();
	switch(wintype){
		case 0:
			showLoading(msg);
			hideMsg();
			hideCheck();
		break;
		
		case 1:
			hideLoading();
			showMsg(msg);
			hideCheck();
		break;
		
		case 2:
			hideLoading();
			hideMsg();
			showCheck(msg);
		break;
	}
}

function showLoading(msg){
	$("#loadingMsg").html(msg);
	openPop('loadingWin');
	
}

function hideLoading(){
	closePop('loadingWin');
}

function showMsg(msg){
	$("#msgTip").html(msg);
	openPop('msgWin');
}

function hideMsg(){
	closePop('msgWin');
}

function showCheck(msg){
	$("#checkMsgTip").html(msg);
	openPop('checkWin');
}

function hideCheck(){
	closePop('checkWin');
}


function hidePopWin(){
	closePop('loadingWin');
	closePop('checkWin');
	closePop('msgWin');
}

/**
 * 验证号码的合法性
 * @param str
 * @returns {Boolean}
 */
function checkPhone(str){
	var reg1 = /^(13|14|15|17|18)\d{9}$/;
	var reg2 = /^0\d{2,3}\d{7,8}$/;
	if (reg1.test(str)) {
	     return true;
	} else {
		if (reg2.test(str)) { 
			return true;
		}
	}
	return false;
}

function checkDatetime(str){
	var reg1=/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/;
	if (reg1.test(str)) {
	     return true;
	}
	return false;
}

function checkDate(str){
	var reg1=/^\d{4}-\d{2}-\d{2}$/;
	if (reg1.test(str)) {
	     return true;
	}
	return false;
}