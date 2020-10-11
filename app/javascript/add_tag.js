// タグの増減のためのjs(未完全)
const { htmlPrefilter } = require("jquery");

window.addEventListener("load", (e) => {
  const newElement = document.getElementById("new-tag");
  const tagFormElement = document.getElementById("tag-form");
  const plusImageElement = document.getElementById("plus-image");
  
  const sellBtnElement = document.getElementsByClassName("sell-btn");
  
  console.log(newElement);

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
});