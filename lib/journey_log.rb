require './lib/journey'

class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    current_journey = journey_class
    current_journey.entry_station = entry_station
    @journeys << {}
    @journeys.last[entry_station] = ""
  end

  def finish(exit_station)
    @journeys.last[:entry_station] = exit_station
  end

  def list_journeys
    print journeys
  end

  private

  def current_journey

  end
end