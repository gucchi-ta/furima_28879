function price() {
  const item_price = document.getElementById("item-price")
  const add_tax_price = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  item_price.addEventListener('keyup', () => {
    let tax_value = item_price.value / 10;
    tax_value = parseInt(tax_value);          //小数点以下を切り捨て
    add_tax_price.innerHTML = tax_value;      //innerHTML関数を使い計算結果を出力
    let profit_value = item_price.value - tax_value;
    profit.innerHTML = profit_value;
  });
}
window.addEventListener("load", price);