class Car

  attr_accessor :id, :price_per_km, :price_per_day

  def initialize(id, price_per_day, price_per_km)
    @id = Integer(id)
    @price_per_day = Integer(price_per_day)
    @price_per_km = Integer(price_per_km)
  end

  def self.create_from_array(arr)
    self.new(arr["id"], arr["price_per_day"], arr["price_per_km"])
  end

end
