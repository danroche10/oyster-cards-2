require_relative 'journey'

class JourneyLog
  attr_accessor  :journey_history
  attr_reader :journey_class,

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journey_history = []
  end

  # def start(entry_station)
  #   exit_station = nil
  #   current_journey = journey_class
  #   current_journey.entry_station = entry_station
  #   @entry_station = entry_station
    
  # end

  # def finish(exit_station)
  #   @exit_station = exit_station
  #   @journeys << { entry_station: entry_station, exit_station: exit_station }
  #   print journey_class.fare
  #   entry_station = nil
  # end

  def list_journeys
    print journeys
  end

  private

  def current_journey

  end
end

# my_journey_log = JourneyLog.new
# my_journey_log.start("Farringdon")
# my_journey_log.finish("Euston")
# my_journey_log.start("Angel")
# my_journey_log.finish("Oakwood")
# my_journey_log.list_journeys
