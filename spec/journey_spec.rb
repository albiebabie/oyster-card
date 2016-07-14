require 'journey'

describe Journey do

  it 'starts journey' do
    subject.start_journey
    expect(subject).to be_in_journey
  end
  it 'ends journey' do
    subject.start_journey
    subject.end_journey
    expect(subject).not_to be_in_journey
  end
end
