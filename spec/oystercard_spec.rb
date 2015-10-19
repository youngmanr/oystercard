require 'oystercard'

describe Oystercard do
  it 'test balance' do
    expect(subject.balance).to eq(0)
  end

  it "top's up oystercard balance" do
  	expect(subject.top_up(10)).to eq (10)
  end

  it 'raises error if top up exceeds limit' do
    expect{subject.top_up(Oystercard::TOP_UP_LIMIT+1)}.to raise_error "Top up limit #{Oystercard::TOP_UP_LIMIT} exceeded"
  end

  it 'deducts fare from balance' do
  	subject.top_up(10)
  	expect(subject.deduct(10)).to eq 0
  end

  it 'touch_in' do
    expect(subject.touch_in).to eq true
  end

  it 'touch_out' do
    expect(subject.touch_out).to eq false
  end

  it 'in_journey?' do
    expect(subject.in_journey?).to eq false
  end
end