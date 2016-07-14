
require "oystercard"
require "journey"

describe Oystercard do

  let (:station){ double :station }

  it 'Has a default balance of 0' do
    expect(subject.balance).to eq described_class::INIT_BALANCE
  end

  describe "#top_up" do
    before(:each) { subject.top_up(described_class::LIMIT) }
    it "Can be topped up" do
      expect(subject.balance).to eq described_class::LIMIT
    end
    it "Raises error when top up exceeds limit" do
      expect{ subject.top_up(described_class::LIMIT) }.to raise_error("Top up would exceed card limit of £#{Oystercard::LIMIT}")
    end
  end

  describe "#touch_in" do
    it "Raises an error when balance is insufficient" do
      expect{ subject.touch_in(station) }.to raise_error('Insufficient balance')
    end
  end

end
