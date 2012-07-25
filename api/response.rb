require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"

class Response
  attr_accessor :xml, :errors, :code, :success, :error, :warnings, :klass
  
  def initialize(response)
    @code = response.code
    @xml = Nokogiri::XML(response.body)
    errors = @xml.xpath("//Errors")
    @success = @xml.xpath("//Status").first.content.downcase == "success"
    @error = @xml.xpath("//Status").first.content.downcase == "error"
    
    @errors = []
    if @error
      @errors = errors.map { |e| e.content }
    end
    @warnings = []
    if @xml.xpath("//Warnings").size > 0
      @warnings = @xml.xpath("//Warnings").map { |e| e.content }
    end
  end

  def parse(klass, single = true)
    if single
      xml = @xml.xpath(klass.xpath).to_s
      klass.parse(xml, :single => true)
    else
      xml = @xml.xpath(klass.xpath_pluralize).to_s
      klass.parse(xml)
    end
  end
end