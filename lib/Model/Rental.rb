require "date"

class Rental

  attr_reader :distance, :car, :start_date, :end_date
  attr_accessor :discount, :commission, :id

  def initialize(car, start_date, end_date, distance, discount = 0)
    @id = nil
    @car = car
    @start_date = DateTime.parse(start_date)
    @end_date = DateTime.parse(end_date)
    @distance = Integer(distance)
    @commission = nil
    @discount = discount
  end

  def self.create_from_array(arr)
    ob = self.new(
        arr["car"],
        arr["start_date"],
        arr["end_date"],
        arr["distance"],
        arr["discount"].nil?? 0: arr["discount"]
    )

    if !arr["id"].nil?
      ob.id = arr["id"]
    end

    return ob
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

  def get_transactions
    transactions = []

    transactions << Transaction.new(User::DRIVER, TransactionType::DEBIT, self.get_cost)

    if self.commission
      transactions << Transaction.new(User::CAR_OWNER, TransactionType::CREDIT, (self.get_cost - self.commission.total))
      transactions << Transaction.new(User::INSURANCE, TransactionType::CREDIT, self.commission.insurance)
      transactions << Transaction.new(User::ASSISTANCE, TransactionType::CREDIT, self.commission.assistance)
      transactions << Transaction.new(User::DRIVY, TransactionType::CREDIT, self.commission.drivy)
    end

    transactions
  end
end
