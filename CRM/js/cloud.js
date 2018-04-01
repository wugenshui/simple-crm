// Cloud Float...
var $main = $cloud = mainwidth = null;
var offset1 = 450;
var offset2 = 0;

var offsetbg = 0;
$(document).ready(
    function () {
        $body = $("body");
        $body.append('<div id="mainBody"><div id="cloud1" class="cloud"></div><div id="cloud2" class="cloud"></div></div>');

        $main = $("#mainBody");
        $main.css("width", "100%");
        $main.css("height", "100%");
        $main.css("position", "absolute");
        $main.css("z-index", "-1");

        $cloud1 = $("#cloud1");
        setCloud($cloud1);
        $cloud2 = $("#cloud2");
        setCloud($cloud2);
        mainwidth = $main.outerWidth();
    }
);

function setCloud(ele) {
    ele.css("width", "100%");
    ele.css("height", "100%");
    ele.css("position", "absolute");
    ele.css("height", "100%");
    ele.css("top", "0");
    ele.css("left", "0");
    ele.css("z-index", "1");
    ele.css("opacity", "0.5");
    ele.css("background", "url(./image/login/cloud.png)  no-repeat");
}

/// 飘动
setInterval(function flutter() {
    if (offset1 >= mainwidth) {
        offset1 = -580;
    }

    if (offset2 >= mainwidth) {
        offset2 = -580;
    }

    offset1 += 1.1;
    offset2 += 1;
    $cloud1.css("background-position", offset1 + "px 100px")

    $cloud2.css("background-position", offset2 + "px 460px")
}, 70);


setInterval(function bg() {
    if (offsetbg >= mainwidth) {
        offsetbg = -580;
    }

    offsetbg += 0.9;
    $body.css("background-position", -offsetbg + "px 0")
}, 90);
