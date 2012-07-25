class CustomerQuery
  attr_accessor :id, :query, :method
  
  def initialize(id)
    @id = id
    @query = "<CustomerQuery><Id>#{@id}</Id></CustomerQuery>"
    @method = '/api/customers/find'
  end

  def find_all_offers(category_id = 0)
    @query = "<Query><CustomerId>#{@id}</CustomerId></Query>"
    if category_id > 0
      @query = "<Query><CustomerId>#{@id}</CustomerId><CategoryId>#{category_id}</CategoryId></Query>"
    end
    @method = '/api/ads/findbycustomer'
  end

end