require_relative 'money'

class Franc < Money
  def times(multiplier)
    Money.new(@amount * multiplier, currency)
  end
end
