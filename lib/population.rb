require_relative 'car.rb'

class Population
  def self.generate(population_count:)
    population = []
    population_count.times do
      population << Car.new
    end
    population
  end
end
