# Introduction

In Telefonica R&D we like to create brief challenges that can be solved is a couple of hours so later we can discuss the different solutions.

ConnfuExperiment is an approach to create a client that listens to an HTTP connection and executes a block of code when a specific message is received. The user of ConnfuExperiment can defined the code to be executed using an smooth DSL.

# Main blocks

* Event Machine: using the reactor to encapsulate the HTTP client.

* Event Machine HTTP Request: event oriented client to receive events via a keep alive HTTP request.

* DSL: quite simple, there's only one verb to handle.

* Dispatcher: router that executes a set of blocks associated to a specific message type.

* Formatter: create a Hash message from a JSON string.

# Example

```ruby
require 'connfu_experiment'

ConnfuExperiment.start "valid-api-key" do
  
  listen :sms do |msg|
    puts "Just got an SMS from #{msg[:from]} to #{msg[:to]}: \
         #{msg[:content]}"
  end

  listen :rss do |rss|
    puts "Just got an RSS: #{rss[:content]}"
  end

  listen :sms do |msg|
    puts "This block is also executed when an SMS message is fetched"
  end

end
```

# License

    The MIT License
    
    Copyright (c) 2011 Juan de Bravo
    
    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    'Software'), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:
    
    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.    