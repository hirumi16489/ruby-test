class Amount

  attr_reader :value

  def initialize(value)
    @value = Integer(value)
  end

  def sum(a)
    self.new(a.value + self.value)
  end

  def sub(a)
    self.new(a.value - self.value)
  end
end