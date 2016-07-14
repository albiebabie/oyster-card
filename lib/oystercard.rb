
require_relative 'station'
require_relative 'journey'
class Oystercard

  LIMIT = 90
  MIN_BALANCE = 1

  attr_accessor :balance, :entry_station, :exit_station, :journey_history, :journey


  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
    @journey = Journey.new
  end

  def journey(entry_station, exit_station)
    @journey = { entry_station: entry_station, exit_station: exit_station }
  end

  def top_up(amount)
    error = "Top up would exceed card limit of £#{LIMIT}"
    raise error if (amount + @balance) > LIMIT
    @balance += amount
  end

  def touch_in(station)
    raise 'Insufficient balance' unless @balance >= MIN_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(journey.fare)
  end

  def in_journey?
    @entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
