# Cmdparser

ruby's command provider
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cmdparser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cmdparser

## Usage

```
require 'cmdparser'

CmdParser.new{
  on ['help','-h'] do
    print "help command\n"
  end
  on 'server' do
  end
  on 'server',['port','-p'] do |port|
    print "port #{port}\n"
  end
  on 'server',['type','-t'] do |type|
    print "type #{type}\n"
  end
}.invoke
# filename : cmd.rb
# call : ./cmd.rb server port 80
# => port 80\n
# call : ./cmd.rb port 80
# => 
# call : ./cmd.rb server port 80 type http
# => port 80\ntype http
```
