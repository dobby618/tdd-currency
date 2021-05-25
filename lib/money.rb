class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equal?(other)
    amount == other.amount && currency == other.currency
  end
  alias_method :==, :equal?

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
    Money.new(amount + addend.amount, currency)
  end
end
