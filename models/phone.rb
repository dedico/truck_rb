require "happymapper"

class Phone
  include HappyMapper

  tag 'Phone'
  element :id, Integer, :tag => "Id"
  element :type, String, :tag => "Type"
  element :country_code, String, :tag => "CountryCode"
  element :number, String, :tag => "Number"
end