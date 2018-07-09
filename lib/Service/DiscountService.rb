class DiscountService

  def initialize(config)
    @day_discount = self.build_day_discount_config_chain(config["discount_percent_after_day"].sort.to_h)
  end

  def build_day_discount_config_chain(config)
    first = nil
    prev = nil
    config.each do |after_day, percent|
      discount = DayDiscountConfig.new(percent, after_day)

      if !first
        first = discount
      end

      if prev
        prev.next = discount
      end

      prev = discount
    end

    first
  end

  def day_discount_compute(price_per_day, period)
    @day_discount.compute(price_per_day, period)
  end
end