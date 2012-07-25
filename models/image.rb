require "happymapper"

class Image
  include HappyMapper

  tag 'Image'
  element :id, String, :tag => "Id"
  element :original_name, String, :tag => "OriginalName"
  element :url, String, :tag => "Url"
  element :is_default, Boolean, :tag => "IsDefault"
end