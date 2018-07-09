class CommissionService

  def initialize(config)
    @config = config
  end

  def get_commission(price, period)
    price = price

    total = Float(@config["total"]/Float(100)) * price
    assistance = @config["assistance"] * period
    insurance = Float(@config["insurance"])/Float(100) * total
    drivy = total - (assistance + insurance)

    Commission.new(Integer(total), Integer(assistance), Integer(insurance), Integer(drivy))
  end
end