class Oystercard
  attr_reader :balance

  TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
  end

  def top_up amount
    ((@balance + amount) > TOP_UP_LIMIT) ? (raise "Top up limit #{TOP_UP_LIMIT} exceeded") : (@balance += amount)
  end

  def deduct fare
  	@balance -= fare
  end
end