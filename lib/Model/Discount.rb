class Discount

  attr_reader :amount

  def initialize(amount)
    raise "amount must be a Amount" unless amount.kind_of? Amount

    @amount = amount
  end
end