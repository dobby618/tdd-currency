require_relative 'money'

class Franc < Money
  def times(multiplier)
    return Franc.new(@amount * multiplier)
  end
end
