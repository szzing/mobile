// 색상옵션
function colorchoice(object) {
    let colorchip = document.getElementsByClassName("color_chip");

    for (let i = 1; i < colorchip.length + 1; i++) {
        document.getElementById("device_color" + i).style.border = "0px";
        document.getElementById("device_color" + i).style.opacity = "0.3";
    }
    object.style.border = "2px solid black";
    object.style.opacity = "1.0";
}

const basicSrc = "../css/images/product/detail/"

function imgchange1() {
    document.getElementById("phoneimage").src = basicSrc + "iphone13_midnight.jpg"
}
function imgchange2() {
    document.getElementById("phoneimage").src = basicSrc + "iphone13_pink.jpg"
}
function imgchange3() {
    document.getElementById("phoneimage").src = basicSrc + "iphone13_blue.jpg"
}
function imgchange4() {
    document.getElementById("phoneimage").src = basicSrc + "iphone13_starlight.jpg"
}
function imgchange5() {
    document.getElementById("phoneimage").src = basicSrc + "iphone13_red.jpg"
}

//옵션별 가격계산