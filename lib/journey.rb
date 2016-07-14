class Journey
  attr_reader :journey, :history, :complete
  MINFARE = 1
  PENALTY = 6
  def initialize
    @journey = {}
    @history = []
    @complete = false
  end
  def start_journey entry_station
    @journey[:enter] = entry_station
  end

  def in_journey?
    !@journey[:enter].nil?
  end

  def end_journey exit_station
    # require 'pry'; binding.pry
    @journey[:exit] = exit_station
    @history << @journey.clone
    @complete = !@journey[:enter].nil? && !@journey[:exit].nil?
    @journey[:enter] = nil
  end

  def complete?
    @complete
  end

  def fare
    if complete?
      MINFARE
    else
      PENALTY
    end
  end
end
