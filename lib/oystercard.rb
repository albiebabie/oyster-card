require_relative 'journey'
class Oystercard

  attr_reader :balance, :min_fare, :journey

  LIMIT = 150

  def initialize
    @balance = 0
    @min_fare = Journey::MINFARE
    @journey = Journey.new
  end

  def top_up amount
    fail "limit #{LIMIT} reached" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in entry_station
    fail "balance too low" if @balance < @min_fare
    @journey.start_journey entry_station
  end

  def touch_out exit_station
    @journey.end_journey exit_station
    deduct(@journey.fare)
  end
  def history
    @journey.history
  end


  private

  def deduct amount
    @balance -= amount
  end

end
