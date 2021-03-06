ActiveRecord is a component of the Rails framework that combines relational databases and object-oriented programming into an **Object-Relational Mapping (ORM)**. ActiveRecord maps the state (data) and behavior (methods) of our objects to SQL statements.

In this assignment, we will focus on **ActiveRecord Migrations** which allow us to define and update our database schema using Ruby classes.

### Learning Goals

* Use SQL to directly create tables and columns
* Generate and run migrations that add or modify columns

### Data Definition Language

Before we can start inserting rows into a relational database we need to define the table structure that will store this information. SQL includes a [**Data Definition Language**](https://en.wikipedia.org/wiki/Data_definition_language) for creating and updating our schema using statements such as `CREATE TABLE` and `ALTER TABLE`.

Let's create a database to store song information. From the terminal run the following commands to create a database and open a connection to it:

```no-highlight
$ createdb songs
$ psql songs

psql (9.4.1)
Type "help" for help.

songs=#
```

At this point we should have an empty database with no tables.

```no-highlight
songs=# \d
No relations found.
```

Let's define a table to store individual songs along with the album they appear on and the artist:

```SQL
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    album VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL
);
```

The `CREATE TABLE` statement will update our database schema so that we now have a place to store songs.

```no-highlight
songs=# \d songs
                                 Table "public.songs"
 Column |          Type          |                     Modifiers
--------+------------------------+----------------------------------------------------
 id     | integer                | not null default nextval('songs_id_seq'::regclass)
 name   | character varying(255) | not null
 album  | character varying(255) | not null
 artist | character varying(255) | not null
Indexes:
    "songs_pkey" PRIMARY KEY, btree (id)
```

It's difficult to predict everything we're going to need for an application up front. In the case of our database, let's assume we need to store the genre as well. Our updated statement might look something like:

```SQL
CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    album VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL
);
```

The problem is that if we run this new statement after we've already created the table we'll encounter the following error:

```no-highlight
ERROR:  relation "songs" already exists
```

PostgreSQL doesn't allow us to redefine tables in this way. Instead, we need to specify what has changed from one state to the next. In this case we're adding a column so we can use the `ALTER TABLE` statement instead:

```SQL
ALTER TABLE songs ADD COLUMN genre VARCHAR(255) NOT NULL;
```

Running this command will update the schema accordingly:

```no-highlight
songs=# \d songs
                                 Table "public.songs"
 Column |          Type          |                     Modifiers
--------+------------------------+----------------------------------------------------
 id     | integer                | not null default nextval('songs_id_seq'::regclass)
 name   | character varying(255) | not null
 album  | character varying(255) | not null
 artist | character varying(255) | not null
 genre  | character varying(255) | not null
Indexes:
    "songs_pkey" PRIMARY KEY, btree (id)
```

### Configuring ActiveRecord

It's very likely that our database schema will change over time. As applications mature and requirements change, we have to modify our schema to handle new information or find better ways to represent what we already have. Applications tend to accumulate many incremental changes that move the database from one state to the next.

It's important to maintain an ordering of these changes so that we can re-build the schema from scratch and determine what new changes are required. For example, if we add a column to a table on our development database, we need to record that change somewhere so we can also apply it to our production database. If our team has multiple developers, it is important that they apply the same changes to *their* development databases so that everyone's databases stay in sync.

ActiveRecord is a component of the Rails framework that interfaces with our database. ActiveRecord manages these incremental changes by defining **migrations**. A migration is a set of instructions that will update a database from one state to the next. This usually consists of changing the schema in some way: creating a new table, adding or removing columns, inserting indexes, etc.

Let's see how we can manage creating our songs database using ActiveRecord. Even though it is a component of Rails, we can use it as a library within our Sinatra applications. To configure ActiveRecord with Sinatra we'll mostly follow the instructions on the [sinatra-activerecord README](https://github.com/janko-m/sinatra-activerecord).

First create a directory for our application and add a `Gemfile` that will list our dependencies:

```no-highlight
$ mkdir songs_app
$ cd songs_app
$ touch Gemfile
```

Within the Gemfile we can list the libraries we'll need to run our application:

```ruby
source "https://rubygems.org"

gem "activerecord", "~> 4.2"
gem "pg", "~> 0.21"
gem "rake"
gem "sinatra"
gem "sinatra-activerecord", "2.0.9"
```

To install these gems, run the **bundle** command. If the command cannot be found, run `gem install bundler` first.

```no-highlight
$ bundle

Using rake 10.4.2
Using i18n 0.7.0
Using json 1.8.2
Using minitest 5.5.1
Using thread_safe 0.3.5
Using tzinfo 1.2.2
Using activesupport 4.2.0
Using builder 3.2.2
Using activemodel 4.2.0
Using arel 6.0.0
Using activerecord 4.2.0
Using pg 0.18.1
Using rack 1.6.0
Using rack-protection 1.5.3
Using tilt 1.4.1
Using sinatra 1.4.5
Using sinatra-activerecord 2.0.5
Using bundler 1.7.11
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

Now we have the libraries we need to use ActiveRecord within a Sinatra application. Let's start with creating a simple *server.rb* file:

```no-highlight
$ touch server.rb
```

And adding the following code into it:

```ruby
# server.rb
require "sinatra"
require "sinatra/activerecord"

set :bind, '0.0.0.0'  # bind to all interfaces
```

We then need to supply ActiveRecord with some information on how to connect to our database. By default it will look for a file named `config/database.yml` to read any connection information from.

```no-highlight
$ mkdir config
$ touch config/database.yml
```

Within this file we can specify the database we want to use while in the development environment:

```no-highlight
development:
  adapter: postgresql
  database: songs
  username:
  password:
```

Since ActiveRecord works with multiple types of databases, we first specify that we're using the `postgresql` adapter so it knows to use PostgreSQL-flavored SQL. We also have to specify which database we're connecting to, in this case the `songs` database. The username and password are intentionally left blank since they are usually not required to connect when the database is running locally.

To run one-time commands with ActiveRecord, we rely on the **rake** command. Rake provides a way to run tasks written in Ruby that are defined in a **Rakefile**. Add the `Rakefile` to the root of your project by running the following:

```no-highlight
$ touch Rakefile
```

And adding the following contents to that file:

```ruby
# Rakefile
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./server"
  end
end
```
**Note:** Depending on your version of Rails, you may need to use `bundle exec rake <command>`.  Using `bundle exec` ensures that we're running the specific versions of the dependencies defined in your Gemfile.  Running just `rake` will run the latest versions which may not always be compatible with your version of Rails and which might result in unreliable behavior.  Basically, `bundle exec` runs the application in the environment the developer intended it to be run.

Now we should be able to run the `rake -T` command to view a list of tasks available:

```no-highlight
$ rake -T

rake db:create              # Creates the database from DATABASE_URL or config/database.yml for t...
rake db:create_migration    # Create a migration (parameters: NAME, VERSION)
rake db:drop                # Drops the database from DATABASE_URL or config/database.yml for the...
rake db:fixtures:load       # Load fixtures into the current environment's database
rake db:migrate             # Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)
rake db:migrate:status      # Display status of migrations
rake db:rollback            # Rolls the schema back to the previous version (specify steps w/ STE...
rake db:schema:cache:clear  # Clear a db/schema_cache.dump file
rake db:schema:cache:dump   # Create a db/schema_cache.dump file
rake db:schema:dump         # Create a db/schema.rb file that is portable against any DB supporte...
rake db:schema:load         # Load a schema.rb file into the database
rake db:seed                # Load the seed data from db/seeds.rb
rake db:setup               # Create the database, load the schema, and initialize with the seed ...
rake db:structure:dump      # Dump the database structure to db/structure.sql
rake db:structure:load      # Recreate the databases from the structure.sql file
rake db:version             # Retrieves the current schema version number
```

All of these tasks come predefined with ActiveRecord. Let's try dropping the *songs* database we created earlier so we can re-create it using migrations:

```no-highlight
$ rake db:drop
$ rake db:create
```

Even though these commands do not output anything, they are dropping and creating databases in the background. These commands are equivalent to the `createdb` and the `dropdb` commands that the Postgres.app provides us.

### Running Migrations

Now that we have a blank database, let's create a new migration to create our *songs* table. Each migration lives in a file within the `db/migrate` directory and is prefixed with a timestamp for when the migration was created. To generate a new migration via `rake` we can run the `create_migration` task:

```no-highlight
$ rake db:create_migration NAME=create_songs

#output:
db/migrate/20150316183253_create_songs.rb
```

If we open this file in our editor we can add the columns we need for our *songs* table:

```ruby
class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :album, null: false
      t.string :artist, null: false
    end
  end
end
```

Within the `change` method we can define our schema definition in Ruby that will be translated into the corresponding SQL statements. To actually create the table we need to run the migrate task:

```no-highlight
$ rake db:migrate

== 20150316183253 CreateSongs: migrating ======================================
-- create_table(:songs)
   -> 0.0128s
== 20150316183253 CreateSongs: migrated (0.0129s) =============================
```

At this point we have a *songs* table in our database that we created without having to write any SQL. We can verify it exists by connecting directly with `psql` and inspecting the schema:

```no-highlight
$ psql songs
songs=# \d songs
                              Table "public.songs"
 Column |       Type        |                     Modifiers
--------+-------------------+----------------------------------------------------
 id     | integer           | not null default nextval('songs_id_seq'::regclass)
 name   | character varying | not null
 album  | character varying | not null
 artist | character varying | not null
Indexes:
    "songs_pkey" PRIMARY KEY, btree (id)
```

Notice how in our migration we only specified three columns: the name of the song, album, and artist. When we ran the migration to create the table it automatically added an additional `id` column. ActiveRecord will always include an `id` column as the primary key unless we explicitly exclude it. This exemplifies the "convention over configuration" idiom that Rails adheres to and simplifies defining relationships between tables.

Now let's see how we can add the *genre* column to our table:

```no-highlight
$ rake db:create_migration NAME=add_genre_to_songs
db/migrate/20150316192527_add_genre_to_songs.rb
```

Every change we want to make to the database schema should exist in a new migration. Migrations represent the incremental changes we make to our database and exist as a list of files in the `db/migrate` directory. Let's open the newly generated migration in our editor:

```ruby
class AddGenreToSongs < ActiveRecord::Migration[5.1]
  def change
    add_column :songs, :genre, :string
  end
end
```

When we run this migration it will add a column to the table:

```no-highlight
$ rake db:migrate

== 20150316192527 AddGenreToSongs: migrating ==================================
-- add_column(:songs, :genre, :string)
   -> 0.0007s
== 20150316192527 AddGenreToSongs: migrated (0.0008s) =========================
```

### Remembering Migrations

Once a migration has been run, the database remembers that and won't repeat it on subsequent calls.

```no-highlight
$ rake db:migrate
```

We can run this over and over again but it won't repeat migrations. This is because ActiveRecord stores the migrations that have been run in an additional table called **schema_migrations**:

```no-highlight
$ psql songs

songs=# SELECT * FROM schema_migrations;

    version
----------------
 20150316183253
 20150316192527
(2 rows)
```

Every time we run a new migration, a row is added to the *schema_migrations* table that remembers the ID of the last migration ran (where the ID is the timestamp prefix for each migration file). When we run the `rake db:migrate` command again, it will only try to run any migrations that it hasn't seen before. This prevents the error we saw before when we tried running the `CREATE TABLE` command twice in a row.

If we made a mistake and want to undo a migration, rake provides a command to roll back the last migration run:

```no-highlight
$ rake db:rollback

== 20150316192527 AddGenreToSongs: reverting ==================================
-- remove_column(:songs, :genre, :string)
   -> 0.0010s
== 20150316192527 AddGenreToSongs: reverted (0.0054s) =========================
```

The `db:rollback` task will undo the last migration and try to run the **inverse** of what the migration did. If we originally created a table, the inverse would be to drop the table. In this case the last migration was to add a column, so the inverse is to remove it.

This is important if we ever want to change a migration. Once we publish a migration to production or other developers, it is important that we **never** modify it. Unless the other developers know to explicitly roll back and re-run the migration they won't receive our changes.

The one exception is if we're actively developing a migration and we need to tweak it before committing it to our application. Before modifying a migration, roll back the changes first, modify the file, and run the migrate task again:

```no-highlight
# Step 1: Roll back the latest migration
$ rake db:rollback

# Step 2: Modify the contents of the migration
$ ...

# Step 3: Re-run the migration
$ rake db:migrate
```

#### A Note on Rollbacks

Unlike the rest of this article, you won't run the code shown below! This section is to talk about how we would handle an irreversible migration.

Because a rollback runs the inverse of the migration, we need to make sure we're explicit in our migrations, just in case we need to rollback for some reason.  This is easy to do if we're creating a table or a column, because a rollback will only destroy that table or column, and doesn't need to worry about other information.
```ruby
def change
  add_column :songs, :runtime, :integer, null: false, default: 0
end

# rake db:rollback will run `remove_column :songs, :runtime`
```

However, if you're using a migration to delete a table or a column, you could run into trouble.  If for some reason you have to rollback that migration, ActiveRecord won't be able to recreate the table with everything you had at first if you don't explicitly declare it.
```ruby
# rake db:migrate
def change
  remove_column :songs, :runtime
end

# rake db:rollback will try to run `add_column :songs, :runtime`, but it won't know the datatype or constraints!
```
So how do we avoid running into problems here? The answer is, simply, to be as explicit as possible.  One way to do that is to use ActiveRecord's `up` and `down` methods _instead_ of the `change` method.  The `def change` that we use most of the time came with a recent ActiveRecord update, and it's pretty intelligent, but it's not perfect. Here's how the `up` and `down` methods work. We will replace the `def change` method inside of our migration with:
```ruby
def up #<--- this is the migration
  remove_column :songs, :runtime
end

def down #<--- this is the rollback
  add_column :songs, :runtime, :integer, null: false, default: 0
end
```
By using `up` and `down`, we are explicitly saying this is precisely what we want to happen when we migrate. The up will be called when we run `rake db:migrate`, and the down will be called when we run `rake db:rollback`.  And by being so explicit, we ensure we are communicating properly both with our code, and all of the various tech involved, and with anyone who might come in to look at or work with our code.  As with most ideas in software development, this is not the only way to do things, but it is certainly another tool to keep in your toolbox.

### Schema Snapshot

Once we have run our migrations, ActiveRecord will output the latest snapshot of the schema to the `db/schema.rb` file:

```ruby
ActiveRecord::Schema.define(version: 20150316192527) do

  create_table "songs", force: :cascade do |t|
    t.string "name",   null: false
    t.string "album",  null: false
    t.string "artist", null: false
    t.string "genre",  null: false
  end

end
```

Note that this file should not be hand-edited if we ever need to make a change. Since it is auto-generated, any changes we make will be overwritten on the next migration. It is useful as a reference to view the state of the database as a whole rather than looking at the incremental changes.

For the curious, run `rake db:structure:dump` and take a look at the `db/structure.sql` file. Here, you can see all the SQL commands that have been run on your database by ActiveRecord and `rake`.

### External Resources

We've just scratched the surface on migrations. The [Rails Guide on Migrations](http://guides.rubyonrails.org/active_record_migrations.html) provides more information on advanced usage and additional options for migrations. The [ActiveRecord::Migration API documentation](http://api.rubyonrails.org/classes/ActiveRecord/Migration.html) provides more information on the available transformations that we can use for creating and modifying tables as well as indexes in our schema.

### In Summary

ActiveRecord **migrations** provide a convenient mechanism for managing changes to the database schema. A migration specifies the changes required to transition from one state to the next.

The **rake** command is used to run available migrations and roll them back if anything goes wrong. Once a migration has been run it is recorded within the **schema_migrations** table in the database. If a migration needs to be changed, roll back before making changes to ensure that it is run again on the next migrate command.

ActiveRecord will auto-generate a **schema.rb** file that represents the current state of the schema. This file should not be edited directly but it provides a quick overview of how information is organized within an application.
