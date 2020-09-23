window.addEventListener("load", (e) => {
  console.log("1");
  const imageTagElement = document.getElementById("image-tag");
  const newElement = document.getElementById("new-tag");
  console.log(newElement);
  console.log("2");
  imageTagElement.addEventListener("click", (e) => {
    console.log("3");
    const tag = `<textarea class="items-tag" id="item-tag" maxlength="20" name="tag_name[tag_name]"></textarea>`
    console.log(tag)
    if(tag.value){}else{
      console.log("4");
      newElement.insertAdjacentHTML("beforeend", tag);
    };
  });
});
