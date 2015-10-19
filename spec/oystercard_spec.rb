require 'oystercard'

describe Oystercard do
  it 'test balance' do
    expect(subject.balance).to eq(0)
  end
end