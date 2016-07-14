require 'journey'


describe Journey do
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }
  let(:journey) {{:start => entry_station, :end => exit_station}}
    describe "journey_history" do
      it "Should be empty on new cards" do
        expect(subject.journey_history).to be_empty
      end
    end
    it "Stores journeys in journey_history" do
      subject.start_journey(entry_station)
      subject.end_journey(exit_station)
      expect(subject.journey_history).to include(journey)
    end

    describe '#start_journey' do
      it 'changes in_journey to true' do
        subject.start_journey entry_station
        expect(subject).to be_in_journey
      end

      it "Stores the entry station" do
        subject.start_journey(entry_station)
        expect(subject.journey[:start]).to be entry_station
      end
    end

  describe '#end_journey' do
    before do
      subject.start_journey entry_station
      subject.end_journey exit_station
    end
    it 'changes in_journey to false' do
      expect(subject).not_to be_in_journey
    end

    it "Stores the exit station" do
      expect(subject.journey[:end]).to be exit_station
    end
  end

  context 'incomplete journey' do
    it 'returns !complete? for unfinished journey' do
      subject.start_journey entry_station
      expect(subject).not_to be_complete
    end
    it 'returns !complete? for unstarted journey' do
      subject.end_journey exit_station
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
