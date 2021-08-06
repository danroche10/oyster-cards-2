require_relative 'journey_log'
require_relative 'journey'

class Oystercard

  attr_accessor :balance, :current_journey, :journey_history 

  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0
  MIN_CHARGE = 1
  PENALTY_FARE = 6

  def initialize(amount=DEFAULT_AMOUNT)
    @balance = DEFAULT_AMOUNT
    @current_journey = Journey.new
    @journey_history = []
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_CHARGE
    
    forgot_tap_out if @current_journey.forgot_to_tap_out?
    @current_journey.start_journey(station)
  end

  def touch_out(station)
    @current_journey.finish_journey(station)
    deduct(fare)
    @journey_history << @current_journey.status
    @current_journey = Journey.new
  end

  def check_journey
    @current_journey.in_journey?
  end

  private

  def fare
    if current_journey.status[:exit_station] == "None recorded" && current_journey.status[:entry_station] != "None recorded"
      PENALTY_FARE
    else
      MIN_CHARGE
    end
  end

  def forgot_tap_out
    deduct(PENALTY_FARE)
    @journey_history << @current_journey.status
    @current_journey = Journey.new
  end

  def deduct(amount)
    @balance -= amount
  end

end

# Full journey


log = Journey
my_oyster = Oystercard.new
my_oyster.top_up(50)
my_oyster.touch_in("Southgate")
my_oyster.touch_out("Farringdon")
p my_oyster.balance
p my_oyster.journey_history

# forgot tap in

my_oyster.touch_out("Farringdon")
p my_oyster.balance
p my_oyster.journey_history

# forgot to tap out
my_oyster.touch_in("Southgate")

# and then a full journey again
my_oyster.touch_in("Southgate")
my_oyster.touch_out("Morden")
p my_oyster.balance
p my_oyster.journey_history








