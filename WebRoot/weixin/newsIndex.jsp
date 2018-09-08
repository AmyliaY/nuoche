<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title> 公司新闻</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">

		<!--标准mui.css-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/weixin/css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/weixin/css/app.css"/>
		<style>
			input, button, .mui-btn {
				margin-top: 10px;
				margin-left: 10px;
			}
			#sp{
			  margin-left: 0px;
			}
			
		</style>
	</head>

	<body>
	
	<div id="slider" class="mui-slider">
			<div class="mui-slider-group mui-slider-loop" style="height: 200px;" >

				<c:if test="${!empty hots  }">
					<div class="mui-slider-item ">
						<a href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId=${hots[fn:length(hots)-1].newsId }"> 
						<img id="first" style="width:100%;height:200px;" src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/${hots[fn:length(hots)-1].newsImage }" >
							<p class="mui-slider-title">${hots[fn:length(hots)-1].newsTitle }</p>
						</a>
					</div>
				</c:if>
				

				<c:forEach items="${hots }" var="hot">
				<div class="mui-slider-item">

					<a href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId=${hot.newsId}">
						<img style="width:100%;height:200px;"  src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/${hot.newsImage }">
					    <p class="mui-slider-title">${hot.newsTitle }</p>
					</a>
				
				</div>
				</c:forEach>

				<!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
				<c:if test="${!empty hots  }">
					<div class="mui-slider-item ">
					
						<a href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId=${hots[0].newsId}">
						 <img style="width:100%;height:200px;" id="end" src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/${hots[0].newsImage }">
							<p class="mui-slider-title">${hots[0].newsTitle }</p>
						</a>
					
					</div>
				</c:if>

			</div>

			<div class="mui-slider-indicator mui-text-right">
				<c:if test="${!empty hots  }">
					<div class="mui-indicator mui-active"></div>
					<c:forEach begin="1" end="${fn:length(hots)-1 }">
						<div class="mui-indicator"></div>
					</c:forEach>
				</c:if>

			</div>

		</div>
		
		
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper" style="margin-top: 200px;">
			<div class="mui-scroll">
				<ul class="mui-table-view ">
					<!-- 从数据库查的数据显示 -->
					<c:forEach items="${list}" var="news">
						<li class="mui-table-view-cell mui-media">
							<a  href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId=${news.newsId}">
								
								<img class=" mui-pull-left" style="width:66px;height:46px;margin-right:8px;" src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/${news.newsImage }">
						        <div class="mui-media-body">
							        <p style="color:black; line-height: 18px;font-size: 15px;">${news.newsTitle }</p>
							        <p class='mui-ellipsis-2' style="line-height: 14px;font-size: 12px;">${news.newsAbstract }</p>
						        </div>
							</a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<script src="${pageContext.request.contextPath}/weixin/js/mui.min.js" charset="utf-8"></script>
		<script>
		var slider = mui("#slider");
		slider.slider({
					interval: 3000
				});
		      
			mui.init({
				swipeBack: true, //启用右滑关闭功能
				pullRefresh: {
					container: '#pullrefresh',
					/*down: {
						//contentrefresh : "正在刷新...",//可选，正在刷新状态时，下拉刷新控件上显示的标题内容
						callback: pulldownRefresh
					},*/
					up: {
						contentrefresh: '正在加载...',
						//contentnomore:'没有更多数据了',//可选，请求完毕若没有更多数据时显示的提醒内容；
						callback: pullupRefresh
					}
				}
			});
			
			page = 1;
			
			/**
			 * 下拉刷新具体业务实现
			 */
			function pulldownRefresh() {
			    //mui('#pullrefresh').pullRefresh().endPullDownToRefresh(false);
			   
				setTimeout(function() {
					var table = document.body.querySelector('.mui-table-view');
					var cells = document.body.querySelectorAll('.mui-table-view-cell');
					//table.innerHTML = "";
					mui.ajax('newsIndex.do?method=newsPullDown', {
                    type:'get',timeout:10000, success:function(data){
                       alert(data);
                       if (data=="[]")
                       {
                           mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); 
                           mui.toast("共更新了 0 条新闻 ");
                          return;
                       }
                      var map=eval("("+data+")");
                          mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
                          mui.toast("共更新了 "+map.sum+" 条新闻 ");
                       
                       var ret = map.list;
                       for (var i = 0; i < ret.length; i++) {
			                       var item = ret[i];
			                       var year = item.newsTime.year+1900;
			                       var date = item.newsTime.date;
			                       var month = item.newsTime.month+1;
			                       var time = year + '-' + month + '-' +date ;
						           var li = document.createElement('li');
						           li.className = 'mui-table-view-cell';
						           li.innerHTML = '<a class="mui-navigate-right" href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId='+item.newsId+'">'
						           		+'<img class=" mui-pull-left" src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/'+ item.newsImage +'">'
						           		+'<div class="mui-media-body">'
						           		+'<p style="color:black; line-height: 18px;font-size: 15px;">'+ item.newsTitle +'</p>'
						           		+' <p class="mui-ellipsis-2" style="line-height: 14px;font-size: 12px;">'+ item.newsAbstract +'</p>'
						           		+'</div>'
						           		+'</a>';
						           table.insertBefore(li, table.firstChild);
						           mui('#pullrefresh').pullRefresh().endPulldownToRefresh(); //refresh completed
					               //mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
					    }
                       },error:function(xhr,type,errorThrown){ 
	                       //alert("刷新出错了")
	                       //console.log(type);  
                       }});
					
					
				}, 1000);
				
			}
			var count = 1;
			var num=${pageCount};

			/**
			 * 上拉加载具体业务实现
			 */
			function pullupRefresh() {
				setTimeout(function() {
					page++;
					var table = document.body.querySelector('.mui-table-view');
					var cells = document.body.querySelectorAll('.mui-table-view-cell');
                    mui.ajax('newsIndex.do?method=newsPullUp&page='+page, {
                    data:{stringpage:count},type:'get',timeout:10000, success:function(data){
                       var map=eval("("+data+")");
                       var ret = map.list;
                       for (var i = 0; i < ret.length; i++) {
			                       var item = ret[i];
			                       //month+1 date year+1990  再拼接
			                       var year = item.newsTime.year+1990;
			                       var date = item.newsTime.date;
			                       var month = item.newsTime.month+1;
			                       var time = year + '-' + month + '-' +date ;
						           var li = document.createElement('li');
						           li.className = 'mui-table-view-cell';
						           li.innerHTML = '<a class="mui-navigate-right" href="${pageContext.request.contextPath }/newsIndex.do?method=findbyid&newsId='+item.newsId+'">'
						           		+'<img class="mui-media-object mui-pull-left" src="${pageContext.request.contextPath }/admin/back_WeixinProfile/news_image/shuijiao.jpg">'
						           		+'<div class="mui-media-body">'
						           		+item.newsTitle
						           		+'<p class="mui-ellipsis">'+ item.newsText +'</p>'
						           		+'<p class="mui-ellipsis">'+ time +'&nbsp;&nbsp;'+item.newsAuthor +'</p>'
						           		+'</div>'
						           		+'</a>';
						           table.appendChild(li);
					    }
					    mui('#pullrefresh').pullRefresh().endPullupToRefresh(page>=map.count); //参数为true代表没有更多数据了。              
                       },error:function(xhr,type,errorThrown){ 
                       
                       console.log(type);  
                       }});
                
					
				}, 1000);
			}
			mui('body').on('tap', 'a', function () {  
              //alert(222);
              var id = this.getAttribute('href');
              var href = this.href;
              if (this.className="mui-navigate-right")
              {
	              mui.openWindow({
	              url:this.href,
	              id:id
	              });
              }
              else if (this.className=="mui-action-back mui-icon mui-icon-left-nav mui-pull-left")
              {
                 
              }
          });
			
		</script>
	</body>
</html>	