require 'date'

class Rental

  attr_accessor :distance, :start_date, :id, :car, :end_date

  def initialize(id, car, start_date, end_date, distance)
    @id = Integer(id)
    @car = car
    @start_date = DateTime.parse(start_date)
    @end_date = DateTime.parse(end_date)
    @distance = Integer(distance)
  end

  def self.create_from_array(arr)
    self.new(
        arr['id'],
        arr['car'],
        arr['start_date'],
        arr['end_date'],
        arr['distance']
    )
  end

  def get_cost
    period_day = Integer((@end_date - @start_date) + 1)

    (period_day * car.price_per_day) + (@distance * car.price_per_km)
  end

end
