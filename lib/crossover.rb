require_relative 'car.rb'

class Crossover
  def initialize(mommy:, daddy:)
    @mommy = mommy
    @daddy = daddy
    @point = rand(0..1000)
    @generation = mommy.generation + 1
  end

  def call
    first_half_3 = mommy.dna[0...point]
    second_half_3 = daddy.dna[point..-1]

    first_half_4 = daddy.dna[0...point]
    second_half_4 = mommy.dna[point..-1]

    new_car_3 = Car.new(
      generation: generation, 
      dna: first_half_3 + second_half_3
    )
    new_car_4 = Car.new(
      generation: generation, 
      dna: first_half_4 + second_half_4
    )

    [new_car_3, new_car_4]
  end

  private

  attr_reader :mommy, :daddy, :point, :generation
end