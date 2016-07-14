require 'journey'


describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

    it '#start_journey' do
      subject.start_journey entry_station
      expect(subject).to be_in_journey
    end


  describe '#end_journey' do
    it 'changes in_journey to true' do
      subject.start_journey entry_station

      subject.end_journey exit_station
      expect(subject).not_to be_in_journey
    end


    it 'returns complete? for the journey' do
      subject.start_journey entry_station
      expect(subject).not_to be_complete
    end
  end

  describe "#fare" do
    it 'charges minimum fare' do
      subject.start_journey entry_station
      subject.end_journey exit_station
      expect(subject.fare).to eq described_class::MINIMUM_FARE
    end
    it 'charges penalty fare if not touched out' do
      subject.start_journey entry_station
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
    it 'charges penalty fare if not touched in' do
      subject.end_journey exit_station
      expect(subject.fare).to eq described_class::PENALTY_FARE
    end
  end

end
