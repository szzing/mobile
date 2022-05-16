const header = document.querySelector("header");
const toggleBtn = document.querySelector(".menu_toggle");
const menubar = document.querySelector(".header_menubar");
const menuItem = document.querySelectorAll(".menu_item");

function toggleMenu() {
	toggleBtn.classList.toggle('clicked');
	menubar.classList.toggle('display');
	menuItem.forEach((item)=>{
		item.classList.toggle('display');
	})
	header.classList.toggle('ab_position');
}

toggleBtn.addEventListener("click", toggleMenu);