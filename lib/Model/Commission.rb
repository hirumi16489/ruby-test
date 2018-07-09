class Commission

  attr_reader :drivy, :total, :assistance, :insurance

  def initialize(total, assistance, insurance, drivy)
    @total = total
    @assistance = assistance
    @insurance = insurance
    @drivy = drivy
  end
end
