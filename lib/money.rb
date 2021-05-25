class Money
  attr_reader :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def equal?(other)
    # amount を外部から参照するのはここしかないので
    # amount を private にしておきたい
    @amount == other.instance_eval('@amount') &&
      currency == other.currency
  end
  alias_method :==, :equal?

  def self.dollar(amount)
    Money.new(amount, 'USD')
  end

  def self.franc(amount)
    Money.new(amount, 'CHF')
  end

  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end
end
