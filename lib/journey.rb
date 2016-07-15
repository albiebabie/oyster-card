require 'oystercard'

class Journey

  MINIMUM_FARE = 1

  def initialize
    @in_journey = false
  end

  def start_a_journey(entry_station)
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def end_a_journey
    @in_journey = false
  end

  def fare
    MINIMUM_FARE
  end

end
