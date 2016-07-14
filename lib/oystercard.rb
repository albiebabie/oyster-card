
require_relative 'station'
require_relative 'journey'
class Oystercard

  LIMIT = 90
  MIN_BALANCE = 1
  INIT_BALANCE = 0

  attr_accessor :balance, :journey

  def initialize
    @balance = INIT_BALANCE
    @journey = Journey.new
  end

  def top_up(amount)
    error = "Top up would exceed card limit of £#{LIMIT}"
    raise error if (amount + @balance) > LIMIT
    @balance += amount
  end

  def touch_in(station)
    deduct(@journey.fare) if @journey.in_journey?
    raise 'Insufficient balance' unless @balance >= MIN_BALANCE
    @journey.start_journey station
  end

  def touch_out(station)
    # require 'pry'; binding.pry
    @journey.end_journey station
    deduct(@journey.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
