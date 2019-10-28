// Exercise: Find the top navbar, using a query for the HTML element type. The navbar's type is `<nav>`.
document.getElementsByTagName('nav')[0];
// Exercise: Find the sidebar on the left by using its id.
document.getElementById('sidebar-right');
// Exercise: Find the 'Pages' and 'Groups' sections of the sidebar by using their class.
document.getElementsByClassName('pages')[0];
document.getElementsByClassName('groups')[0];
// Exercise: Find all of the comments on the page.
document.getElementsByClassName('comments');
// Exercise: Find the first comment on the page.
document.getElementsByClassName('comments')[0];
// Exercise: Find the last comment on the page.
let comments = document.getElementsByClassName('comments');
let lastCommentsIndex = comments.length - 1;
comments[lastCommentsIndex];
// Exercise: Find the fourth comment on the page. Make sure you grab the fourth *comment* rather than the fourth *block* of comments. You may need more than one line of code!
document.getElementsByClassName('post')[2];
// Exercise: Find one of the ads in the sidebar and hide them.
let advertisementForm = document.getElementsByClassName('small-2 columns')[0];
advertisementForm.style.visibility = 'hidden';
// Exercise: Set the visibility on the ad that you hid in the previous exercise to make it visible again.

// Exercise: Use `setAttribute` to change `src` attribute of one of the ads in the sidebar.

// Exercise: Find Sam's post and change its text to something incredible.

// Exercise: Find the first post and add the `.post-liked` class to it.

// Exercise: Find the second post and remove the `.post-liked` class.
