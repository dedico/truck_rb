require 'open-uri'
require 'nokogiri'
require 'net/http'
require "uri"

class Request
  attr_accessor :response

	def initialize(host, port, user, password, query)
    http = Net::HTTP.new(host, port)
    version = "1.0"
    request_xml = "<Request><UserId>#{user}</UserId><Password>#{password}</Password><Version>#{version}</Version>#{query.query}</Request>"
    headers = {
      'Content-Type' => 'text/xml'
    }

    post = Net::HTTP::Post.new(query.method)
    post.body = request_xml

    # puts '%%%%% REQUEST %%%%%'
    # puts http.address
    # puts http.port
    # puts post.path
    # puts post.body
    # puts '%%%%%%%%%%%%%%%%%%%%'

    api_response = http.post(post.path, post.body, headers)
    #@response = Response.new(api_response)
    @response = http.post(post.path, post.body, headers)
  end
end