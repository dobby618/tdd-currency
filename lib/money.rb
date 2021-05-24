class Money
  def initialize(amount)
    @amount = amount
  end

  def equal?(other)
    # amount を外部から参照するのはここしかないので
    # amount を private にしておきたい
    @amount == other.instance_eval('@amount') && self.class == other.class
  end
  alias_method :==, :equal?
end
