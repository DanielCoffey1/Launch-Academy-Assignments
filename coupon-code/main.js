//click here
let hideCouponCode = document.getElementsByClassName('important-message')[0];
hideCouponCode.style.visibility = 'visible';

//coupon code
let theCode = document.getElementById('coupon-code');
theCode.style.visibility = 'hidden';

hideCouponCode.addEventListener('click', () => {
  let theCode = document.getElementById('coupon-code');
  theCode.style.visibility = 'visible';
  hideCouponCode.style.visibility = 'hidden';
});
