// Meets Expectations
let bestieGroceryItems = [new GroceryItem("apple", .50, 5), new GroceryItem("avocado", 2.00, 2), new GroceryItem("beer", 2.50, 4), new GroceryItem("kale", 2.00) ]

 let summary = (groceryItem) => {
   let output = '';
   let sentence = '';
   let total = 0;
   let newTotal = '';
   output += 'Dear Bestie,\n\n';
   output += 'I bought you:\n\n';
   bestieGroceryItems.forEach((item) => {
     sentence += `${item.quantity}  ${item.name} - $${item.price.toFixed(2)}\n`;
     itemTotal = item.quantity * item.price;
     total += itemTotal;
     newTotal = `\nYou owe me: $${total.toFixed(2)}.`;
   });
   output += sentence + newTotal;
   return output;
 };
console.log(summary(bestieGroceryItems));
// Exceeds Expectations
let inventoryNearMe = {
  banana: 2,
  coffee: 2,
  kale: 5,
  chocolateBar: 5,
  apple: 10,
  potato: 11,
  tomato: 1,
  beer: 3,
  avocado: 1,
  milk: 5
};

let inventoryNearBestie = {
  banana: 2,
  coffee: 2,
  kale: 5,
  chocolateBar: 5,
  apple: 10,
  potato: 11,
  tomato: 1,
  beer: 6,
  avocado: 10,
  milk: 5
};
