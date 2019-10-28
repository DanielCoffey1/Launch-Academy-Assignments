### Introduction

You've been brainstorming new ways to interest investors in your space exploration program. You've decided to update your [elevator pitch](https://fi.co/madlibs).

Luckily, you have a few JavaScript tricks up your sleeve to assist with this task.

### Getting Started

From your `challenges` folder in the terminal, type the following commands:

```no-highlight
et get startup-mad-libs
cd startup-mad-libs
open index.html
atom .

> your work will go in `main.js`
```

In the browser, open up the JavaScript console. You can refresh the page in order to see your changes.


### Instructions

Use your JavaScript string concatenation skills, and the variables provided,
build your **One-Sentence Elevator Pitch** and print it to the JavaScript
console.

Your pitch should follow this format:

```no_highlight
My space exploration program, [companyName],
is developing [anOffering]
to help [aTargetAudience]
[solveAProblem]
[secretSauce].
```

Feel free to change the variables defined in `main.js` to describe your program.

{% show_hint %}
Remember, we can use string interpolation (evaluating variables in strings) and
concatenation (adding strings together) to build new strings.

```javascript
let companyName = "Launch Academy";
let firstLine = `My space exploration program, ${companyName}`;
```
{% endshow_hint %}

### Submitting Your Code

Once you have completed this exercise, use the `et submit` command to submit your code
from this project's folder.
