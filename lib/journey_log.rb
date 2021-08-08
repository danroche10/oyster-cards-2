require_relative 'journey'

class JourneyLog
  attr_accessor  :journey_history, :current_journey

  MIN_CHARGE = 1
  PENALTY_FARE = 6

  def initialize
    @current_journey = Journey.new
    @journey_history = []
  end

  def start(station)
    forgot_tap_out if @current_journey.forgot_to_tap_out?
    @current_journey.start_journey(station)
  end

  def finish(station)
    @current_journey.finish_journey(station)
    @journey_history << @current_journey.status
    @current_journey = Journey.new
  end

  def check_journey
    @current_journey.in_journey?
  end

  def forgot_tap_out
    @journey_history << @current_journey.status
    @current_journey = Journey.new
  end

  def list_journeys
    @journey_history.each do |journey|
      print "Entry station: #{journey[:entry_station]} --> Exit station: #{journey[:exit_station]}\n"
    end
  end

  def touch_in_fare
    @current_journey.forgot_to_tap_out? ? PENALTY_FARE : 0
  end

  def touch_out_fare
    !@current_journey.in_journey? ? PENALTY_FARE : MIN_CHARGE
  end

  private

  def current_journey

  end
end

# journey_log = JourneyLog.new
# journey_log.start("Farringdon")
# journey_log.finish("Angel")
# # print journey_log.journey_history

# # forgot tap in
# journey_log.finish("Farringdon")
# # print journey_log.journey_history

# # forgot to tap out
# journey_log.start("Morden")

# # and then full journey again
# journey_log.start("Oakwood")
# journey_log.finish("High Barnet")
# print journey_log.journey_history





