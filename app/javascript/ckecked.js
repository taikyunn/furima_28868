function check (){
  const stars = document.querySelectorAll(".star");
  stars.forEach(function(star){
    star.addEventListener("click",() => {});
    const itemId = star.getAttribute("item-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/${itemId}`, true);
    XHR.responseType = "json";
    XHR.send();
  });
}
window.addEventListener("load", check);