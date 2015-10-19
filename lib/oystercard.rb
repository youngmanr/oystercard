class Oystercard
  attr_reader :balance



  TOP_UP_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up amount
    ((@balance + amount) > TOP_UP_LIMIT) ? (raise "Top up limit #{TOP_UP_LIMIT} exceeded") : (@balance += amount)
  end

  def deduct fare
  	@balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end
end