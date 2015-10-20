require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'test balance' do
    expect(oystercard.balance).to eq(0)
  end

  it "top's up oystercard balance" do
  	expect(oystercard.top_up(10)).to eq (10)
  end

  it 'raises error if top up exceeds limit' do
    expect{oystercard.top_up(Oystercard::TOP_UP_LIMIT+1)}.to raise_error "Top up limit #{Oystercard::TOP_UP_LIMIT} exceeded"
  end

  it 'touch_in' do
  	oystercard.top_up(Oystercard::MIN_FARE)
    expect(oystercard.touch_in).to eq true
  end

  it 'raises an error when balance is smaller than minimum fair' do
  	expect{oystercard.touch_in}.to raise_error "Insufficient funds"
  end

  it 'touch_out' do
    expect(oystercard.touch_out).to eq false
  end

  it 'touch_out reduces balance by MIN_FARE' do
    expect{oystercard.touch_out}.to change{oystercard.balance}.by(-Oystercard::MIN_FARE)
  end

  it 'in_journey?' do
    expect(oystercard.in_journey?).to eq false
  end
end