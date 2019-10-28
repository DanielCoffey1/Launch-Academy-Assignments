// your code, here
dishes = ['Chicken Pot Pie', 'Baked Beans', 'Macaroni and Cheese', 'Burgundy Sauce with Beef and Noodles', 'Creamed Spinach', 'Pumpkin Pie', 'Strawberry Shortcake'];

dishes.forEach((dish) => {
  let foodItemDiv = document.createElement('div');
  foodItemDiv.className = 'food-item';
  foodItemDiv.innerHTML = dish;
  let mainDiv = document.getElementById('main');
  mainDiv.appendChild(foodItemDiv);
  foodItemDiv.addEventListener("click", function(){foodItemDiv.className += ' hidden'})
});
