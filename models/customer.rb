require "happymapper"
require File.dirname(__FILE__) + '/address.rb'
require File.dirname(__FILE__) + '/subscription.rb'
require File.dirname(__FILE__) + '/mailing_address.rb'
require File.dirname(__FILE__) + '/billing_address.rb'

class Customer
  include HappyMapper
  #attr_accessor :id, :name, :nip, :currency, :discount
  tag 'Customer'
  element :id, Integer, :tag => "Id"
  element :name, String, :tag => "Name"
  element :nip, String, :tag => "Nip"
  element :currency, String, :tag => "Currency"
  element :discount, Float, :tag => "Discount"
  element :subdomain, String, :tag => "Subdomain"
  element :has_electronic_invoice, Boolean, :tag => "HasElectronicInvoice"
  element :has_subscription, Boolean, :tag => "HasSubscription"
  element :has_subdomain, Boolean, :tag => "HasSubdomain"
  element :type, String, :tag => "Type"
  element :baza_reklam_customer_id, Integer, :tag => "BazaReklamCustomerId"
  element :subscription, Subscription, :tag => "Subscription"
  element :mailing_address, MailingAddress, :tag => "MailingAddress"
  element :billing_address, BillingAddress, :tag => "BillingAddress"
  has_many :addresses, Address, :tag => "Addresses"
  # TODO - languages, wrong API
  # has_many :languages, Language, :tag => "Languages"
  has_many :languages, String, :tag => 'Languages'

  def self.xpath
    '//Customer'
  end

  def self.xpath_pluralize
    '//Customers'
  end

  def get_languages
    return [] if self.languages.nil? || self.languages.empty?
    self.languages[0].split(' ').map { |l| l.strip if l.strip.length > 0 }.inspect
  end
end