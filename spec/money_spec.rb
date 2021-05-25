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

  it 'testPlusReturnsSum' do
    five = Money.dollar(5)
    result = five.plus(five)
    sum = result # 型変換のため
    expect(sum.augend).to eq five # 被加算数
    expect(sum.addend).to eq five # 加数
  end

  it 'testReduceSum' do
    sum = Sum.new(Money.dollar(3), Money.dollar(4))
    bank = Bank.new
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(7)
  end

  it 'testReduceMoney' do
    bank = Bank.new
    result = bank.reduce(Money.dollar(1), 'USD')
    expect(result).to eq Money.dollar(1)
  end

  it 'testReduceMoneyDifferentCurrency' do
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(Money.franc(2), 'USD')
    expect(result).to eq Money.dollar(1)
  end

  it 'testIdentityRate' do
    expect(Bank.new.rate('USD', 'USD')).to eq 1
  end

  it 'testMixedAddition' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)
    result = bank.reduce(five_bucks.plus(ten_francs), 'USD')
    expect(result).to eq Money.dollar(10)
  end

  it 'testSumPlusMoney' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)

    sum = Sum.new(five_bucks, ten_francs).plus(five_bucks)
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(15)
  end

  it 'testSumTimes' do
    five_bucks = Money.dollar(5)
    ten_francs = Money.franc(10)
    bank = Bank.new
    bank.add_rate('CHF', 'USD', 2)

    sum = Sum.new(five_bucks, ten_francs).times(2)
    result = bank.reduce(sum, 'USD')
    expect(result).to eq Money.dollar(20)
  end
end
