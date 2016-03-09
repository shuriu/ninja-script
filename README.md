# Ninja Ruby - Nrb [![Build Status](https://travis-ci.org/shuriu/nrb.svg?branch=master)](https://travis-ci.org/shuriu/nrb)

Ninja Ruby scripts with easy persistence for your experimenting needs

# Idea

**TLDR**: `$ nrb new <idea-name>`

Say you want to validate some idea. Maybe crawl some page, API, or process some file. Whatever scratches your itch.

> Cool, I can get all this data from there. But what do I do with it?

So you want some kind of persistence?

> I'll just dump the data in memory into some array or object, then do some stuff to it later.

But maybe you want to show it to some colleague or your boss.

> Ok I'll dump it into some file.

Now we're getting somewhere. But it's hard to analyze later. Or you don't want to hit the API again when you run your script.

> Hmm, I'll just dump it in some database!

And 5 minutes later you realize it's just a simple script. You don't want to mess with all the boilerplate required to setup the db and query it with ugly SQL.

Also, as you hit more and more edge cases with your idea, you realize you just have a big `.rb` file with no structure and your idea is hidden inside loops and control structures instead.

> I'll add some structure then: extract some methods into classes and classes into files and...

And now you have to do boilerplate for requiring files..

> Fuck it, I'll just do a Rails App!

Or you could just use `$ nrb new <idea-name>` and not worry about anything!

## Installation

    $ gem install nrb

## Usage

```sh
$ nrb help
Commands:
  nrb [c]onsole                     # Jump into a Pry console with your project loaded. NOTE: Available inside a NinjaRuby project
  nrb [d]estroy <resource> <name>   # Destroy a generated resource. NOTE: Available inside a NinjaRuby project
  nrb [g]enerate <resource> <name>  # Generate a resource (models, services). NOTE: Available inside a NinjaRuby project
  nrb [s]tart                       # Require the main file. NOTE: Available inside a NinjaRuby project
  nrb help [COMMAND]                # Describe available commands or one specific command
  nrb new <name-or-path> [OPTIONS]  # Creates a Ninja Ruby Script at the given path
```

Create an app and some resources:

```sh
$ nrb help new
Usage:
  nrb new <name-or-path> [OPTIONS]

Options:
  -r, [--init-repo], [--no-init-repo]            # Initialize a repository at the target location
                                                 # Default: true
  -b, [--bundle-install], [--no-bundle-install]  # Run bundle install after generating the skeleton
                                                 # Default: true
Creates a Ninja Ruby Script at the given path

$ nrb new user_importer
      create  user_importer/.gitignore
      create  user_importer/README.md
      create  user_importer/Gemfile
      create  user_importer/Rakefile
      create  user_importer/config/nrb.rb
      create  user_importer/models/.keep
      create  user_importer/services/.keep
      create  user_importer/config/boot.rb
      create  user_importer/db/config.yml
      create  user_importer/user_importer.rb
$ cd user_importer

$ rake db:create

$ nrb g model user first_name last_name email
      create  models/user.rb
         run  rake db:new_migration name=create_users options='first_name last_name email' from "."
      create  db/migrate/20160309074029_create_users.rb

$ rake db:migrate

$ nrb console

[1] pry(main)> User.create(first_name: 'Gandalf', last_name: 'The Grey', email: 'gandalf@example.com')
D, [2016-03-09T09:44:12.434679 #21739] DEBUG -- :    (0.1ms)  begin transaction
D, [2016-03-09T09:44:12.440635 #21739] DEBUG -- :   SQL (0.5ms)  INSERT INTO "users" ("first_name", "last_name", "email") VALUES (?, ?, ?)  [["first_name", "Gandalf"], ["last_name", "The Grey"], ["email", "gandalf@example.com"]]
D, [2016-03-09T09:44:12.444638 #21739] DEBUG -- :    (3.6ms)  commit transaction
=> #<User:0x005582ec4153d8 id: 1, first_name: "Gandalf", last_name: "The Grey", email: "gandalf@example.com">

[2] pry(main)> User.all
D, [2016-03-09T09:45:11.252371 #21739] DEBUG -- :   User Load (0.2ms)  SELECT "users".* FROM "users"
=> [#<User:0x005582ed31c3e0 id: 1, first_name: "Gandalf", last_name: "The Grey", email: "gandalf@example.com">]

```

## Configuration

To add custom configurations or change existing ones, you can modify `config/nrb.rb`:

```ruby
Nrb.configure do |config|
  # Root of the script folder
  config.root = File.expand_path('..', __dir__)

  # Default resources to autoload
  # config.resources = %w(models services)
end
```

To configure the default sqlite db, you can update `db/config.yml`:

```yaml
development:
  adapter:  sqlite3
  pool:     5
  timeout:  5000
  database: db/new_script.sqlite3
```

## TODO

* Tests
* Support for custom bundler groups
* Ability to change the persistence adapter
* Ability to skip persistence altogether


## Development

Run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shuriu/nrb.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

