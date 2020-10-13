// タグの増減のためのjs(未完全)
const { htmlPrefilter } = require("jquery");

window.addEventListener("load", (e) => {
  const newElement = document.getElementById("new-tag");
  let tagFormElements = document.getElementsByClassName("tag-form");
  const plusImageElement = document.getElementById("plus-image");
  const itemTagElement = document.getElementById("item-tag");
  const sellBtnElement = document.getElementsByClassName("sell-btn");
  let minusImageElements = document.getElementsByClassName("minus-image");
  
  console.log(tagFormElements);

  plusImageElement.addEventListener("click", (e) => {
    const HTML = `<div id="tag-form" class="tag-form"> 
                    <textarea class="item-tag" id="item-tag" maxlength="20" name="item[tag][tag_name]"></textarea>
                    <img id="minus-image" class="minus-image mouseon_cursor" src="/assets/minus_image-6d029aef624144816d94d6cd1c062954a4c90c78a499b4d9694cfb63b48ec0aa.png" width="15" height="15">
                  </div>`
    console.log(HTML)
    // if(HTML.value){}else{
      console.log("4");
      newElement.insertAdjacentHTML("beforeend", HTML);
    // };
    console.log(itemTagElement);
    const formData = itemTagElement.value;
    console.log(formData);
    minusImageElements = document.getElementsByClassName("minus-image");
    tagFormElements = document.getElementsByClassName("tag-form");
    console.log(tagFormElements);
  });
  for(var i=0; i < minusImageElements.length; i++){
    minusImageElements[i].addEventListener("click", (e) => {
      console.log(minusImageElements[i]);
      console.log(tagFormElements[i])
      tagFormElements[i].remove();
      console.log(tagFormElements)
    });
  }
});