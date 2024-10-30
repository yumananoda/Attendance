const retireCheck = document.getElementById("retireCheck");
const employed = document.getElementById("employed");
const retired = document.getElementById("retired");
const activeList = document.getElementById("empSelectLi");

window.addEventListener("DOMContentLoaded", () => {
    activeList.classList.add("active");
});

retireCheck.addEventListener("change", () => {
    if(retireCheck.checked) {
        retired.classList.add("selected");
        employed.classList.remove("selected");
    } else {
        employed.classList.add("selected");
        retired.classList.remove("selected");
    }
});