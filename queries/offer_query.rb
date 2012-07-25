class AdQuery
  attr_accessor :query, :method
  
  def initialize(id)
    @query = "<AdQuery><Id>#{id}</Id></AdQuery>"
    @method = '/api/ads/details'
  end
  
end