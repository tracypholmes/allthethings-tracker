# Comiks Tracker

A simple Sinatra app that will allow you to inventory your comic books - physical and virtual. You can see it in action on Heroku >> [Comiks Tracker](https://comiks-tracker.herokuapp.com).

# Thoughts

My second official Flatiron project, I decided to make something I could use. We have a ton of comic books in the house, and there are times a certain person attempts to "borrow" an issue permanently. I honestly didn't understand why I needed to this when I could just use Rails, but Sinatra has proven to be a great teacher. I'm way more comfortable with ActiveRecord now. Validations and associations are cool! And I was able to use a bit of bootstrap in the process. Very happy with this project and plan on building out my features a bit more. 

## Installation, Usage & Development

Clone this repository to your computer and run the following commands in your terminal:

```ruby
bundle install
rake db:migrate
shotgun
```

Then navigate to `localhost:9393` in your browser to see it in action.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tracypholmes/comiks-tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Shoutouts

Thanks to Brian Emory and his [Corneal](https://github.com/thebrianemory/corneal) gem. Thanks also to The [Wim Wauters Blog](http://blog.wimwauters.com/sinatra-todo-app-with-activerecord-step-2/) for helping me get straight with my Bootstrap tables.
