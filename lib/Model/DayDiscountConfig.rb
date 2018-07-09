class DayDiscountConfig

  attr_reader :after_day

  def initialize(percent, after_day)
    @percent = percent
    @after_day = after_day
    @next = nil
  end

  def next=(next_elem)
    @next = next_elem
  end

  def compute(price_per_day, period)

    if period <= @after_day
      return 0
    end

    price = 0
    limit = period
    if @next
      price += @next.compute(price_per_day, period)
      if period > @next.after_day
        limit = @next.after_day
      end
    end

    for i in (@after_day + 1)..limit do
      price += (Float(@percent)/Float(100)) * price_per_day
    end

    Integer(price)
  end
end