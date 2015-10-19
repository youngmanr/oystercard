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
end