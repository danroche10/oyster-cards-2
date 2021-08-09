require_relative 'journey_log'
require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_accessor :balance, :current_journey, :journey_log

  MIN_CHARGE = 1
  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0

  def initialize(amount=DEFAULT_AMOUNT, journey_log = JourneyLog.new)
    @balance = amount
    @journey_log = journey_log
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
    deduct(@journey_log.touch_out_fare(station))
    @journey_log.finish(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

Southgate = Station.new("Southgate", 4)
Farringdon = Station.new("Farringdon", 1)
Angel = Station.new("Angel", 1)
Morden = Station.new("Morden", 3)
Oakwood = Station.new("Morden", 5)
High_Barnet = Station.new("High Barnet", 4)

my_oyster = Oystercard.new
my_oyster.top_up(50)
my_oyster.touch_in(Southgate)
my_oyster.touch_out(Farringdon)

p my_oyster.balance

# forgot tap in

my_oyster.touch_out(Farringdon)
# p my_oyster.journey_history
p my_oyster.balance

#  forgot to tap out
my_oyster.touch_in(Southgate)

#  and then a full journey again
my_oyster.touch_in(Southgate)
p my_oyster.balance
my_oyster.touch_out(Morden)
p my_oyster.balance
p my_oyster.journey_log








