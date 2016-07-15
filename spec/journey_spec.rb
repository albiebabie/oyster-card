require 'journey'
require 'oystercard'

describe Journey do
  describe "#start_a_journey" do
    it "user can start_a_journey" do
      expect(subject).to respond_to :start_a_journey
    end
    it "in_journey should be true if user has started a journey" do
      subject.start_a_journey
      expect(subject).to be_in_journey
    end
  end

  describe "#end_a_journey" do
    it "user can end_a_journey" do
      expect(subject).to respond_to :end_a_journey
    end
    it "in_journey should be false if user has ended a journey" do
      subject.start_a_journey
      subject.end_a_journey
      expect(subject).to_not be_in_journey
    end
  end

  describe "#fare" do
    it "the user should be charged the minum journey fare" do
      expect(subject).to respond_to :fare
    end
  end
end
