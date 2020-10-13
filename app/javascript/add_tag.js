// タグの増減のためのjs(未完全)
const { htmlPrefilter } = require("jquery");

window.addEventListener("load", (e) => {
  const newElement = document.getElementById("new-tag");
  const tagFormElement = document.getElementById("tag-form");
  const plusImageElement = document.getElementById("plus-image");
  const itemTagElement = document.getElementById("item-tag");
  const sellBtnElement = document.getElementsByClassName("sell-btn");
  
  console.log(newElement);

  plusImageElement.addEventListener("click", (e) => {
    const HTML = `<div id="tag-form"> 
                    <textarea class="items-tag" id="item-tag" maxlength="20" name="item[tag][tag_name]"></textarea>
                    <img id="minus-image" src="/assets/minus_image-6d029aef624144816d94d6cd1c062954a4c90c78a499b4d9694cfb63b48ec0aa.png" width="15" height="15">
                  </div>`
    console.log(HTML)
    if(HTML.value){}else{
      console.log("4");
      newElement.insertAdjacentHTML("beforeend", HTML);
    };
    console.log(itemTagElement)
    const formData = new FormData(itemTagElement);
    console.log(formData)
    const tag = {
      tag_name: formData.get("tag_name")
    };
  });
  const minusImageElement = document.getElementById("minus-image");
  minusImageElement.addEventListener("click", (e) => {
    tagFormElement.remove();
  });
});