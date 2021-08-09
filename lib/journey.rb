class Journey
  attr_accessor :status

  def initialize
    @status = {
    entry_station: 'None recorded',
    exit_station: 'None recorded'
    }
  end

  def start_journey(station)
    @status[:entry_station] = station
  end

  def finish_journey(station)
    @status[:exit_station] = station
  end

  def in_journey?
    @status[:entry_station] != "None recorded"
  end

  def forgot_to_tap_out?
    @status[:entry_station] != "None recorded" && @status[:exit_station] == "None recorded"
  end

  def standard_fare(exit_station)
    1 + (exit_station.zone - @status[:entry_station].zone).abs
  end

end