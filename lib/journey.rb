class Journey
  attr_reader :entry_station, :exit_station

  def initialize(entry_station=nil, exit_station=nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    #if incomplete then add penalty = £6
    #otherwise calculate from entry anexit based on some rules - for the moment return the minimum = £1
    complete? ? 1 : 6
  end

end