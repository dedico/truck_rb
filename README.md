truck_rb
================

truck.pl API client in Ruby


Customer details example
---------------------

```ruby
require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"
require "happymapper"
require File.dirname(__FILE__) + '/api/request.rb'
require File.dirname(__FILE__) + '/api/response.rb'
require File.dirname(__FILE__) + '/models/customer.rb'
require File.dirname(__FILE__) + '/models/offer.rb'
require File.dirname(__FILE__) + '/queries/customer_query.rb'
require File.dirname(__FILE__) + '/queries/offer_query.rb'

host = "nh.test.truck.pl"
port = 80
user = "user@admoto.pl"
password = "password"

puts "Please provide customer id:"
id = gets.strip

start_time = Time.now

query = CustomerQuery.new(id)
request = Request.new(host, port, user, password, query)
response = Response.new(request.response)

if response.success
  customer = response.parse(Customer)
  puts customer.inspect
  
  if response.warnings.any?
    puts "Warnings:"
    puts response.warnings.inspect
  end
else
  puts "Error:"
  response.errors.each do |error|
    puts error
  end
end
```

Offer details example
---------------------

```ruby
require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"
require "happymapper"
require File.dirname(__FILE__) + '/api/request.rb'
require File.dirname(__FILE__) + '/api/response.rb'
require File.dirname(__FILE__) + '/models/customer.rb'
require File.dirname(__FILE__) + '/models/offer.rb'
require File.dirname(__FILE__) + '/queries/customer_query.rb'
require File.dirname(__FILE__) + '/queries/offer_query.rb'

host = "nh.test.truck.pl"
port = 80
user = "user@admoto.pl"
password = "password"

puts "Please provide customer id:"
id = gets.strip

start_time = Time.now

query = OfferQuery.new(id)
request = Request.new(host, port, user, password, query)
response = Response.new(request.response)

if response.success
  offer = response.parse(Offer)
  puts offer.inspect
  
  if response.warnings.any?
    puts "Warnings:"
    puts response.warnings.inspect
  end
else
  puts "Error:"
  response.errors.each do |error|
    puts error
  end
end
```