function shuaxin()
{
	mui.plusReady(function(){
		
		plus.webview.getWebviewById('collection/collection.html').reload();
		plus.webview.getWebviewById('shopingcart/cart.html').reload();
		plus.webview.getWebviewById('crowdfunding/crowdfunding.html').reload();
		plus.webview.getWebviewById('center.html').reload();
		
	});
	
}
