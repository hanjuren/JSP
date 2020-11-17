
const page = document.getElementById("page").getAttribute('name');
//const page = document.querySelector("#jeans");
function pagechange(){
    location.href=`${page}.html`;
    return;
}