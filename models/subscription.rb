require "happymapper"

class Subscription
  include HappyMapper

  tag 'Subscription'
  element :id, Integer, :tag => "Id"
  element :promotion, String, :tag => "Promotion"
  element :status, String, :tag => "Status"
  element :ad_amount, Integer, :tag => "AdAmount"
  element :start_date, Time, :tag => "StartDate"
  element :end_date, Time, :tag => "EndDate"
end