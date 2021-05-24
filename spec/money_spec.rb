require_relative '../dollar'
require_relative '../franc'

describe 'MoneyText' do
  it 'testMultiplication' do
    five = Dollar.new(5)
    # times メソッドが doller オブジェクトを返してることが分かりづらい
    # product = five.times(2)
    # expect(product.amount).to eq 10
    expect(five.times(2)).to eq Dollar.new(10)

    expect(five.times(3)).to eq Dollar.new(15)
  end

  it 'testEquality' do
    expect(Dollar.new(5).equal?(Dollar.new(5))).to be_truthy
    expect(Dollar.new(5) == Dollar.new(5)).to be_truthy
    expect(Dollar.new(5)).to eq Dollar.new(5)

    expect(Dollar.new(5)).not_to eq Dollar.new(6)
  end

  it 'testFrancMultiplication' do
    five = Franc.new(5)
    expect(five.times(2)).to eq Franc.new(10)
    expect(five.times(3)).to eq Franc.new(15)
  end
end
