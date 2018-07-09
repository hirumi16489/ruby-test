require "date"

class Rental

  attr_reader :distance, :car, :start_date, :id, :end_date, :discount, :commission
  attr_writer :discount, :commission

  def initialize(id, car, start_date, end_date, distance, discount = 0)
    @id = Integer(id)
    @car = car
    @start_date = DateTime.parse(start_date)
    @end_date = DateTime.parse(end_date)
    @distance = Integer(distance)
    @commission = nil
    @discount = discount
  end

  def self.create_from_array(arr)
    self.new(
        arr["id"],
        arr["car"],
        arr["start_date"],
        arr["end_date"],
        arr["distance"],
        arr["discount"].nil?? 0: arr["discount"]
    )
  end

  def get_period
    Integer((@end_date - @start_date) + 1)
  end

  def get_raw_period_price
    self.get_period * car.price_per_day
  end

  def get_period_price
    self.get_raw_period_price - @discount
  end

  def get_raw_cost
    self.get_raw_period_price + (@distance * car.price_per_km)
  end

  def get_cost
    self.get_period_price + (@distance * car.price_per_km)
  end

end
