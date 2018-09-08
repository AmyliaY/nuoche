
$(function () {

   //2毫秒之后显示支付宝服务窗标题
//  var AlipayJSBridgeIntervalValue = setTimeout(function () {
//      if (typeof (AlipayJSBridge) != 'undefined') {
//          clearTimeout(AlipayJSBridgeIntervalValue);
//          AlipayJSBridge.call("showTitlebar");
//          AlipayJSBridge.call("setTitle", {
//              title: document.title
//          });
//      }
//  }, 100);

    //自动填充车牌数组
    $('#car_name').autocomplete(data, 
    {
        max: 10, //列表里的条目数                 
        minChars: 1, //自动完成激活之前填入的最小字符                  
        width: 120, //提示的宽度，溢出隐藏                 
        scrollHeight: 180, //提示的高度，溢出显示滚动条     
        matchCase: false, //比较是否开启大小写敏感开关             
        matchContains: true, //包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示                  
        autoFill: false, //自动填充                  //匹配的项所要发生的事件                 
        formatItem: function (row, i, max) 
        {
           //row表示每一行的数据对象，i表示每一行的编号 max表示总的数据行数                     
            return row.value + "[" + row.name + "]";
        }
    }).result(function (event, row, formatted) {
        $('#car_name').val(row.value);
    });

    //车牌栏位有输入时触发的事件
    $("#car_name").keydown(function () {   
        if (event.keyCode >= 65 && event.keyCode <= 90) {
            var txt = "";
            switch (event.keyCode) {
                case 65:
                    txt = "A";
                    break;
                case 66:
                    txt = "B";
                    break;
                case 67:
                    txt = "C";
                    break;
                case 68:
                    txt = "D";
                    break;
                case 69:
                    txt = "E";
                    break;
                case 70:
                    txt = "F";
                    break;
                case 71:
                    txt = "G";
                    break;
                case 72:
                    txt = "H";
                    break;
                case 73:
                    txt = "I";
                    break;
                case 74:
                    txt = "J";
                    break;
                case 75:
                    txt = "K";
                    break;
                case 76:
                    txt = "L";
                    break;
                case 77:
                    txt = "M";
                    break;
                case 78:
                    txt = "N";
                    break;
                case 79:
                    txt = "O";
                    break;
                case 80:
                    txt = "P";
                    break;
                case 81:
                    txt = "Q";
                    break;
                case 82:
                    txt = "R";
                    break;
                case 83:
                    txt = "S";
                    break;
                case 84:
                    txt = "T";
                    break;
                case 85:
                    txt = "U";
                    break;
                case 86:
                    txt = "V";
                    break;
                case 87:
                    txt = "W";
                    break;
                case 88:
                    txt = "X";
                    break;
                case 89:
                    txt = "Y";
                    break;
                case 90:
                    txt = "Z";
                    break;

            }
            $('#car_name').val($('#car_name').val() + txt);
            window.event.keyCode = 0;
            event.returnValue = false;
        }
    });  
});
