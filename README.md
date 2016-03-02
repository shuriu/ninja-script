# NinjaScript

Idea scaffolds with easy persistence for your experimenting needs.

# Idea

**TLDR**: `$ ninja-script <idea-name>`

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

Or you could just use `$ ninja-script <idea-name>` and not worry about anything!

## Installation

    $ gem install ninja_script

## Usage

    $ ninja-script -h

## TODO

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shuriu/ninja_script.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

