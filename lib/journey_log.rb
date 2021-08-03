require './lib/journey'

class JourneyLog

  attr_reader :journey_class, :journeys

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)

  end

  def finish(exit_station)
  
  end

  def journeys

  end

  private

  def current_journey

  end
end