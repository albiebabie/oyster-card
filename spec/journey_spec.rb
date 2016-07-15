require 'journey'
require 'oystercard'

describe Journey do

  context "#in_journey?" do
    it "should be true if user has touched_in" do
      subject.start_a_journey
      expect(subject).to be_in_journey
    end
  end

  # it "should allow a user to touch_in" do
  #   expect(subject).to be_in_journey
  # end

end
