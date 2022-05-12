const images = [
    '../css/images/main/background-g8d3776f9d_1920.jpg',//0
    '../css/images/main/ipad-gff0809074_1920.jpg', //1
    '../css/images/main/bridge-gc5120ea7e_1920.jpg', //2
    '../css/images/main/cellular-ge0e0f0c83_1920.jpg', //3
    '../css/images/main/iphone-gbf62143ae_1920.jpg', //4
    '../css/images/main/office-gc41961f9b_1920.jpg', //5
];

const chosenImage = images[Math.floor(Math.random() * images.length)];
const intro_img = document.createElement("img");
intro_img.src = `${chosenImage}`;
document.querySelector(".intro_background").appendChild(intro_img);

function nextimg() {
    intro_img.src = images[Math.floor(Math.random() * images.length)];
}

function zoomIn() {
    intro_img.style.transform = "scale(1.1)";
    intro_img.style.transition = "all 2s";
}

function zoomOut() {
    intro_img.style.transform = "scale(1)";
    intro_img.style.transition = "all 2s";
}

let nextimgbtn = document.getElementById("imgNextBtn");
let backimgbtn = document.getElementById("imgBackBtn");

nextimgbtn.addEventListener("click", nextimg);
nextimgbtn.addEventListener("mouseover", zoomIn);
nextimgbtn.addEventListener("mouseleave", zoomOut);

// top 버튼
let topbtn = document.getElementById("topbtn");

window.addEventListener("scroll", function () {
    if(this.scrollY>300) {
        topbtn.classList.remove("off");
    } else {
        topbtn.classList.add("off");
    }
})

topbtn.addEventListener("click", ()=>{
    window.scrollTo({top:0, behavior:"smooth"});
})