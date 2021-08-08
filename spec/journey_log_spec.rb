require 'journey_log'

describe JourneyLog do

  let(:station) { double(:station) }

  describe "#initialize" do
    it "initially has no journey history" do
      expect(subject.journey_history).to eq []
    end
  end

  describe "#start" do
    it "starting and finshing journey updates journey history" do
      subject.start(station)
      subject.finish(station)
      expect(subject.journey_history.length).to eq 1
    end
  end
end