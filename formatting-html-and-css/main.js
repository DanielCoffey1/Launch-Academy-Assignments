// Your JavaScript here
let ingredients = [
  "1 1/2 pounds Brussels sprouts",
  "3 tablespoons good olive oil",
  "3/4 teaspoon kosher salt",
  "1/2 teaspoon freshly ground black pepper"
];

let directions = [
  "Preheat oven to 400 degrees F.",
  "Cut off the brown ends of the Brussels sprouts.",
  "Pull off any yellow outer leaves.",
  "Mix them in a bowl with the olive oil, salt and pepper.",
  "Pour them on a sheet pan and roast for 35 to 40 minutes.",
  "They should be until crisp on the outside and tender on the inside.",
  "Shake the pan from time to time to brown the sprouts evenly.",
  "Sprinkle with more kosher salt (I like these salty like French fries).",
  "Serve and enjoy!"
];

let ingredientsList = document.getElementsByTagName("div")[0];
let ingredientButton = document.getElementsByTagName("button")[0];
let ul = document.createElement("ul");
let ol = document.createElement("ol");
let li = document.createElement("li");


let listIngredient = () => {
  ingredientsList.appendChild(ul);
  ingredients.forEach(function(ingredient){
    ul.innerHTML += ` <li> ${ingredient} </li>`;
  });
  ingredientsList.classList.remove("recipe");
};

if (ingredientsList.classList.contains("recipe") === true) {
  ingredientButton.addEventListener("click", listIngredient);
}

let directionsList = document.getElementsByTagName("div")[1];
let directionButton = document.getElementsByTagName("button")[1];

let listDirection = () => {
  directionsList.appendChild(ol);
  directions.forEach(function(direction){
    ol.innerHTML += ` <li> ${direction} </li>`;
  });
  directionsList.classList.remove("instructions");
};

if (directionsList.classList.contains("instructions") === true) {
  directionButton.addEventListener("click", listDirection);
}
