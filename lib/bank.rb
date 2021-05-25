class Bank
  def initialize
    @rates = {}
  end

  def reduce(source, to)
    source.reduce(self, to)
  end

  def add_rate(from, to, rate)
    @rates.store(Pair.new(from, to), rate)
  end

  def rate(from, to)
    return 1 if from == to
    @rates[Pair.new(from, to)]
  end
end
