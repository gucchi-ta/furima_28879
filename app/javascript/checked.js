// 旧お気に入り機能のjs
function check() {
  const good = document.getElementById("good-btn");
  if (good.getAttribute("data-load") != null) {
    return null;
  }
  good.setAttribute("data-load", "true");
  good.addEventListener("click", () => { 
    const itemId = good.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    XHR.open("GET", `/items/${itemId}/checked`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;          
      }
      const item = XHR.response.item;
      if (item.checked === true) {
        good.setAttribute("data-check", "true");
      } else if (item.checked === false) {
        good.removeAttribute("data-check");
      }
    };
  });
};
setInterval(check, 1000);