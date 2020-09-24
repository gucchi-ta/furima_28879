const { htmlPrefilter } = require("jquery");

// window.addEventListener("load", (e) => {
function add_tag() {
  console.log("1");
  const newElement = document.getElementById("new-tag");
  const tagFormElement = document.getElementById("tag-form");
  const plusImageElement = document.getElementById("plus-image");
  
  const sellBtnElement = document.getElementsByClassName("sell-btn");
  
  console.log(newElement);
  console.log("2");
  if (plusImageElement.getAttribute("data-load") != null) {
    return null;
  }
  plusImageElement.setAttribute("data-load", "true");

  plusImageElement.addEventListener("click", (e) => {
    const HTML = `<textarea class="items-tag" id="items-tag" maxlength="20" name="item[tag][tag_name]"></textarea>
                  <img id="minus-image" src="/assets/minus_image.png" width="15" height="15">`
    console.log(HTML)
    if(HTML.value){}else{
      console.log("4");
      newElement.insertAdjacentHTML("beforeend", HTML);
    };
    const formData = new FormData(newElement);
    const tag = {
      tag_name: formData.get("tag_name")
    };
  });
  const minusImageElement = document.getElementById("minus-image");
  minusImageElement.addEventListener("click", (e) => {
    tagFormElement.remove();
  });
  // sellBtnElement.addEventListener("click", (e) => {
  // });

};
// });

setInterval(add_tag, 1000);

// console.log("3");
// const tag = `<textarea class="items-tag" id="item-tag" maxlength="20" name="item[tag][tag_name]"></textarea>
//               <img id="image-tag" src="/assets/minus_image.png" width="15" height="15">`
// console.log(tag)
// if(tag.value){}else{
//   console.log("4");
//   newElement.insertAdjacentHTML("beforeend", tag);
// };


// const formData = new FormData(document.getElementById("plus-image"));
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "tag", true);
//     XHR.responseType = "json";
//     XHR.onload = () => {
// };

    // const item = XHR.response.post;
    // const list = document.getElementById("list");
    // const formText = document.getElementById("content");