require_relative 'journey_log'
require_relative 'journey'

class Oystercard

  attr_accessor :balance, :current_journey, :journey_log

  MIN_CHARGE = 1
  
  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0

  def initialize(amount=DEFAULT_AMOUNT)
    @balance = amount
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_CHARGE
    deduct(@journey_log.touch_in_fare)
    @journey_log.start(station)
  end

  def touch_out(station)
    deduct(@journey_log.touch_out_fare)
    @journey_log.finish(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

# # Full journey


# # log = Journey
# my_oyster = Oystercard.new
# my_oyster.top_up(50)
# my_oyster.touch_in("Southgate")
# my_oyster.touch_out("Farringdon")

# p my_oyster.balance


# # forgot tap in

# my_oyster.touch_out("Farringdon")
# # p my_oyster.journey_history
# p my_oyster.balance

# #  forgot to tap out
# my_oyster.touch_in("Southgate")

# #  and then a full journey again
# my_oyster.touch_in("Southgate")
# p my_oyster.balance
# my_oyster.touch_out("Morden")
# p my_oyster.balance
# p my_oyster.journey_log.list_journeys








