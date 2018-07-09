class Car

  attr_reader :price_per_km, :price_per_day
  attr_accessor :id

  def initialize(price_per_day, price_per_km)
    @id = nil
    @price_per_day = Integer(price_per_day)
    @price_per_km = Integer(price_per_km)
  end

  def self.create_from_array(arr)
    ob = self.new(
        arr["price_per_day"],
        arr["price_per_km"]
    )
    if !arr["id"].nil?
      ob.id = arr["id"]
    end

    return ob
  end

end
