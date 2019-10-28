// your code, here
let eggs = { itemName: 'dozen eggs', quantity: 1 };
let milk = { itemName: 'gallon of milk', quantity: 1 };
let bread = { itemName: 'loaf of bread', quantity: 1 };

let shoppingCart = [eggs, milk, bread];

shoppingCart.forEach((item) => {
  console.log(item.quantity + " " + item.itemName);
});
