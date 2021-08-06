require 'journey'

describe Journey do

  let(:oystercard) { instance_double("osytercard") }

  describe "#initialize" do
    it "should have no entry or exit station recorded" do
      expect(subject.status).to eq({entry_station: "None recorded", exit_station: "None recorded"})
    end
  end

  describe "#start_journey" do
    it "should record entry station" do
      subject.start_journey('Mayfair')
      expect(subject.status[:entry_station]).to eq 'Mayfair'
    end

    context "customer forgets to tap out" do
      it "should record entry station in journey" do
        allow(oystercard).to receive(:journey_history).and_return([{:entry_station => 'Borough', :exit_station => "None recorded"}])
        subject.start_journey('Mayfair')
        subject.start_journey('Borough')
        expect(oystercard.journey_history.last).to eq({:entry_station => 'Borough', :exit_station => "None recorded"})
      end
    end
  end

  describe "#finish_journey" do
    it "should record exit station" do
      subject.start_journey('Mayfair')
      subject.finish_journey('Chiswick')
      expect(subject.status[:exit_station]).to eq 'Chiswick'
    end

    context "customer forgets to tap in" do
      it "should record a journey" do
        subject.finish_journey('Green Park')
        expect(subject.status).to eq({:entry_station => "None recorded", :exit_station => 'Green Park'})
      end
    end
  end
end

  # it 'is an instance of' do
  #   expect(subject).to be_instance_of(Journey)
  # end

  # describe '#complete?' do

  #   it 'incomplete if entry station missing' do
  #     journey  = Journey.new(nil,'Bethnal Green')
  #     expect(journey).not_to be_complete
  #   end


  #   it 'incomplete if exit station missing' do
  #     journey  =  Journey.new('Bethnal Green')
  #     expect(journey).not_to be_complete
  #   end


  #   it 'complete if neither station missing' do
  #     journey  = Journey.new('Bethnal Green', 'Liv St')
  #     expect(journey).to be_complete
  #   end

  # end

  # describe '#fare' do

  #   context 'journey complete' do
      
  #     it 'cost is minimum' do
  #       journey  = Journey.new('Bethnal Green', 'Liv St')
  #       expect(journey.fare).to eq 1
  #     end
  #   end
    
  #   context 'journey incomplete' do

  #     it 'cost is max' do
  #       journey  = Journey.new('Bethnal Green')
  #       expect(journey.fare).to eq 6
  #     end

  #   end
    
  # end
