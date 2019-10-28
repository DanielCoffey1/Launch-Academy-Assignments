// your code, here
let addressForm = document.shippingAddressForm;
addressForm.addEventListener('submit', (event) => {
  event.preventDefault();
  let firstName = document.getElementById('first-name').value;
  let lastName = document.getElementById('last-name').value;
  let address = document.getElementById('address').value;
  let city = document.getElementById('city').value;
  let state = document.getElementById('state').value;
  let zipCode = document.getElementById('zip-code').value;
  let phoneNumber = document.getElementById('phone-number').value;
  let email = document.getElementById('email').value;
  let paragraph = document.createElement('p');
  let message = document.createTextNode(`Can't be blank`);

  let userInput = [firstName, lastName, address, city, state, zipCode, phoneNumber, email];
  console.log(userInput);

  userInput.forEach((input) => {
    if(input.length > 0) {
      console.log('Form is valid!');
    } else {
      paragraph.appendChild(message);
      console.log('form is NOT valid!');
    }
  });
});
