require "happymapper"
require File.dirname(__FILE__) + '/phone.rb'

class Address
  include HappyMapper

  tag 'Address'
  element :id, Integer, :tag => "Id"
  element :email, String, :tag => "Email"
  element :http, String, :tag => "Http"
  element :street, String, :tag => "Street"
  element :city, String, :tag => "City"
  element :country_name, String, :tag => "CountrName"
  element :region_name, String, :tag => "RegionName"
  has_many :phones, Phone, :tag => "Phones"
end