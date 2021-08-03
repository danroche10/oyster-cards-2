require 'journey_log'

describe JourneyLog do

  let(:station) { double(:station) }

  describe "#initialize" do
    it "initially has no journey history" do
      expect(subject.journeys).to eq []
    end
  end

  describe "#start" do
    it "creates new instance of journey class" do
      subject.start(station)
      subject.finish(station)
      subject.list_journeys
      expect(subject.journeys.length).to eq 1
    end
  end


end