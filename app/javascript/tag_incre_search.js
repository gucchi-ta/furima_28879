// タグのインクリメンタルサーチのjs
function tagSearchFunction() {
  const inputElement = document.getElementById("item-tag");
    inputElement.addEventListener("keyup", (e) => {
      const input = document.getElementById("item-tag").value;
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `incre_search/?input=${input}`, true);
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = () => {
        const tagName = xhr.response.incre_keyword;
        console.log(tagName)
        const searchResult = document.getElementById('search-result')
        searchResult.innerHTML = ''
        tagName.forEach(function(tag){

          const parentsElement = document.createElement('div')
          const childElement = document.createElement('div')

          parentsElement.setAttribute('id', 'tag_parents')
          parentsElement.setAttribute('class', 'tag_parents')
          childElement.setAttribute('id', tag.id )
          childElement.setAttribute('class', 'tag_child' )

          parentsElement.appendChild(childElement)
          childElement.innerHTML = tag.tag_name
          searchResult.appendChild(parentsElement)

          const clickElement = document.getElementById(tag.id)
          clickElement.addEventListener("click", () => {
            document.getElementById("item-tag").value = clickElement.textContent;
            clickElement.remove();
          });
        });
      };
    });
  };

  window.addEventListener("load", tagSearchFunction);