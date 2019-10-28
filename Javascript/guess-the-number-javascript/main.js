// generate a random number between 1-10
let randomNum = Math.floor(Math.random() * 11);
// get the user's name
let userName = prompt('What is your name?');
console.log(userName);

// ask the user to enter a number
let userNumber = prompt('Pick a number between 1 and 10');
console.log(userNumber);

// if the number equals the random number let the user know that they've won, otherwise let them know that they lost
if (randomNum == userNumber) {
  alert('Congrats! You guessed the right number!')
} else {
  alert('Sorry! Wrong number!')
}
