window.addEventListener('load', () => {
  console.log("OK");
  const addTaxDom = document.getElementById("add-tax-price");
  

  const priceContent = document.getElementById("profit");
  

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    

  
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    priceContent.innerHTML = Math.floor(inputValue * 0.9)

  })
});

