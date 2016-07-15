require 'oystercard'

class Journey

  attr_reader :entry_station

  def start_a_journey
    @in_journey = true
  end

  def in_journey?
    @in_journey
  end

end
