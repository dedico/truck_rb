require "happymapper"

class Parameter
  include HappyMapper

  tag 'Parameter'
  element :id, Integer, :tag => "Id"
  element :value, String, :tag => "Value"
  element :unit, String, :tag => "Unit"
end