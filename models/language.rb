require "happymapper"

class Language
  include HappyMapper

  tag 'Language'
  element :code, String, :tag => "Code"
end