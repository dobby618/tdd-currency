class Money < Struct.new(:amount, :currency)
  def initialize(*args)
    super
    freeze
  end

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def times(multiplier)
    Money.new(amount * multiplier, currency)
  end

  def plus(addend)
    # Expression のインターフェイスで Expression 型を返したい
    # のだけど、Ruby には IF がないからなぁ。
    Sum.new(self, addend)
  end

  def reduce(bank, to)
    rate = bank.rate(currency, to)
    Money.new(amount / rate, to)
  end
end
