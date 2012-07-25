require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"

class Request
  attr_accessor :response, :host, :port, :path, :body, :headers

	def initialize(host, port, user, password, query)
    http = Net::HTTP.new(host, port)
    version = "1.0"
    request_xml = "<Request><UserId>#{user}</UserId><Password>#{password}</Password><Version>#{version}</Version>#{query.query}</Request>"
    @headers = {
      'Content-Type' => 'text/xml'
    }

    post = Net::HTTP::Post.new(query.method)
    post.body = request_xml

    @host = http.address
    @port = http.port
    @path = post.path
    @body = post.body
    @response = http.post(@path, @body, @headers)
  end
end