require 'oystercard'

describe Oystercard do
  it 'test balance' do
    expect(subject.balance).to eq(0)
  end

  it "top's up oystercard balance by 10" do
  	expect(subject.top_up(10)).to eq (10)
  end

end