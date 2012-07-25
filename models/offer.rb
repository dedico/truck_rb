require "happymapper"
require File.dirname(__FILE__) + '/parameter.rb'
require File.dirname(__FILE__) + '/image.rb'

class Offer
  include HappyMapper
  #attr_accessor :id, :name, :nip, :currency, :discount
  tag 'Ad'
  element :id, Integer, :tag => "Id"
  element :external_id, String, :tag => "ExternalId"
  element :category_id, Integer, :tag => "CategoryId"
  element :make_id, Integer, :tag => "MakeId"
  element :model_id, Integer, :tag => "ModelId"
  element :status, String, :tag => "Status"
  element :model_description, String, :tag => "ModelDescription"
  element :price, Float, :tag => "Price"
  element :currency, String, :tag => "Currency"
  element :negotiatable, Boolean, :tag => "Negotiatable"
  element :plus_vat, Boolean, :tag => "PlusVat"
  element :customer_id, Integer, :tag => "CustomerId"
  element :address_id, Integer, :tag => "AddressId"
  element :description, String, :tag => "Description"
  element :promotion, String, :tag => "Promotion"
  element :modified_at, Time, :tag => "ModifiedAt"
  element :is_over_limit, Boolean, :tag => "IsOverlimit"
  
  has_many :parameters, Parameter, :tag => "Parameters"
  has_many :images, Image, :tag => "Images"

  def self.xpath
    '//Ad'
  end

  def self.xpath_pluralize
    '//Ads'
  end

end