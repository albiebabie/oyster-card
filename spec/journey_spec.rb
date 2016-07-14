require 'journey'


describe Journey do
let(:entry_station) {double :entry_station}
let(:exit_station) {double :exit_station}
  it '#start_journey' do
    subject.start_journey entry_station
    expect(subject).to be_in_journey
  end

  it '#end_journey' do
    subject.start_journey entry_station

    subject.end_journey exit_station
    expect(subject).not_to be_in_journey
  end


  it 'returns complete? for the journey' do
    subject.start_journey entry_station
    expect(subject).not_to be_complete
  end

  it 'calculates fare' do
    subject.start_journey entry_station
    subject.end_journey exit_station
    expect(subject.fare).to eq 1
  end

end
