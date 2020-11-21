includeHTML(document.querySelector('#footer'), 'footer.html');
includeHTML(document.querySelector('#header'), 'header.html');



function includeHTML(divContainer, urlHTML) {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
    if (this.readyState == 4) {
        if (this.status == 200) { divContainer.innerHTML = this.responseText; }
        if (this.status == 404) { divContainer.innerHTML = "올바르지 않은 페이지 경로입니다."; }
    }
}
xhttp.open("GET", urlHTML, true);
xhttp.send();
}