// タグの増減のためのjs(未完全)
require("jquery");

function addTagFunction() {
  
  // 要素の取得
  const newTagElement = document.getElementById("new-tag");
  let tagFormElements = document.getElementsByClassName("tag-form");
  const plusImageElement = document.getElementById("plus-image");
  let itemTagElements = document.getElementsByClassName("item-tag");
  const sellBtnElement = document.getElementsByClassName("sell-btn");
  let minusImageElements = document.getElementsByClassName("minus-image");
  // /要素の取得

  // -ボタンクリック時
  let num = minusImageElements.length-1
  console.log(num);

  if(num > 0){
    minusImageElements[num].addEventListener("click", (e) => {
      tagFormElements[num].remove();
      num = minusImageElements.length-1
      console.log(num);
    });
  }
  // /-ボタンクリック時


  // +ボタンクリック時に呼び出したaddTagFunction();の+ボタンクリックイベントが重複して実行されないように
  if (plusImageElement.getAttribute("data-load") != null) {
    return null;
  }
  plusImageElement.setAttribute("data-load", "true");
  // +ボタンクリック時に呼び出したaddTagFunction();の+ボタンクリックイベントが重複して実行されないように


  // +ボタンクリック時
  plusImageElement.addEventListener("click", (e) => {
    // 追加するフォームのHTML定義
    const HTML = `<div id="tag-form" class="tag-form"> 
                    <textarea class="item-tag" id="item-tag" maxlength="20" name="item[tag][tag_name]"></textarea>
                    <img id="minus-image" class="minus-image mouseon_cursor" src="/assets/minus_image-6d029aef624144816d94d6cd1c062954a4c90c78a499b4d9694cfb63b48ec0aa.png" width="15" height="15">
                  </div>`
    // フォームの追加
    newTagElement.insertAdjacentHTML("beforeend", HTML);

    // 追加した要素を取得, -ボタンイベントを再読み込みのため
    addTagFunction();
    // /追加した要素を取得, -ボタンイベントを再読み込みのため
  });
  // /+ボタンクリック時

};

window.addEventListener("load", addTagFunction);