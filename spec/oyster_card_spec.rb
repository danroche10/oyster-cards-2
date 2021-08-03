require 'oyster_card'

describe Oystercard do
  let(:station) { double :station }
  let(:card) { described_class.new(10) }

  it "has a balance of 0" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do

   it 'responds to top_up' do
    expect(subject).to respond_to(:top_up).with(1).argument
   end
   
   it 'tops up an oyster card' do
     expect(subject.top_up(5)).to eq 5
   end

   it 'returns an error if top-up amount exceeds max amount' do
    expect { subject.top_up(91) }.to raise_error "Max amount exceeded"
   end

   it 'returns and error if the new balance exceeds max amount' do
    expect { 10.times { subject.top_up(10) } }.to raise_error "Max amount exceeded"
   end

  end

  describe '#deduct' do

    # it 'responds to deduct' do
    #   expect(subject).to respond_to(:deduct).with(1).argument
    #  end
     
    it 'tops up an oyster card' do
      result = card.send(:deduct,5)
      expect(result).to eq 5
     end
  end

  describe '#in_journey?' do
    
    it 'a new card is out of use' do
      expect(subject).not_to be_in_journey
    end

    context 'after touching in' do

      it 'it is in use' do
        card.touch_in(station)
        expect(card).to be_in_journey
      end
    
    end

    context 'after touching out' do

      it 'it out of use' do
        card.touch_in(station)
        card.touch_out(station)
        expect(card).not_to be_in_journey
      end

    end

  end

  describe '#touch_in' do

    it 'returns an error if balance is below £1' do
      expect { subject.touch_in(station) }.to raise_error "Insufficient funds"
    end

    it 'remembers touch  in station' do
      card.touch_in(station)
      expect(card.entry_station).to eq station
    end

  end

  describe '#touch_out' do

    it 'deduct from £1 from balance' do
      expect { card.touch_out(station) }.to change { card.balance }.by(-1)
    end

    it 'forgets entry station' do
      card.touch_in(station)
      card.touch_out(station)
      expect(card.entry_station).to be_nil
    end
  end

  describe 'journeys' do

    it 'is empty by default' do
      expect(subject.journeys).to be_empty
    end

    it 'creates one journey from touching in and out' do
      card.touch_in(station)
      expect { card.touch_out(station) }.to change { card.journeys.count }.by(1)
    end
  end




end

