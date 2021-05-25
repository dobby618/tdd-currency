Dir["#{File.dirname(__FILE__)}/../lib/*.rb"].each {|file| require_relative file }

describe 'MoneyText' do
  it 'testMultiplication' do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it 'testEquality' do
    expect(Money.dollar(5)).to eq Money.dollar(5)
    expect(Money.dollar(5)).not_to eq Money.dollar(6)

    expect(Money.dollar(5)).not_to eq Money.franc(5)
  end

  it 'testCurrency' do
    expect(Money.dollar(1).currency).to eq 'USD'
    expect(Money.franc(1).currency).to eq 'CHF'
  end

  it 'testSimpleAddition' do
    five = Money.dollar(5)
    sum = five.plus(five) # sum は Expression オブジェクトになる。
    bank = Bank.new
    # reduce ってここで思い付かないな。。
    reduced = bank.reduce(sum, 'USD')
    # reduced は Expression に為替レートを
    # 適用することで得られる換算結果
    expect(Money.dollar(10)).to eq reduced
  end
end
