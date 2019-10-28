let inventory = [
  ['LA-LG-STICKER', 300, 'Large Sticker', 'images/la-large-sticker-256px.png', 'Show your Launch pride by plastering your laptop with these beautiful die-cut stickers.'],
  ['LA-SM-STICKER', 200, 'Small Sticker', 'images/la-small-sticker-128px.png', "It\'s a tiny Launch sticker. How cute!"],
  ['LA-T-SHIRT', 50, 'T-Shirt', 'images/la-t-shirt-200px.png', '100% Cotton. Makes a great gift.']
]

// your code, here
class Product {
  constructor(id, quantity, name, image, description) {
    this.id = id;
    this.quantity = quantity;
    this.name = name;
    this.image = image;
    this.description = description;
  }
  sell() {
    if (this.quantity > 0) {
      this.quantity -= 1;
    }
    return this.quantity;
  }

  toHTML() {
    let productDiv = document.createElement("div");

    let productId = document.createElement("h1");
    productId.innerHTML = `Product ID: ${this.id}`;
    productDiv.appendChild(productId);

    let productQuantity = document.createElement("h2");
    productQuantity.innerHTML = `Quantity: ${this.quantity}`;
    productDiv.appendChild(productQuantity);

    let productName = document.createElement("h3");
    productName.innerHTML = `Name: ${this.name}`;
    productDiv.appendChild(productName);

    let productImage = document.createElement("h4");
    productImage.innerHTML = `Image: ${this.image}`;
    productDiv.appendChild(productImage);

    let productDescription = document.createElement("h5");
    productDescription.innerHTML = `Description: ${this.description}`;
    productDiv.appendChild(productDescription);

    return productDiv;
  }
}

let products = [];

inventory.forEach(productData => {
  products.push(new Product(...productData));
});

let target = document.getElementById("all-products");

products.forEach((product) => {
  target.appendChild(product.toHTML());
});
