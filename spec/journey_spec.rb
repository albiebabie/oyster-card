require 'journey'
describe Journey do
let(:enter_station) { double :enter_station }
let(:exit_station) {double :exit_station}
let(:journey) {{:enter => enter_station, :exit => exit_station}}


  it "starts journey" do
    subject.start_journey enter_station
    expect(subject).to be_in_journey
  end

  it "ends journey" do
    subject.end_journey exit_station
    expect(subject).not_to be_in_journey
  end

  it "returns complete journey" do
    subject.start_journey enter_station
    subject.end_journey exit_station
    expect(subject).to be_complete
  end

  it 'in_journey returns false initially' do
    expect(subject).not_to be_in_journey
  end

  it 'saves journey inside history' do
    subject.start_journey enter_station
    subject.end_journey exit_station
    expect(subject.history).to include journey
  end

  describe '#start_journey' do
    before do
      subject.start_journey enter_station
    end
    it 'sets in_journey true' do
      expect(subject).to be_in_journey
    end
    it 'stores entry station' do
      expect(subject.journey[:enter]).to eq enter_station
    end
  end

  describe '#end_journey' do

    before do
      subject.start_journey enter_station
    end

    it 'sets in_journey false' do
      subject.end_journey exit_station
      expect(subject).not_to be_in_journey
    end
    it 'sets entry station to nil' do
      subject.end_journey exit_station
      expect(subject.journey[:enter]).to be_nil
    end
  end

  it 'calculates the fare' do
    subject.start_journey enter_station
    subject.end_journey exit_station
    expect(subject.fare).to eq described_class::MINFARE
  end
  it 'calculates the fare' do
    subject.end_journey exit_station
    expect(subject.fare).to eq described_class::PENALTY
  end
end
