// your code, here
let batman = {
  firstName: 'Bruce',
  lastName: 'Wayne',
  hometown: 'Gotham',
  occupation: 'Batman',
  catchPhrase: 'Where is it?!?',
  name() {
    return this.firstName + " " + this.lastName
  }
}

console.log(batman)
console.log(batman.name())
