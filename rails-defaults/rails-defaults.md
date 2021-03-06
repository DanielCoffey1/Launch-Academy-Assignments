### Introduction

Rails is an opinionated framework. Running the `rails new` command builds a new
Rails application for us. This is both powerful, in the sense that we do not
have to waste brain power figuring out which view
templating language to use, but also limiting in the sense that we aren't provided
choices.

This article will serve as a resource for you as you move forward in your learning, and your career. Additionally, it will familiarize you with some of the opinions we hold at Launch Academy as Rails developers. Let's explore the default choices the Rails framework makes for us.

### Learning Goals

* Examine the default settings rails uses
* Discover ways to overwrite the rails default settings to better cater to our needs

### Rails New

We are able to override some of the decisions made by the framework via command
line arguments. Below, we show the output of the `rails new --help` command.

```no-highlight
$ rails new --help
Usage:
  rails new APP_PATH [options]

Options:
  -r, [--ruby=PATH]                                      # Path to the Ruby binary of your choice
                                                         # Default: /Users/rd/.rubies/ruby-2.3.1/bin/ruby
  -m, [--template=TEMPLATE]                              # Path to some application template (can be a filesystem path or URL)
  -d, [--database=DATABASE]                              # Preconfigure for selected database (options: mysql/oracle/postgresql/sqlite3/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)
                                                         # Default: sqlite3
  -j, [--javascript=JAVASCRIPT]                          # Preconfigure for selected JavaScript library
                                                         # Default: jquery
      [--skip-gemfile], [--no-skip-gemfile]              # Don't create a Gemfile
  -B, [--skip-bundle], [--no-skip-bundle]                # Don't run bundle install
  -G, [--skip-git], [--no-skip-git]                      # Skip .gitignore file
      [--skip-keeps], [--no-skip-keeps]                  # Skip source control .keep files
  -M, [--skip-action-mailer], [--no-skip-action-mailer]  # Skip Action Mailer files
  -O, [--skip-active-record], [--no-skip-active-record]  # Skip Active Record files
  -P, [--skip-puma], [--no-skip-puma]                    # Skip Puma related files
  -C, [--skip-action-cable], [--no-skip-action-cable]    # Skip Action Cable files
  -S, [--skip-sprockets], [--no-skip-sprockets]          # Skip Sprockets files
      [--skip-spring], [--no-skip-spring]                # Don't install Spring application preloader
      [--skip-listen], [--no-skip-listen]                # Don't generate configuration that depends on the listen gem
  -J, [--skip-javascript], [--no-skip-javascript]        # Skip JavaScript files
      [--skip-turbolinks], [--no-skip-turbolinks]        # Skip turbolinks gem
  -T, [--skip-test], [--no-skip-test]                    # Skip test files
      [--dev], [--no-dev]                                # Setup the application with Gemfile pointing to your Rails checkout
      [--edge], [--no-edge]                              # Setup the application with Gemfile pointing to Rails repository
      [--rc=RC]                                          # Path to file containing extra configuration options for rails command
      [--no-rc], [--no-no-rc]                            # Skip loading of extra configuration options from .railsrc file
      [--api], [--no-api]                                # Preconfigure smaller stack for API only apps

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Rails options:
  -h, [--help], [--no-help]        # Show this help message and quit
  -v, [--version], [--no-version]  # Show Rails version number and quit

Description:
    The 'rails new' command creates a new Rails application with a default
    directory structure and configuration at the path you specify.

    You can specify extra command-line arguments to be used every time
    'rails new' runs in the .railsrc configuration file in your home directory.

    Note that the arguments specified in the .railsrc file don't affect the
    defaults values shown above in this help message.

Example:
    rails new ~/Code/Ruby/weblog

    This generates a skeletal Rails installation in ~/Code/Ruby/weblog.
```

We have the ability to skip the installation of libraries and the running of
actions by adding arguments to the `rails new` command. For instance, we can
prevent the installation of Rails default gems by adding this tag to the
`rails new --skip-bundle` command.

### Rails Organization

The following command generates a new Rails application, named
`demo_app`. Here, you can see an example of the rails file structure.

```no-highlight
$ rails new demo_app --skip-bundle
$ cd demo_app
.
├── Gemfile
├── README.md
├── Rakefile
├── app
│   ├── assets
│   ├── channels
│   ├── controllers
│   ├── helpers
│   ├── jobs
│   ├── mailers
│   ├── models
│   └── views
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── update
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   ├── initializers
│   ├── locales
│   ├── puma.rb
│   ├── routes.rb
│   ├── secrets.yml
│   └── spring.rb
├── config.ru
├── db
│   └── seeds.rb
├── lib
│   ├── assets
│   └── tasks
├── log
├── public
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── apple-touch-icon-precomposed.png
│   ├── apple-touch-icon.png
│   ├── favicon.ico
│   └── robots.txt
├── test
│   ├── controllers
│   ├── fixtures
│   ├── helpers
│   ├── integration
│   ├── mailers
│   ├── models
│   └── test_helper.rb
├── tmp
│   └── cache
└── vendor
    └── assets
```

Part of what makes Rails such a powerful framework is the organizational
structure it provides to you "out of the box".   
The `app` folder contains all the **Models**, **Views**, and **Controllers**.   
The `public` folder contains static files.   
The `config` folder contains all of the configuration details necessary to start the
application.  
We _could_ place an ActiveRecord Model in the `lib` folder, but
that would go against the clearly defined organization of files Rails has
provided for us.  

##### Convention over configuration:  
**_You should only violate Rails convention if you can come up
with a valid reason to do so._**

### Rails Defaults

