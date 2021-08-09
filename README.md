Oystercard Challenge
=================
This is the week 2 Makers Academy challenge. This project was built in the afternoons as part of the pair programming sessions. I also did some individual work afterwards to complete the challenge and refactor the code.

Prerequisites
-------
- You have installed Ruby

How to install
-------

1. Fork this repo, and clone to your local machine.
2. Run the command `gem install bundler` (if you don't have bundler already).
3. When the installation completes, run `bundle`.

Building the program
-------
- Jam Board was used to map out the user stories with classes being assigned to JorneyLog, Journey, OysterCard and Station.
- The project was built using TDD and broadly followed the red, green, refactor process.

How to use this program
-------
- Create an Oyster Card balance with a default balance of your choice (you can always top it up later).
- You will also need to create some stations, making sure that you initialise them with both a name and a zone number.
- You can make some journeys by touching in and out of the stations you have created.
- If you either forget to tap in or out, you will be charged the penalty fare. If not, your fare will depend on how many zones you have travelled.

Below is an example of how to use the program:
```
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
```
User Stories
---------
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated

```