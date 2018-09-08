
//版本 1.0
//作者：聂未

; (function ($, window, document, undefined) {
    $.fn.extend({
        select: function (options) {

            //默认参数
            var defaults = {
                width: "180px",            //生成的select框宽度
                listMaxHeight:"200px",     //生成的下拉列表最大高度
                themeColor: "#00bb9c",    //主题颜色
                fontColor: "#000",        //字体颜色
                fontFamily: "'Helvetica Neue', arial, sans-serif",    //字体种类
                fontSize:"15px",           //字体大小
                showSearch: false,        //是否启用搜索框
                rowColor:"#fff",          //行原本的颜色
                rowHoverColor: "#0faf03", //移动选择时，每一行的hover底色
                fontHoverColor: "#fff",   //移动选择时，每一行的字体hover颜色
                mainContent: "请选择",    //选择显示框的默认文字
                searchContent: "关键词搜索"   //搜索框的默认提示文字  
            }

            //将默认的参数对象和传进来的参数对象合并在一起
            var opts = $.extend(defaults, options); 

            //重新为原select标签对象命名
            var $this = this;

            //隐藏原select标签，并且在其后添加需要的html元素
            $this.hide();
            $this.after('\
                    <div class="select_container_nw" val="" text="">\
                        <div class="select_main">\
                           <span class="select_content">'+ opts.mainContent + '</span>\
                           <span class="select_arrow"></span>\
                           <span class="select_arrow_after"></span>\
                        </div>\
                        <div class="select_list">\
                            <div class="select_list_search">\
                            <input type="text" class="select_input" placeholder='+ opts.searchContent + ' />\
                            <svg class="search_svg" width="22" height="22" viewBox="0 0 200 200" version="1.1" xmlns="http://www.w3.org/2000/svg"\
                               xmlns:xlink="http://www.w3.org/1999/xlink"><g transform="scale(0.1953125, 0.1953125)">\
                               <path d="M715.703788 754.23602c-22.547452 18.063401-45.349718 32.368198-69.705427 44.00933-17.520761 8.374738-35.504075\
                                    15.855106-54.439105 20.553105-14.930664 3.704368-29.856211 7.644097-44.994615 10.252505-28.379519 4.889357-57.061949\
                                    6.077416-85.766892 3.565199-34.438769-3.01466-68.045555-10.180873-100.341431-22.661116-24.903202-9.623171-48.467862-21.898753-70.814738-36.633339-22.860597-15.0733-43.481082-32.716122-62.373131-52.397371-19.4334-20.24509-36.064871-42.643216-50.208579-66.922179-13.388477-22.982434-24.565496-46.985104-32.096323-72.447009-5.006224-16.924461-9.134415-34.232662-11.956811-51.644217-2.846957-17.563004-4.351281-35.43607-5.054321-53.228295-0.721461-18.261922 0.397059-36.585243\
                                    3.715781-54.656831 2.440688-13.292748 4.178335-26.790156 7.740613-39.782052 4.483293-16.350386 9.949-32.492018 16.006204-48.334845 7.781547-20.35356\
                                    18.099976-39.582507 30.177543-57.69298 8.523475-12.781094 17.851303-25.107841 27.714342-36.889165 9.398439-11.226692 19.313669-22.194488 30.169356-31.981389\
                                    13.004721-11.722996 26.782071-22.731724 41.091562-32.821523 12.783678-9.014304 26.272443-17.326621 40.309723-24.191982 16.894471-8.262174 34.473563-15.286148\
                                    52.17955-21.670555 12.674179-4.570085 25.932691-7.730055 39.133895-10.576893 18.018108-3.885494 36.268517-6.754844 54.77988-6.683213 18.704776 0.072655\
                                    37.52212-0.553609 56.07851 1.27504 17.961824 1.77032 35.82643 5.561669 53.412686 9.801227 14.351448 3.459798 28.411242 8.397251 42.27353 13.55983\
                                    22.595549 8.41567 43.682682 19.865443 63.993092 32.908504 21.933442 14.084787 41.764926 30.621415 60.143253 48.988738 15.835305 15.826454 30.265551\
                                    32.884968 42.67366 51.508117 15.685896 23.541159 28.947477 48.380894 38.83917 74.992995 7.545153 20.298302 13.99737 40.930201 17.25162 62.297858 2.722109\
                                    17.873066 4.167078 35.976376 5.407377 54.030567 1.565724 22.789029-0.064471 45.551452-3.808906 68.032466-2.449898 14.712073-6.218893 29.229718-9.910113\
                                    43.704384-5.608977 21.995967-14.46504 42.821271-24.61564 63.035662-12.384571 24.660656-27.783929 47.442522-45.413165 68.658729-6.435843\
                                    7.745405-13.461135 15.014972-20.439353 22.288632-2.076375 2.164293-1.771417 3.368724 0.132012 5.263887 18.970847 18.886139 37.875175 37.838793\
                                    56.803041 56.767911 23.195232 23.197328 46.391487 46.394656 69.594906 69.583798 4.574371 4.572132 9.153858 9.139148 13.779396 13.659091 8.403743\
                                    8.213056 8.515288 19.907399 0.307005 28.498054-6.283364 6.576789-19.059878 7.962346-27.184247-0.197498-16.657054-16.730033-33.445097-33.329083-50.179926-49.980321-14.8928-14.818497-29.810161-29.611411-44.671237-44.460608-10.284659-10.276041-20.570341-20.554128-30.708661-30.974455C728.319637\
                                    768.056793 722.183635 761.206782 715.703788 754.23602zM171.576765 469.924719c-2.341423 162.585959 126.844127 315.934532 312.196195 319.830259\
                                    84.326017 1.772366 158.595581-26.428929 220.571652-83.712587 67.885913-62.746066 101.911248-141.241838 102.87729-233.781464\
                                    1.671129-160.143327-126.333476-315.024813-314.158979-317.868581-87.913879-1.331321-164.273122 29.759791-226.829432 91.557252C204.139735 307.288618\
                                    173.101555 382.593721 171.576765 469.924719z" fill='+opts.themeColor+'></path></g>\
                            </svg>\
                            </div>\
                                <div class="select_list_body">\
                                    <ul class="select_list_ul">\
                                        <li class="no_result">没 有 结 果</li>\
                                    </ul>\
                                </div>\
                            </div>\
                    </div>');

            //拿到新生成的对select替代的div
            var $This = $this.next();


            //灌入原select的数据
            $this.find("option").each(function (index, element) {
                var $li = $('<li val=' + $(element).val() + '>' + $(element).text() + '</li>');
                if ($(element).prop("selected")) {
                    $li.addClass("list_current");
                    $This.find(".select_content").text($(element).text());
                }
                $This.find(".no_result").before($li);
            });

            //传进来的参数操作
            if (opts.width.trim() != "" && opts.width.trim() != "180px")
                $This.css("width", opts.width.trim());
            if (opts.listMaxHeight.trim() != "" && opts.listMaxHeight.trim() != "200px")
                $This.find(".select_list_body").css("max-height", opts.listMaxHeight.trim());
            if (typeof (opts.showSearch) == "boolean" && !opts.showSearch)
                $This.find(".select_list_search").hide();
            if (opts.fontColor.trim() != "" && opts.fontColor.trim() != "15px") {
                $This.find(".select_content,.select_input,li").css("color", opts.fontColor.trim());
                $This.find("li").hover(function () {
                    $(this).css({ "color": opts.fontHoverColor.trim() });
                }, function () {
                    $(this).css({ "color": opts.fontColor.trim() });
                });
            }
            if (opts.fontFamily.trim() != "" && opts.fontFamily.trim() != "'Helvetica Neue', arial, sans-serif")
                $This.find(".select_content,.select_input,li").css("font-family", opts.fontFamily.trim());
            if (opts.rowHoverColor.trim() != "" && opts.rowHoverColor.trim() != "#0faf03") {
                $This.find("li").hover(function () {
                    $(this).css({ "background-color": opts.rowHoverColor.trim() });
                }, function () {
                    $(this).css({ "background-color": opts.rowColor.trim() });
                });
            }

            //获取此时列表的高度
            var list_height = $This.find(".select_list").height();

            //列表过滤函数
            function Search(self) {
                var isAllHide = true;
                $This.find(".select_list_ul li").not(".no_result").each(function (index, element) {
                    if ($(element).text().indexOf($(self).val()) == -1)
                        $(element).hide();
                    else if ($(element).hasClass("list_current"))
                        $(element).hide();
                    else {
                        isAllHide = false;
                        $(element).show();
                    }
                });

                if (isAllHide)
                    $This.find(".select_list_ul .no_result").show();
                else
                    $This.find(".select_list_ul .no_result").hide();

                $This.find(".select_list").css("height", "auto");
                list_height = $This.find(".select_list").height();
            }

            //动态调整搜索框的宽度
            $This.find(".select_input").css({ "width": $This.find(".select_main").width() - 41 });

            //为显示框添加点击出现下拉框事件
            $This.find(".select_arrow,.select_content,.select_arrow_after").click(function () {
                $This.find(".select_arrow,.select_arrow_after").toggleClass("cast_rotate");
                if ($This.find(".select_arrow_after").hasClass("cast_rotate"))
                    $This.find(".select_arrow_after").css("margin-top", "1px");
                else
                    $This.find(".select_arrow_after").css("margin-top", "-1px");

                if ($This.find(".select_list").hasClass("list_open")) {
                    $This.find(".select_list").removeClass("list_open").animate({ "height": "0px" }, 200, function () {
                        $This.find(".select_list").hide();
                    });
                }
                else
                    $This.find(".select_list").addClass("list_open").css({ "height": "0px" }).show().animate({ "height": list_height + "px" }, 200);
            });

            //动态调整显示框的宽度
            $This.find(".select_content").css({ "width": $This.width() - $This.find(".select_arrow").width() - 40 + "px" });

            //为每一行元素添加点击事件
            $This.find(".select_list_body").delegate("li", "click", function () {
                if ($(this).hasClass("no_result"))
                    return;
                $This.find(".select_list_body li").removeClass("list_current").show();
                $(this).addClass("list_current").hide();
                Search($This.find(".select_input"));
                $This.find(".select_content").text($(this).text());
                $This.attr({ "val": $(this).attr("val") == null ? '' : $(this).attr("val"), "text": $(this).text() });
                $this.val($(this).attr("val"));

                list_height = $This.find(".select_list").height();

                $This.find(".select_content").trigger("click");
            });

            //为搜索框添加keyup事件
            $This.find(".select_input").on("keyup", function () {
                Search(this);
            });

            //引用滚动插件
            $This.find(".select_list_body").mCustomScrollbar({
                theme: "minimal",
                advanced: { autoExpandHorizontalScroll: true }
            });
            $This.find(".select_list_body .mCSB_dragger_bar").css({ "background-color": "#00bb9c" });

            //传进来的参数操作，需要写在滚动插件调用之后
            if (opts.themeColor.trim() != "" && opts.themeColor.trim() != "#00bb9c") {
                $This.find(".select_main,.select_input,.select_list").css("border-color", opts.themeColor.trim());
                $This.find(".select_list_body .mCSB_dragger_bar").css({ "background-color": opts.themeColor.trim() });
                $This.find(".select_arrow").css("border-top-color", opts.themeColor.trim());
            }

            //返回原jquery对象,保持链式调用
            return $this;

            //////////////////////////////////////////////////////////代码内部
        }
    });
})(jQuery, window, document)
