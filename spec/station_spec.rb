require 'station'

describe Station do

  let(:subject) { described_class.new("Old Street", 1) }

  it "responds to name" do
    expect(subject.name).to eq "Old Street"
  end

  it "responds to zone" do
    expect(subject.zone).to eq 1
  end
end
