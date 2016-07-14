class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :journey

  def initialize
    @journey = {}
  end

  def start_journey(entry_station)
    @in_journey = true
    @journey[:start] = entry_station
  end

  def end_journey(exit_station)
    @in_journey = false
    @journey[:end] = exit_station
  end

  def in_journey?
    @in_journey
  end

  def complete?
    !@journey[:start].nil? && !@journey[:end].nil?
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end
end
