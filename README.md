# JSONAPI::Resources::Filterer

This gem integrates [filterer gem](https://github.com/dobtco/filterer) to [jsonapi-resources gem](https://github.com/cerebris/jsonapi-resources).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jsonapi-resources-filterer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jsonapi-resources-filterer

## Usage

`jsonapi-resources` has a [built-in filtering feature](https://github.com/cerebris/jsonapi-resources#filters), e.g.

```ruby
# app/resources/contact_resource.rb
class ContactResource < JSONAPI::Resource
  attributes :name_first, :name_last, :email, :twitter

  filter :id
  filters :name_first, :name_last
end
```

... but if you want to use it together with `filterer` gem, you can do this:

```ruby
# app/resources/contact_resource.rb
class ContactResource < JSONAPI::Resource
  attributes :name_first, :name_last, :email, :twitter
  include JSONAPI::Resource::Filterer
end
```

... and it will look for `contact_filterer.rb` and apply its filters

```ruby
# app/filterers/contact_filterer.rb
class ContactFilterer < Filterer::Base

  def starting_query
    Contact.all
  end

  def param_id(x)
    results.where(id: x)
  end

  def param_name_first(x)
    results.where(name_first: x)
  end

  def param_name_last(x)
    results.where(name_last: x)
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## MIT License

Copyright 2015 G5

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contributing

1. Fork it ( https://github.com/g5/jsonapi-resources-filterer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
