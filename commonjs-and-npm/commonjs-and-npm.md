## Learning Objectives
* Learn how to split up your program into multiple files using CommonJS modules
* Use NPM packages in your code

## Installing CommonJS modules and NPM
In this article, we will be talking about CommonJS modules and NPM.
These tools come packaged with [Node](https://nodejs.org/en/), which is an environment for developing server-side (backend) Web applications in javascript.
Thus, we will install Node in order to utilize these tools.
To install Node via Homebrew, run the following command in your terminal:

```
$ brew install node
```

## CommonJS modules
Let's create a file called `app.js` by running `touch app.js` in the terminal. Now open up that file by running `atom app.js` and then add the following content to the file:

```javascript
// app.js
var growlText = "Roooarrgh ur r";
var chewbaccaGrowl = function() {
  growlText = growlText + "oo";
  console.log(growlText);
};

chewbaccaGrowl();
chewbaccaGrowl();
```

Now let's run this file with Node in the terminal by executing:
```
$ node app.js
```
Which should give us the following output:

```
Roooarrgh ur roo
Roooarrgh ur roooo
```
This program is pretty great as it stands.
As our program grows, however, there will eventually be too much code in this one file and we will most likely run into namespace collisions.
An example of a possible namespace collision would be the `growlText` variable which is acting as a private variable that is only used by the `chewbaccaGrowl` function.
By keeping `growlText` in this file, we can no longer call a new variable `growlText` because if we do so, we will change the expected return value of the `chewbaccaGrowl` function.
To solve this problem we can use [CommonJS modules](http://wiki.commonjs.org/wiki/Modules/1.1.1) and split the file into two files: `app.js` and `chewbacca_growl.js`, which is going to be a module.

Let's create that `chewbacca_growl.js` file by running `touch chewbacca_growl.js` in the terminal and adding the following content to it:

```javascript
// chewbacca_growl.js
var growlText = "Roooarrgh ur r";
var chewbaccaGrowl = function() {
  growlText = growlText + "oo";
  console.log(growlText);
};

module.exports = chewbaccaGrowl;
```
And let's update our `app.js` file so it contains this content:
```javascript
// app.js
var chewbaccaGrowl = require('./chewbacca_growl');

chewbaccaGrowl();
chewbaccaGrowl();
```

In the `app.js` file, we use the `require` function which takes in a string that represents relative path of the module file whose exports you want.
Since `chewbacca_growl.js` is in the same folder as `app.js`, we prepend `./` before the name of the file.
The return value of the `require` function, will be the value assigned to `module.exports` in the module file.
If we run `node app.js`, we get the same result as before.

One benefit from this is that we have reduced the amount of code per file.
The biggest benefit, though, is that our new interface with the `chewbaccaGrowl` function has had its implementation details hidden.
In our `app.js`, we cannot change the `growlText` variable in `chewbacca_growl.js` either accidentally or on purpose.
Additionally, we can also change the name of the exported function from `chewbacca_growl.js` to avoid namespace collisions if needed.
If we update `app.js` with the changes below, we can see that it illustrates the previous two points:

```javascript
// app.js
var importedChewbaccaGrowl = require('./chewbacca_growl');
var growlText = "This will not interfere with the ouput";

importedChewbaccaGrowl();
importedChewbaccaGrowl();
```
Running this code does not change our output.

## Node Package Manager (NPM)
Writing your own modules is great, but you will probably also want to use modules written by others that will aid you in your programming endeavors.
These open-source modules are called packages, and you can incorporate them using the **Node Package Manager** which is most commonly referred to as **npm**.
To use npm, we must first have a `package.json` file in our project folder.
A default one can be generated for us by running:

```
$ npm init
```

You may fill in the details if you wish, but you can simply just press enter for everything to get a `package.json` similar to this:

```json
{
  "name": "npm_example",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```
The current content of this file describes the project.
This content is useful, but it is irrelevant to our current discussion, so we will ignore it for the time being.
Now that we have a `package.json` file, we can start installing packages.
For our example, we will install [lodash](https://lodash.com/), which is a javascript utility library.
To install this package, we can run:

```
$ npm install --save lodash
```
The `--save` flag tells npm to add this package to the `package.json` file, and the last argument is the name of the package.
If we open up `package.json`, we can see that `lodash` has indeed been added under a new name called `dependencies`.
The value next to the name `lodash` denotes the semantic versioning of the package.

```json
{
  "name": "npm_example",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "lodash": "^4.2.0"
  }
}
```
You will also notice that in your project root, there is now a `node_modules` folder, which contains a `lodash` folder.
This `lodash` folder contains all the code for the `lodash` package.
Let's wipe away everything that we had previously in our `app.js` file, and let's use the `lodash` package.

```
// app.js
var _ = require('lodash');

var result = _.compact([true, false]);
console.log(result);
```

We also have to require this module, but instead of giving it a string that represents a relative path, we give it the name of the package.
Here we are using `lodash`'s [#compact](https://lodash.com/docs#compact) function, which removes all falsey values from an array.
Running this code returns `[ true ]`.

Another major benefit of having a `package.json` file which lists your project dependencies is that another developer can now download your project and install all of the project's dependencies by simply running `npm install`.

## Installing/Uninstalling Different Kinds Of Packages
There are packages which are not needed for your application to work, but they are helpful for developing and/or testing the application.
You would install them with the following format:

```
$ npm install --save-dev name_of_package
```
These packages will be installed under the name `devDependecies` in your `package.json` file.
This is useful because when deploying to production, you can tell npm to install the dependencies in your `package.json` only found in `dependecies`, but ignore the ones found in `devDependencies`.

There are also packages which may be installed and used in the command-line. You would want to install these packages globally by running:

```
$ npm install -g name_of_package
```

Finally, if you ever need to uninstall a package, change `install` to `uninstall` in the command that your originally ran to install the package.
For example, to uninstall a normal dependency, you can run:

```
$ npm uninstall --save name_of_package
```
## Yarn

NPM has drawbacks and shortcomings. There are a few reasons why NPM creates headaches for developers:

1) NPM installs your packages in a non-deterministic manner. In short, this can cause the install order of your packages to be inconsistent across the development team's machines, as well as install different versions of packages on different machines. The latter point can be avoided, but it requires a conscious decision. In Ruby, we're used to having a `Gemfile.lock` file take care of that for us. NPM doesn't have something like that to install our packages in the correct order.

2) For every single package that NPM installs, it goes out to the internet to get that package... every. single. time.
There is no local caching of packages, which can **greatly** increase installation time, and if you happen to not have an internet connection, this can grind development down to a halt.

Enter [Yarn](https://yarnpkg.com/en/).

Yarn, created by the engineering team at Facebook, eases the dependency / package installation process.
Yarn is considered a wrapprer for npm, meaning that Yarn itself utilizes npm for its core functionality, and additionally provides features and niceties that solves the above problems.

It's important to note that npm is both a installation tool _and_ a package registry.
Yarn is just the an installation tool, hence the need and want for Yarn to use npm at its core.
With Yarn, you can install any package that is available on the npm registry, but we need NPM *first*. Since we've already installed NPM, let's go ahead and install Yarn.

**We will use Yarn moving forward in future lessons for the reasons mentioned above**

### Install Yarn

```
$ brew install yarn --without-node
```

To verify the install:

```
$ yarn --version
```

 This should just tell you what version you installed. So long as returns a version number, it installed properly.

### Setup

To start using yarn with a brand new project, you would simply run `cd name-of-directory` to move into whichever new project directory you have created and run `yarn init`.


This will do the same thing as `npm init`: It will create a `package.json` file.

To use yarn with an existing project that had its packages installed via npm, you would run just run `yarn` in that project's root directory.

And that's it! The `yarn` command will reinstall your packages, and then it will generate a `yarn.lock` file. This file will explicitly state exactly which version of each package that is being used automatically. If you are familiar with why `bundler` uses a `Gemfile.lock`, you will see the benefits of this file. When another developer installs the project on their machine, the same exact versions of each package will be installed!

### Other Usage

Many of the `yarn` commands are very similar.

To add a package to your project, use the `add` command:

```
$ yarn add name_of_package
```

Let's say the package you want to install is important for development, but is not used in production. A testing library like Jasmine is a good example of this. To add a package to your dev environment only, use:

```
$ yarn add name_of_package --dev
```

More commands, as well as their `npm` equivalents can be found here:
[Yarn Commands](https://yarnpkg.com/lang/en/docs/migrating-from-npm/#toc-cli-commands-comparison)


[Complete Yarn Documentation](https://yarnpkg.com/lang/en/docs/)

## Ruby Analogies

If you're a rubyist, the following comparisons may be helpful in understanding
the NPM ecosystem, if you aren't familiar with these aspects of ruby yet, don't worry about it!

* `npm install` and `yarn` are like `bundle install`.
* `package.json` is like your `Gemfile` file.
* If you are using yarn, your `yarn.lock` file is like your `Gemfile.lock` file (Who would have guessed?)
* The packages in the `dependencies` of your `package.json` are like the gems
    not listed under any `group` in your `Gemfile`.
* The packages in the `devDependencies` of your `package.json` are like the gems
    listed under `group :test, :development do` in your `Gemfile`.
* `var _ = require('lodash');` is analogous to `require 'pry'`.
* `var chewbaccaGrowl = require('./chewbacca_growl');` is analogous to
    `require_relative('name_of_file_in_the_same_directory.rb')`.

## Summary
In this article, we learned how to use modules to split our code into several files.
This has many advantages including reducing the of amount of code per file, hiding implementation details of an interface, and avoiding namespace collisions.

We also learned how to reuse functionality from libraries by downloading packages with npm.
Additionally, npm creates a `package.json` file which lists all of the project's dependecies, and thus makes it easier for developers in a team to install missing project dependencies and add new dependencies to the project.

### External Resources
* [CommonJS Modules Documentation](http://wiki.commonjs.org/wiki/Modules/1.1.1)
* [CommonJS Module Examples In Node](https://nodejs.org/api/modules.html)
* [NPM Getting Started](https://docs.npmjs.com/getting-started/what-is-npm)
