# `nrb` - Ninja Ruby scripts - [![Gem Version](https://badge.fury.io/rb/nrb.svg)](https://badge.fury.io/rb/nrb)

Ninja Ruby scripts with easy persistence for your experimenting needs.

Do you want to work on some idea that's more than a script but you don't want to generate a fully fleged Rails app?

**`nrb`** generates a simple scaffold for your script. Complete with autoloading, custom configurations and persistence. Just like a mini rails.

## Getting Started

1. First install the gem:

        $ gem install nrb

2. Create your new Ninja Ruy project:

        $ nrb new my-project

  `my-project` is your project name.

3. Change the directory to `my-project` and start hacking:

        $ cd my-project

        ├── config
        │   ├── boot.rb
        │   └── nrb.rb
        ├── db
        │   └── config.yml
        ├── models
        ├── services
        ├── Gemfile
        ├── my-project.rb
        ├── Rakefile
        └── README.md

4. Your main file is `my-project.rb`. Add your ideas here. You can also add more gems to the `Gemfile` and they will be automatically required.

  You can also change the `config/nrb.rb` file to add custom configurations.

  Also, everything you add to `models` and `services` will be required automatically.

5. To run your script:

        $ nrb start

  And to start the console with your script loaded:

      $ nrb console

## Models

You can enjoy all the goodness `ActiveRecord` provides, outside Rails, and without the bolierplate needed. The commands are almost the same as in Rails.

1. Create the database:

        $ rake db:create

2. Create a model:

        $ nrb g model user username email

        db/migrate
        └── 20160311091641_create_users.rb
        models
        └── user.rb


  You can then edit the migration and the model as you please.

3. Finally run the migration!

        $ rake db:migrate

## Services

These are just simple classes with the added benefit of being automatically Required in your main script file (the `my-project.rb` from the examples above).

To add a service:

        $ nrb g service user_service

        services
        └── user_service.rb

## Configuration

You can add or change configurations inside `config/nrb.rb`:

```ruby
Nrb.configure do |config|
  # Root of the script folder
  config.root = File.expand_path('..', __dir__)

  # Default resources to autoload
  # config.resources = %w(models services)

  # My custom config
  config.my_custom_config = :foo
end
```

You can access them by simply calling: `Nrb.config.my_custom_config`.

## Roadmap

- [ ] Add generator for tests.
- [ ] Add support for custom bundler groups.
- [ ] Add ability to change the persistence adapter. Currently `sqlite` is the default.
- [ ] Add ability to skip persistence altogether.

## Contributing

General feedback, bug reports and pull requests are more than welcome!

## Status

[![Build Status](https://travis-ci.org/shuriu/nrb.svg?branch=master)](https://travis-ci.org/shuriu/nrb) [![Coverage Status](https://coveralls.io/repos/github/shuriu/nrb/badge.svg?branch=master)](https://coveralls.io/github/shuriu/nrb?branch=master) [![Code Climate](https://codeclimate.com/github/shuriu/nrb/badges/gpa.svg)](https://codeclimate.com/github/shuriu/nrb) [![Dependency Status](https://gemnasium.com/shuriu/nrb.svg)](https://gemnasium.com/shuriu/nrb)

## Development

Run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
