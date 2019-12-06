require_relative 'car.rb'
require 'pry'

class Population
  POPULATION_COUNT = 50
  attr_reader :generation_index, :cars

  def initialize(generation_index: 0)
    @generation_index = generation_index
    @cars = []
  end

  def generate
    POPULATION_COUNT.times do
      @cars << Car.new(generation: generation_index)
    end
    cars
  end

  def save
    File.open("./data/generation_#{generation_index}.json", 'w') do |file|
      file.write cars.map(&:to_h).to_json
    end
  end

  def load
    JSON.parse(File.read("./data/generation_#{generation_index}.json")).map do |car_attributes|
      @cars << Car.new(generation: generation_index, id: car_attributes['id'])
    end
  end

  def add(child)
    @cars << child
  end

  def count
    cars.count
  end

  def sample(number)
    cars.sample(number)
  end
end
