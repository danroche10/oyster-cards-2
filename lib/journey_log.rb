require './lib/journey'

class JourneyLog
  attr_accessor :entry_station, :exit_station
  attr_reader :journey_class, :journeys

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    exit_station = nil
    current_journey = journey_class
    current_journey.entry_station = entry_station
    @entry_station = entry_station
    
  end

  def finish(exit_station)
    @exit_station = exit_station
    @journeys << { entry_station: entry_station, exit_station: exit_station }
    entry_station = nil
  end

  def list_journeys
    print journeys
  end

  private

  def current_journey

  end
end