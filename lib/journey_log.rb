require_relative 'journey'

class JourneyLog
  attr_accessor  :journey_history, :current_journey

  PENALTY_FARE = 6

  def initialize(journey = Journey.new)
    @current_journey = journey
    @journey_history = []
  end

  def start(station)
    forgot_tap_out if @current_journey.forgot_to_tap_out?
    @current_journey.start_journey(station)
  end

  def finish(station, journey = Journey.new)
    @current_journey.finish_journey(station)
    @journey_history << @current_journey.status
    @current_journey = journey
  end

  def check_journey
    @current_journey.in_journey?
  end

  def forgot_tap_out(journey = Journey.new)
    @journey_history << @current_journey.status
    @current_journey = journey
  end

  def list_journeys
    @journey_history.each do |journey|
      "Entry station: #{journey[:entry_station]} --> Exit station: #{journey[:exit_station]}\n"
    end
  end

  def touch_in_fare
    @current_journey.forgot_to_tap_out? ? PENALTY_FARE : 0
  end

  def touch_out_fare(exit_station)
    !@current_journey.in_journey? ? PENALTY_FARE : @current_journey.standard_fare(exit_station)
  end

  private

  def current_journey
  end
end

