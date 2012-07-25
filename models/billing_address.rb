require "happymapper"

class BillingAddress
  include HappyMapper

  tag 'BillingAddress'
  element :name, String, :tag => "Name"
  element :street, String, :tag => "Street"
  element :city, String, :tag => "City"
  element :post_code, String, :tag => "PostCode"
  element :country_name, String, :tag => "CountrName"
  element :region_name, String, :tag => "RegionName"
end