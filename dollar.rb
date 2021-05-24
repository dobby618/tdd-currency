class Dollar
  attr_reader :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    # value オブジェクトみたいにするってことか？
    return Dollar.new(amount * multiplier)
  end
end
