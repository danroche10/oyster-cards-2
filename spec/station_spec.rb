require 'station'

describe Station do

  subject(:station) { described_class.new("Bethnal Green", 1) }

  describe "#initialize" do

    it "has correct station name" do
      expect(station.name).to eq "Bethnal Green"
    end

    it "has correct zone" do
      expect(station.zone).to eq 1
    end

  end


end