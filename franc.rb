class Franc
  def initialize(amount)
    @amount = amount
  end

  def equal?(other)
    @amount == other.instance_eval('@amount')
  end
  alias_method :==, :equal?

  def times(multiplier)
    return Franc.new(@amount * multiplier)
  end
end
