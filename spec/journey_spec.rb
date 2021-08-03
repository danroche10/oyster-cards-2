require './lib/journey'

describe Journey do
  
  it 'is an instance of' do
    expect(subject).to be_instance_of(Journey)
  end

  describe '#complete?' do

    it 'incomplete if entry station missing' do
      journey  = Journey.new(nil,'Bethnal Green')
      expect(journey).not_to be_complete
    end


    it 'incomplete if exit station missing' do
      journey  =  Journey.new('Bethnal Green')
      expect(journey).not_to be_complete
    end


    it 'complete if neither station missing' do
      journey  = Journey.new('Bethnal Green', 'Liv St')
      expect(journey).to be_complete
    end

  end

  describe '#fare' do

    context 'journey complete' do
      
      it 'cost is minimum' do
        journey  = Journey.new('Bethnal Green', 'Liv St')
        expect(journey.fare).to eq 1
      end
    end
    
    context 'journey incomplete' do

      it 'cost is max' do
        journey  = Journey.new('Bethnal Green')
        expect(journey.fare).to eq 6
      end

    end
    

  end

end
