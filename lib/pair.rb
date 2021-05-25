class Pair < Struct.new(:from, :to)
  def initialize(*args)
    super
    freeze
  end
end
