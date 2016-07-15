require 'station'
describe 'Station' do

subject { Station.new(name: "Old Street", zone: 1) }

    it "responds to name" do
      expect(subject.name).to eq "Old Street"
    end

    it "responds to zone" do
      expect(subject.zone).to eq 1
    end
end
