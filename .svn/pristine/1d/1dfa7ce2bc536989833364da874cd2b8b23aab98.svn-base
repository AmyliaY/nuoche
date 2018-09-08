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
	if (projectName == "/pc" || projectName == "/admin" || projectName == "/daili" || projectName == "/weixin")
		projectName = "";

	return (localhostPaht + projectName);
}
var path = getRootPath() ; 
$(function(){
	$("#main_yunshu").click(function(){	
		location=path+"/daili/login.jsp";
	});
	$("#main_caigou").click(function(){	
		location=path+"/admin/login.jsp";
	});
});

$(function() {
	$("#main_yunshu").bind("mouseover", function() {
		$("#main_danwei").css("display", "block");
	});

	$("#main_yunshu").bind("mouseout", function() {
		$("#main_danwei").css("display", "none");
	});

	$("#main_caigou").bind("mouseover", function() {
		$("#main_kehu").css("display", "block");
	});

	$("#main_caigou").bind("mouseout", function() {
		$("#main_kehu").css("display", "none");
	});

}); 