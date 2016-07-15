#require 'oystercard'

class Journey

  attr_reader :entry_station

  def initialize
    @in_journey = false
  end

  def start_a_journey
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

  def end_a_journey
    @in_journey = false
  end
end
