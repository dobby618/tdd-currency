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
    Dollar.new(amount, 'USD')
  end

  def self.franc(amount)
    Franc.new(amount, 'CHF')
  end
end
