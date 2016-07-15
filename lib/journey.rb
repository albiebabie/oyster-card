require_relative 'oystercard'

class Journey

  MINIMUM_FARE = 1

  def initialize
    @in_journey = false
    @entry_station = nil
    @journey = []
  end

  def start_a_journey(entry_station)
    @in_journey = true
    @entry_station = entry_station
  end

  def in_journey?
    @in_journey
  end

  def end_a_journey(exit_station)
    @in_journey = false
    @exit_station = exit_station
  end

  def journey_saver
    @journey << { entry_station: @entry_station, exit_station: @exit_station }
  end
  def fare
    MINIMUM_FARE
  end

end
