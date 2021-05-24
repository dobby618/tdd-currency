require_relative 'money'

class Dollar < Money
  def times(multiplier)
    # value オブジェクトみたいにするってことか？
    return Dollar.new(@amount * multiplier)
  end
end
