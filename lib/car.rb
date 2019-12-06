require 'securerandom'
require 'pry'

class Car
  MUTATION_PROBABILITY = 0.2

  attr_reader :id, :generation
  attr_accessor :distance, :dna

  def initialize(generation: 0, id: nil, dna: nil)
    @dna = dna || Array.new(1000) { rand(-1.0..1.0).round(2) }
    @id = id || "#{generation}_#{SecureRandom.hex(3)}"
    @generation = generation
    @distance = 0
  end

  def to_h
    {
      id: id,
      dna: dna
    }
  end

  def mutate
    dna.map! do |chromosome|
      probability = rand(0.0..1.0)
      if probability <= MUTATION_PROBABILITY
        chromosome = -2
      else
        chromosome
      end
    end
    self
  end
end
