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
user = "marek@admoto.pl"
password = "password"

# ad id: 4882432
# customer id: 999999
puts "Id:"
id = gets.strip

start_time = Time.now

# query = CustomerQuery.new(id)
query = OfferQuery.new(id)

request = Request.new(host, port, user, password, query)
response = Response.new(request.response)

if response.success
  # object = response.parse(Customer)
  object = response.parse(Offer)
  puts object.inspect
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


# query = CustomerQuery.new(id)
# query.find_all_offers
# request = Request.new(host, port, user, password, query)
# response = Response.new(request.response)
# offers = response.parse(Offer, false) #response.xml.xpath('//Ad')
# puts "Total offers #{offers.size}"

# offers.each do |o|
#   ad_query = AdQuery.new(o.id)
#   ad_request = Request.new(host, port, user, password, ad_query)
#   ad_response = Response.new(ad_request.response)
#   offer = ad_response.parse(Offer)
#   puts offer.modified_at
# end

puts "Time: #{Time.now - start_time} seconds"