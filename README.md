# Deployable::Cygwin

Cygwin helper functions

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deployable-cygwin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deployable-cygwin

## Usage

Cygwin detection

    require 'deployable/cygwin'

    Deployable::Cygwin.CYGWIN # => true
    Deployable::Cygwin.cygwin? # => true

cygpath

    require 'deployable/cygwin/path'

    Deployable::Cygwin::Path.to_win('/cygdrive/c/some/path') # => "C:\\some\\path"

    Deployable::Cygwin::Path.to_cyg('C:\some\path') # => "/cygdrive/c/some/path"


## Contributing

1. Fork it ( https://github.com/deployable/deployable-cygwin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
