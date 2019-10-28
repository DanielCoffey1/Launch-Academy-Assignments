let data = require('./data');

// your code, here

// How many repositories does LaunchAcademy own?
let launchRepositories = data.length;
console.log(`Launch Academy owns ${launchRepositories} repositories.`);

// Which repository has the largest size?
let capacity = data.map((item) => {
  return item.size;
});

let nameRepo = data.map((item) => {
  return item.name;
});


// function findMatch(capacity, nameRepo) {
// let ary = new Array();
// for(i = 0; i < nameRepo.length; i++)
// {
//   for(z = 0; z < capacity.length; z++)
//   {
//     if(nameRepo[i] == capacity[z])
//     {
//       ary.push(i);
//     }
//   }
//
// }
// return ary;
// }

capacity.sort(function(a, b) {return b - a})
console.log(`${nameRepo[17]} has the largest size at ${capacity[0]}`)



let youngest = data.map((young) => {
  return `${young.name} created on: ${young.created_at}`;
});

let reversed = youngest.reverse();
console.log(`The most recently created repository is ${reversed[0]}`);

// Use the .map function to create an array of repository descriptions.
// The result of the .map function should be an array of strings that look like this:

let bio = data.map((bio) => {
  return bio.description;
});

console.log(bio);
