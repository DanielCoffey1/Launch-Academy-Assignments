// Your code goes here!
let todos = [
  "Write some Javascript",
  "Submit System Check",
  "Take a Break"
];

let unorderedList = document.getElementById('todo-list');

todos.forEach(function(todo) {
  unorderedList.innerHTML += \&lt;li\&gt;<span class="hljs-subst">${todo}</span>\&lt;/li\&gt;;
});
