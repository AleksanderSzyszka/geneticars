require_relative 'car.rb'

class Crossover
  def initialize(mommy:, daddy:)
    @mommy = mommy
    @daddy = daddy
    @point = rand(0..1000)
    @generation = mommy.generation + 1
  end

  def call
    [brother, sister].map { |child| child.mutate }
  end

  private

  attr_reader :mommy, :daddy, :point, :generation

  def brother
    Car.new(generation: generation, dna: mommy.dna[0...point] + daddy.dna[point..-1])
  end

  def sister
    Car.new(generation: generation, dna: daddy.dna[0...point] + mommy.dna[point..-1])
  end
end