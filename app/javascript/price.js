window.addEventListener("load",function(){
  const priceInput = document.getElementById("price1")
  const addTaxDom = document.getElementById("price2")
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value
    const domValue = addTaxDom.value
    const total = document.getElementById("total")
    total.innerHTML = Math.floor(domValue - inputValue)
  })
  addTaxDom.addEventListener("input", () => {
    const inputValue = priceInput.value
    const domValue = addTaxDom.value
    const total = document.getElementById("total")
    total.innerHTML = Math.floor(domValue - inputValue)
  })
})