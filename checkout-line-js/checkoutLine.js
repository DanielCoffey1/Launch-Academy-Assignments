let eggs = {
  itemName: 'dozen eggs',
  quantity: 2,
  price: 0.99
};

let milk = {
  itemName: 'gallon of milk',
  quantity: 1,
  price: 2.99
};

let bread = {
  itemName: 'loaf of bread',
  quantity: 1,
  price: 3.50
};

let coffee = {
  itemName: 'lbs. of coffee',
  quantity: 10,
  price: 8.99
};

let shoppingCart = [eggs, milk, bread, coffee];

// your code, here

// if we know the index of the array:
console.log('One pound of coffee is $' + shoppingCart[3].price + '.');
console.log('There are ' + shoppingCart[1].quantity + 'gallon(s) of milk in the shopping cart.');

// if we only know the name of the product we are looking for...
coffee = shoppingCart.find((item) => item.itemName === 'lbs. of coffee');
milk = shoppingCart.find((item) => item.itemName === 'gallon of milk');
console.log('One pound of coffee is $' + coffee.price +'.');
console.log('There are '+ milk.quantity + ' gallon(s) of milk in the shopping cart.');

// Total including tax
const TAX_RATE = 6.25;
let subTotal = 0;
shoppingCart.forEach((item) => {
  subTotal += item.price * item.quantity;
});
console.log('subtotal: $' + subTotal);
console.log('total: $' + (subTotal  (1 + (TAX_RATE / 100))) );
