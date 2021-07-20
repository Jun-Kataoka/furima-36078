window.addEventListener("load", () => {
  const price_input = document.getElementById("item-price");
  price_input.addEventListener("input", () => {
    const value = price_input.value;
    document.getElementById("add-tax-price").textContent = Math.floor( value * 0.1);
    document.getElementById("profit").textContent = Math.ceil( value * 0.9);
  });
});