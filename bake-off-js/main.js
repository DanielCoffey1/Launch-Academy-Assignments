// YOUR CODE HERE
let bakers = [
  "Chetna",
  "Diana",
  "Iain",
  "Kate",
  "Luis",
  "Martha",
  "Nancy",
  "Norman",
  "Richard"
];

let signatureBakes = [
  ["Cardamom, Pistachio and Coffee Swiss Roll", "Fenugreek and Carom Crackers", "Onion and Pine Nut Rolls	"],
  ["Mum's Sunday Tea Lemon Curd Swiss Roll", "Parmesan Triangles", "Rustic Picnic Rolls"],
  ["Raspberry and Lemon Swiss Roll", "Za'atar and Fig Biscuits", "Cranberry and Walnut Rye Bread Rolls"],
  ["Apricot and Basil Swiss Roll", "Parmesan and Apple Biscuits", "Orange and Cardamom Rye Bread Knot"],
  ["Red Velvet and White Chocolate Swiss Roll", "Black Olive and Rosemary Biscuits", "Opposites Attract Rolls"],
  ["Spanish Swiss Roll", "Caramelised Onion and Goat's Cheese Sandwich Biscuits", "Date and Walnut Rye Rolls"],
  ["Tiramisu Swiss Roll", "	Fennel and Rye Thins", "Cider and Walnut Crusty Rolls"],
  ["Coffee and Hazelnut Swiss Roll", "Farthing Biscuits", "Rye Bread Rolls"],
  ["Pistachio and Strawberry Swiss Roll", "Rosemary Seeded Crackers", "Rye and Cranberry Rolls"]
];

// 1. The winner of week 2 baked Rosemary Seeded Crackers. Who was the winner? Create a function called `theBaker` that takes the name of a bake as an argument and returns the name of the person who baked it.

let theBaker = (bake) => {
  let index = 0;
  console.log(`The bake: ${bake}`);
  signatureBakes.forEach((bakersBakes) =>{
    if(bakersBakes.includes(bake)){
      console.log(`The index of the array that contains the bake:
        ${signatureBakes.indexOf(bakersBakes)}`);
        index = signatureBakes.indexOf(bakersBakes);
    }
  });
  return bakers[index];
};

console.log(theBaker("Rosemary Seeded Crackers"));
console.log(theBaker("Opposites Attract Rolls"));


//2. What did Nancy bake in week 1 What about Richard in week 3? Create a function called `nameThatBake` that takes 2 arguments, the first argument being the number of the week of the bake, and the second argument being the name of the baker.

let nameThatBake = (week, name) => {
  index = bakers.indexOf(name);
  arrayOfBakes = signatureBakes.indexOf(bakersBakes);
    return arrayOfBakes[week - 1];
};

console.log(nameThatBake(1, "Nancy"));
console.log(nameThatBake(3, "Richard"));


// 3. What did everyone bake in week 1? What about week 3? Please give me each name and what they baked in a sentence like so:
// Bobby baked a Persimmon Swiss Roll.

// Create a function called `weekBakes` that takes 1 argument, the week number of the contest.

let weekBakes = (weekNumber) => {
  let output = '';
  let bakerIndex = 0;
  signatureBakes.forEach((arrayOfBakes) => {
    output += `${bakers[bakerIndex]} baked a`;
    output += arrayOfBakes[weekNumber - 1];
    output += '\n';
    bakerIndex += 1;
  });
  return output;
};
console.log(weekBakes(1));
console.log(weekBakes(3));


// 4. How many bakes include the word Lemon in the title. What are their names and who baked them? What about bakes with Rosemary in the title? Remember it's possible it could be lower cased in the title.  Create a function called `bakesWith` that takes 1 argument, the word you want to check for in the titles of the bakes.

let bakesWith = (ingredient) => {
  let count = 0
  let index = 0
  let output = ''
  let sentences = ''
  signatureBakes.forEach((arrayOfBakes) => {
    arrayOfBakes.forEach((bake) => {
    if(bake.includes(ingredient)){
      count += 1
      nameOfBakes += `${bake} \n`
      whoBaked += `${bakers[index]} \n`
      sentences += `${count}. ${bakers[index]} baked the ${bake}\n`
    }
    })
    index += 1
  })
  output += `There are ${count} bakes with ${ingredient} in the title. \n`
  output += sentences
  return output
}
// Output should be formatted like so:
// There are 700 bakes with the word Lemon in the title.
// 1. Bobby baked the Lemon Tart with Hot Sauce
// 2. Madison baked the Lemon Toffee Pudding.
// etc etc etc

console.log(bakesWith("Lemon"));
console.log(bakesWith("Rosemary"));

// 5a. Is there a contestant named Martha? What about a contestant named Tony? Create a function called `doTheyExist` that tells me if they were in the contest or not. Format of the output should be:

// Yes Bobby was a contestant

// or

// No Bobby was not a contest

console.log(doTheyExist("Martha"));
console.log(doTheyExist("Tony"));

// 5b.  If Martha and Tony do exist what did they bake in week 3? For this question you'll want to update your nameThatBake function so that in the event that we give it a name that is not in the list of bakers your output should tell us that they are not in the program and that they baked nothing.
console.log(nameThatBake(3, "Martha"));
console.log(nameThatBake(2, "Tony"));

//6. Add your name to the bakers array and add an array of 3 bakes to the signatureBakes array. You'll need to create a `addABaker` function which should take 2 arguments, a name and an array with 3 bakes.

console.log(addABaker("Tony", ["Awesome Cake", "Snappy Biscuits", "Cheesy Bread"]));

 // 7. Create a function called `printBakeSummary` that returns each baker with their bakes listed below. The function should take 2 arguments, the first the array of bakers, the second the nested array of bakes. The output should be formatted like so:
// Bobby
// Week 1: Lemon Swiss Roll with Hot Sauce
// Week 2: Lemon Crackers
// Week 3. Lemon Bread with Blue Cheese
// Susan
// Week 1: Hot Dog Swiss Roll
// etc etc etc


console.log(printBakeSummary(bakers, signatureBakes));
