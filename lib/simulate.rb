class Simulate
  def initialize(population:, data:)
    @population = population
    @data = data
  end

  def call
    population.cars.each do |car|
      distance = data.find { |data| data['id'] == car.id }['distance']
      car.distance = distance
    end
  end

  private

  attr_reader :population, :data
end
