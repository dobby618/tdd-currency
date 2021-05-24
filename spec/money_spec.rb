Dir["#{File.dirname(__FILE__)}/../lib/*.rb"].each {|file| require_relative file }

describe 'MoneyText' do
  it 'testMultiplication' do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it 'testEquality' do
    expect(Money.dollar(5).equal?(Money.dollar(5))).to be_truthy
    expect(Money.dollar(5) == Money.dollar(5)).to be_truthy
    expect(Money.dollar(5)).to eq Money.dollar(5)
    expect(Money.dollar(5)).not_to eq Money.dollar(6)

    expect(Money.franc(5)).to eq Money.franc(5)
    expect(Money.franc(5)).not_to eq Money.franc(6)

    expect(Money.dollar(5)).not_to eq Money.franc(5)
  end

  it 'testFrancMultiplication' do
    five = Money.franc(5)
    expect(five.times(2)).to eq Money.franc(10)
    expect(five.times(3)).to eq Money.franc(15)
  end
end
