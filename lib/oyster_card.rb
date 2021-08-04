require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :entry_station, :journeys

  MAX_AMOUNT = 90
  DEFAULT_AMOUNT = 0
  MIN_CHARGE = 1

  def initialize(amount=DEFAULT_AMOUNT)
    @balance = amount
    @in_use = false
    @journeys = []
  end

  def top_up(amount)
    raise "Max amount exceeded" if (@balance + amount) > MAX_AMOUNT
    @balance += amount
  end

  def in_journey?
    !entry_station.nil?
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_CHARGE

    @in_use = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_CHARGE) 
    @in_use = false
    my_journey = Journey.new(entry_station, station)
    journey = {@entry_station => station}
    @journeys << journey
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end

my_oyster = Oystercard.new
my_oyster.top_up(50)
my_oyster.touch_in("Southgate")
my_oyster.touch_out("Farringdon")
