
$(function(){
    $(".pay p").css("width",parseInt($(".pay").width())-80+"px");
    $("footer a").click(function () {
        $(this).addClass("active");
        $(this).siblings("a").removeClass("active");
    });
    $(".title").click(function(){
        $(this).toggleClass("select");
        if($(this).hasClass("select")){
            $(this).siblings().children().children(".commodity").addClass("select");
            $(this).text("取消");
        }else{
            $(this).siblings().children().children(".commodity").removeClass("select");
            $(this).text("全选");
        }
        if($(".title").hasClass("select")||$(".commodity").hasClass("select")){
            $(".pay").css("display","block");
            $(".pay a span").text($(".main .product").length);
        }else{
            $(".pay").css("display","none");
        }
    });
    $(".commodity").click(function(){
        $(this).toggleClass("select");
        //$(this).parent().siblings(".title").toggleClass("select");
        if($(".main .commodity.select").length == '0'){
            $(".title").removeClass("select")
        }
        if($(".title").hasClass("select")||$(".commodity").hasClass("select")){
            $(".pay").css("display","block");
            $(".pay a span").text($(".main .commodity.select").length);
            for(var i= 0,p_total=0;i<$(".commodity.select").length;i++){
                var x=$(".commodity.select")[i];
                p_total+=$(x).children(".detail ").children(".price_num").children(".price").children("span").text()*$(x).children(".detail ").children(".price_num").children(".num").children("span").text()
            }
            $(".pay p span").text(parseFloat(p_total).toFixed(2));
        }else{
            $(".pay").css("display","none");
        }
    });
    $(".num button").click(function(event) {
        var elem = event.target;
        if ($(elem).text() == "+") {
            var snum = parseInt($(elem).prev().text());
            $(elem).prev().text(snum + 1);

            if (snum == 99) {
                $(elem).next().text(99);
                layer.msg('您一次可以购买的商品为1~99件',{
                    time:1000,
                    area:['80%','']
                })
            }
            for(var i= 0,p_total=0;i<$(".commodity.select").length;i++){
                var x=$(".commodity.select")[i];
                p_total+=$(x).children(".detail ").children(".price_num").children(".price").children("span").text()*$(x).children(".detail ").children(".price_num").children(".num").children("span").text()
            }
            $(".pay p span").text(parseFloat(p_total).toFixed(2));
        } else {
            var snum = parseInt($(elem).next().text());
            $(elem).next().text(snum - 1);
            if (snum == 1) {
                $(elem).next().text(1);
                layer.msg('您一次可以购买的商品为1~99件',{
                    time:1000,
                    area:['80%','']
                })
            }
            for(var i= 0,p_total=0;i<$(".commodity.select").length;i++){
                var x=$(".commodity.select")[i];
                p_total+=$(x).children(".detail ").children(".price_num").children(".price").children("span").text()*$(x).children(".detail ").children(".price_num").children(".num").children("span").text()
            }
            $(".pay p span").text(parseFloat(p_total).toFixed(2));
        }
        event.stopPropagation();
    });
    $(".edit").click(function(){
        if($(this).text()=="编辑"){
           $(this).text("取消");
            //$(".commodity").css({"transition":"all 0.5s ease"});
            $(".commodity").css("right","60px");
            $(".del").css("right","0");
        }else{
            $(this).text("编辑");
            //$(".commodity").css({"transition":"all 0.5s ease"});
            $(".commodity").css("right","0");
            $(".del").css("right","-60px");
        }
    });
    $(".del").click(function(){
        $(this).parents(".product").remove();
        for(var i= 0,p_total=0;i<$(".commodity.select").length;i++){
            var x=$(".commodity.select")[i];
            p_total+=$(x).children(".detail ").children(".price_num").children(".price").children("span").text()*$(x).children(".detail ").children(".price_num").children(".num").children("span").text()
        }
        $(".pay p span").text(parseFloat(p_total));
        if($(".main .product").length == 0){
            $(".main ").css("display","none");
            $(".empty").css("display","block");
        }
    });
});