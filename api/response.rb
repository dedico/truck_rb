require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"

class Response
  attr_accessor :xml, :errors, :code, :success, :klass
  
  def initialize(response, klass)
    #puts '%%%%% RESPONSE %%%%%'
    #puts response.body
    #puts response.class
    #puts '%%%%%%%%%%%%%%%%%%%%'
    @code = response.code
    @xml = Nokogiri::XML(response.body)
    errors = @xml.xpath("//Errors")
    @success = @xml.xpath("//Status").first.content.downcase == "success"
    @errors = []
    unless @success
      @errors = errors.map { |e| e.content }
    end
    @klass = klass
  end

  def parse(single = true)
    if single
      xml = @xml.xpath(@klass.xpath).to_s
      @klass.parse(xml, :single => true)
    else
      xml = @xml.xpath(@klass.xpath_pluralize).to_s
      @klass.parse(xml)
    end
  end
end