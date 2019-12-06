require 'securerandom'

class Car
  attr_reader :dna, :id, :generation

  def initialize(generation: 0, id: nil, dna: nil)
    @dna = dna || Array.new(1000) { rand(-1.0..1.0).round(2) }
    @id = id || "#{generation}_#{SecureRandom.hex(3)}"
    @generation = generation
  end

  def to_h
    {
      id: id,
      dna: dna
    }
  end
end
