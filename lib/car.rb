class Car
  attr_reader :dna

  def initialize
    @dna = Array.new(100) { rand(-1.0..1.0).round(2) }
  end
end
