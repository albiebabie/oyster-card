require 'oystercard'

describe Oystercard do
min_fare = described_class.new.min_fare

  it 'shows card balance' do
    expect(subject.balance).to eq 0
  end

  context 'balance below minimum fare' do
    it 'raises error if balance is less than minimum fare' do
      expect{subject.touch_in double :entry_station}.to raise_error "balance too low"
    end
  end

  describe "#top_up" do
    it 'tops up balance' do
      expect{subject.top_up(10)}.to change {subject.balance}.by 10
    end

    it 'raises error when exceeding top_up limit' do
      limit = described_class::LIMIT
      subject.top_up(limit)
      expect{subject.top_up(1)}.to raise_error("limit #{limit} reached")
    end
  end

  describe "#history" do
    it 'returns journey history' do
      expect(subject.history).to be_empty
    end
  end

end
