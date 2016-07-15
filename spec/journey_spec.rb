require 'journey'
require 'oystercard'

describe Journey do

  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe "#start_a_journey" do
    it "user can start_a_journey" do
      expect(subject).to respond_to(:start_a_journey).with(1).argument
    end

    it "should update entry_station" do
      expect(subject.start_a_journey(entry_station)).to eq entry_station
    end

    it "in_journey should be true if user has started a journey" do
      subject.start_a_journey(entry_station)
      expect(subject).to be_in_journey
    end
  end

  describe "#end_a_journey" do
    it "user can end_a_journey" do
      expect(subject).to respond_to(:end_a_journey).with(1).argument
    end

    it "in_journey should be false if user has ended a journey" do
      subject.start_a_journey(entry_station)
      subject.end_a_journey(exit_station)
      expect(subject).to_not be_in_journey
    end

    #it "should record exit_station" do
      #subject.start_journey(entry_station)
      #expect(subject.exit_station).to eq exit_station
    #end
  end

  # describe "#fare" do
  #   it "returns the minimum fare" do
  #     expect(subject).to respond_to :fare
  #     subject.start_a_journey(entry_station)
  #     subject.end_a_journey
  #     expect(subject.fare).to eq described_class::MINIMUM_FARE
  #   end
  #   context "returns the penalty fare if" do
  #     it "user does not touch_out" do
  #       subject.start_a_journey(entry_station)
  #       subject.start_a_journey(entry_station)
  #       expect(subject.fare).to eq 6
  #     end
  #     it "user does not touch_in and then touches_out" do
  #       subject.start_a_journey(entry_station)
  #       subject.start_a_journey(entry_station)
  #       expect(subject.fare).to eq 6
  #     end
  #   end
  #
  # end
end
