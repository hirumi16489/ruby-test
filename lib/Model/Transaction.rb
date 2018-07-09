class Transaction

  attr_reader :amount, :type, :user

  def initialize(user, type, amount)
    @user = user
    @type = type
    @amount = amount
  end
end