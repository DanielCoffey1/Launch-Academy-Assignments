let length = prompt('How long is your driveway in feet?');
console.log(length);

let width = prompt('How wide is your driveway in feet?');
console.log(width);

let height = prompt('How many inches of snow is covering your driveway?');
console.log(height);

let cubicFeet = Math.round(length * width * (height/12));
console.log(cubicFeet);

let total = (cubicFeet) => {
  if (0 <= cubicFeet && cubicFeet < 50) {
    console.log('Quote Price: $20');
  } else if (50 >= cubicFeet && cubicFeet < 150) {
    console.log('Quote Price: $50');
  } else if (150 >= cubicFeet && cubicFeet < 300) {
    console.log('Quote Price: $100');
  } else {
    console.log('Quote Price: $150');
  }
};

console.log(`Cubic Feet: ${cubicFeet}`);
console.log(`Quote Price: ${total}`);