The `Gemfile` lists all of the Ruby "Gems" or libraries that
an application will require in order to execute. Note that this could change with updated versions of Rails.

```ruby
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

Rails does a decent job of explaining what each of these Ruby libraries adds to
our application. However, many of these gems may be unfamiliar to us. Let's
break down the choices Rails has made for us:

* Framework: rails
* Database: sqlite3
* JavaScript: coffeescript, turbolinks
* API development: jbuilder
* Debugging: byebug, web-console
* Testing: minitest

### SQLite

From the [SQLite homepage](https://www.sqlite.org/about.html):

> SQLite is an in-process library that implements a self-contained, serverless,
> zero-configuration, transactional SQL database engine. The code for SQLite is
> in the public domain and is thus free for use for any purpose, commercial or
> private. SQLite is the most widely deployed database in the world with more
> applications than we can count, including several high-profile projects.

Sounds great. SQLite stores databases as files in the filesystem, under the `db`
folder. However, we have spent considerable time studying the PostgreSQL
relational database management system. While both SQLite and PostgreSQL
understand Structured Query Language (SQL), it would be preferable to stick to
what we know. Another reason not to switch our database engine is that
[Heroku](https://heroku.com/) supports PostgreSQL. If we decided to go with
SQLite in development, we would need to make significant changes to our
application so that it would work on Heroku's servers. Minimizing the
differences between our development and production environments makes our lives
as Software Developers easier.

As mentioned above, we can override rails defaults by adding commands to the `rails new` command:

```no-highlight
rails new --database=postgresql
```

### CoffeeScript

From the [CoffeeScript homepage](http://coffeescript.org/):

> CoffeeScript is a little language that compiles into JavaScript.

If we already know JavaScript, why waste time learning another way to write it?
We can exclude this dependency (or any other we don't need/want) by removing the `gem 'coffee-rails'` line from the `Gemfile` and running `bundle`.

### Turbolinks

> Turbolinks makes following links in your web application faster. Instead of
> letting the browser recompile the JavaScript and CSS between each page change,
> it keeps the current page instance alive and replaces only the body (or parts
> of) and the title in the head.

[Source](https://github.com/rails/turbolinks)

When we are developing our application, we **want** to recompile our JavaScript
and CSS between each page change! This means that changes to any JS or CSS files
aren't reloaded when you refresh the page, leading to moments of head-scratching,
swearing, and general unrest when you are trying to implement some JavaScript
functionality or simply attempting to style your app.

Minimize frustration by removing turbolinks:

```no-highlight
rails new --skip-turbolinks
```

### Jbuilder

> Jbuilder gives you a simple DSL for declaring JSON structures that beats
> massaging giant hash structures.

[Source](https://github.com/rails/jbuilder)

When retrieving data from our application using JavaScript, we can
[render our ActiveRecord objects as JSON](http://guides.rubyonrails.org/layouts_and_rendering.html#rendering-json),
without having to use Jbuilder. When we **need** to have more control over the
JSON data that our application outputs, we should look into
[ActiveModelSerializers](https://github.com/rails-api/active_model_serializers).

This is another dependency you can easily remove from your `Gemfile` and `bundle`.

### Byebug and Web Console

> Byebug is a simple to use, feature rich debugger for Ruby 2.

[Source](https://github.com/deivid-rodriguez/byebug)

We are already familiar with the `pry` debugger, which has features that `byebug`
does not, syntax highlighting possibly being the most important. You can simply replace
this line with `gem 'pry-rails'` and `bundle`.

> Web Console is a debugging tool for your Ruby on Rails applications.

![Web Console](https://s3.amazonaws.com/horizon-production/images/web-console.png)

[Source](https://github.com/rails/web-console)

While it is handy to be able to be able to have access to the Rails console in
the browser, we can accomplish the same functionality with a well-placed
`binding.pry` statement. Whether or not you decide to remove this dependency is
up to you. Remove it by simply removing the line `gem 'web-console'` from the
`Gemfile`.

### minitest

We are already familiar with the RSpec unit-testing framework and the Capybara
BDD testing framework. Let's use these tools instead of `minitest`. To do this, just add
`--skip-test` to your `rails new` command, and edit your `Gemfile`.

```ruby
# Gemfile

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
end
```

There are a few extra steps to get these gems working properly. Take a look at
their documentation to find out what to do.

* [rspec-rails](https://github.com/rspec/rspec-rails)
* [capybara](https://github.com/jnicklas/capybara).

### Putting it all together

Here is the resulting command to get a Rails app with the libraries we want:

```no-highlight
rails new <app-name> --skip-bundle --database=postgresql --skip-turbolinks --skip-test
```

We would then want to update our Gemfile to add `pry-rails`, `rspec-rails`, and `capybara` as specified above.

Once that is done, run the following commands.

```no-highlight
$ bundle
$ rails generate rspec:install
```

Then, add `require 'capybara/rails'` to your `spec/rails_helper.rb` file.

### Complete Automation with .railsrc
Going though this process every time we want to set up a new Rails application is tedious. We can streamline the `rails new` command with something called a `.railsrc` file.

Create this file in your home directory with the following contents:

```no-highlight
# ~/.railsrc
--database=postgresql
--skip-bundle
--skip-test
--skip-turbolinks
```  

Note that once this is done, `rails new` will run with these flags by default. However, we will still need to update our Gemfile according to this article, remember to `bundle`, and set up `rspec` and `capybara` in our test environment.

### Summary

Rails makes some decisions for us, which are great. It makes other decisions for
us that aren't so great. Luckily, the framework is easily customizable to suit
our needs as Web Developers.
