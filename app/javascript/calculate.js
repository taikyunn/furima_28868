function calculate(){
  const price = document.getElementById("item-price");

  const value_content =  document.getElementById("add-tax-price");
  const price_content = document.getElementById("profit");
  price.addEventListener('keyup',() => {
    
    const value = price.value;
    const tax = value * 0.1
    const profit = value - tax

      value_content.innerHTML = tax;
      price_content.innerHTML = profit;
  });
}
window.addEventListener("load", calculate); 