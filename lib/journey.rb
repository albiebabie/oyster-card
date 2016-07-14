class Journey

MINIMUM_FARE = 1
PENALTY_FARE = 6

  attr_reader :journey, :journey_history

  def initialize
    @journey = {}
    @journey_history = []
  end

  def start_journey(entry_station)
    @in_journey = true
    @journey[:start] = entry_station
  end

  def end_journey(exit_station)
    @in_journey = false
    @journey[:end] = exit_station
    @journey_history << @journey.clone
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
