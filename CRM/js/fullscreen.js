var selector = "#fullscreeBtn";
window.isflsgrn = false;//ie11以下是否进入全屏标志，true为全屏状态，false为非全屏状态  ie11以下浏览器不支持
window.ieIsfSceen = false;//ie11是否进入全屏标志，true为全屏状态，false为非全屏状态
//跨浏览器返回当前 document 是否进入了可以请求全屏模式的状态
function fullscreenEnable() {
    var isFullscreen = document.fullscreenEnabled || window.fullScreen || document.mozFullscreenEnabled || document.webkitIsFullScreen;
    return isFullscreen;
}
//全屏
var fScreen = function () {
    var ele = document.documentElement;
    if (ele.requestFullscreen) {
        ele.requestFullscreen();
    }
    else if (ele.msRequestFullscreen) {
        ele.msRequestFullscreen();
        ieIsfSceen = true;
    }
    else if (ele.mozRequestFullScreen) {
        ele.mozRequestFullScreen();
    }
    else if (ele.webkitRequestFullScreen) {
        ele.webkitRequestFullScreen();
    } else {    //对不支持全屏API浏览器的处理，隐藏不需要显示的元素
        console.log("不支持全屏");
        //window.parent.hideTopBottom();
        //isflsgrn = true;
        //$(selector).text("退出全屏");
    }
}
//退出全屏
var cfScreen = function () {
    if (document.exitFullscreen) {
        document.exitFullscreen();
    }
    else if (document.msExitFullscreen) {
        document.msExitFullscreen();
    }
    else if (document.mozCancelFullScreen) {
        document.mozCancelFullScreen();
    }
    else if (document.webkitCancelFullScreen) {
        document.webkitCancelFullScreen();
    } else {
        //window.parent.showTopBottom();
        //isflsgrn = false;
        //$(selector).text("开启全屏");
    }
}
//全屏按钮点击事件
$(function () {
    $(selector).click(function () {
        var isfScreen = fullscreenEnable();
        if (!isfScreen && isflsgrn == false) {
            if (ieIsfSceen == true) {
                document.msExitFullscreen();
                ieIsfSceen = false;
                return;
            }
            fScreen();
        } else {
            cfScreen();
        }
    })
})
//键盘操作
$(document).keydown(function (event) {
    if (event.keyCode == 27 && ieIsfSceen == true) {
        ieIsfSceen = false;
    }
});

// 文本变化
function textChange() {
    if ($(selector).text() == "开启全屏") {
        $(selector).text("退出全屏");
    } else {
        $(selector).text("开启全屏");
    }
}

//监听状态变化
if (window.addEventListener) {
    document.addEventListener('fullscreenchange', textChange);
    document.addEventListener('webkitfullscreenchange', textChange);
    document.addEventListener('mozfullscreenchange', textChange);
    document.addEventListener('MSFullscreenChange', textChange);
}