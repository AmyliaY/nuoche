$.selectPicture = function(callback) {
    try {
        if ($("#file_picture").length == 0) {
            $("form").append('<input type="file" class="needsclick" id="file_picture" accept="image/jpeg" name="img[]" style="display:none" />');
        }
        $("#file_picture").trigger('click');
        if (callback) {
            $("#file_picture").unbind('change').change(function(event) {
                $("#selectedimg").before("<img src='images/loading.gif' id='loading' style='width:50px;height:50px'>"); // 首先加载
                var img = event.target.files[0];
                if (!img) {
                    return false;
                }
                // 判断图片格式  
                if (!(img.type.indexOf('image') == 0 && img.type && /\.(?:jpg|png|gif|jpeg)$/i.test(img.name))) {
                    alert('只能上传图片');
                    return;
                }
//                var loader = window.loading();
                var reader = new FileReader(); //读取图片数据
                reader.readAsDataURL(img);
                reader.onload = function(e) {
                    var data = e.target.result;
                    render(data);
                }

                function render(src) {
                    var p = src.indexOf("base64");
                    var mime_type = src.substring(5, p - 1);
                    var quality = 90;
                    var MAX_WIDTH = 550;
                    var image = new Image();
                    image.onload = function() {
                        var canvas = document.createElement("canvas");
                        if (image.width > MAX_WIDTH) {
                            // 宽度等比例缩放 *=  
                            image.height *= MAX_WIDTH / image.width;
                            image.width = MAX_WIDTH;
                        }
                        var ctx = canvas.getContext("2d");
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        canvas.width = image.width;
                        canvas.height = image.height;
                        if (typeof EXIF == 'undefined') {
                           $.getScript("/Public/Home/js/exif.js", function() {
                                rex();
                            });
                        } else {
                            rex();
                        }
                        function rex() {
                            EXIF.getData(image,
                                    function() {
                                        if (EXIF.getTag(this, 'Orientation') == 6) { //旋转
                                            canvas.width = image.height;
                                            canvas.height = image.width;
                                            ctx.rotate(90 * Math.PI / 180);
                                            ctx.drawImage(image, 0, 0, image.width, -image.height);
                                        } else {
                                            ctx.drawImage(image, 0, 0, image.width, image.height);
                                        }
                                        var newImageData = canvas.toDataURL(mime_type, quality / 100);
//                                        loader.close();
                                        callback(newImageData);
                                    });
                        }
                    };
                    image.src = src;
                }
            })
        }
    } catch (e) {
        alert(e);
    }
}