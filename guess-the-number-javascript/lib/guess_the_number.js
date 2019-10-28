// random number generator
ran_num = Math.floor((Math.random() * 10) + 1);

// Enter Name
let name = prompt("What is your name?");
alert(`Hi, ${name}!`);

// Guess a Random Number
let guess = prompt("Pick a number between 1 and 100");
alert(`Your number is ${guess}!`);

// Win/Lose
if (ran_num === guess){
  alert('Congrats! You guessed the correct number!');
} else{
  alert('Sorry, incorrect guess!');
};
