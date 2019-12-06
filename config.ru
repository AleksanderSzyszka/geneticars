require 'pry'
require './lib/population.rb'
require './lib/crossover.rb'
require './lib/selection.rb'

class GeneticarsApi
  def call(env)
    request = Rack::Request.new(env)
    case request.path_info
    when '/generate_population'
      population = Population.new
      population.generate
      population.save

      [200, { 'Content-Type' => 'application/json' }, [population.cars.map(&:to_h).to_json]]
    when '/crossover'
      params = JSON.parse(request.body.read)
      generation_index = params.first['id'].split('_').first.to_i
      population = Population.new(generation_index: generation_index)
      population.load

      population.cars.each do |car|
        distance = params.find { |data| data['id'] == car.id }['distance']
        car.distance = distance
      end

      selection = Selection.new(population.cars)

      new_population = Population.new(generation_index: generation_index + 1)
      (population.count / 2).times do
        mommy = selection.sample
        daddy = selection.sample
        childrens = Crossover.new(mommy: mommy, daddy: daddy).call
        childrens.each do |child|
          new_population.add(child)
        end
      end
      new_population.save

      [200, { 'Content-Type' => 'application/json' }, [new_population.cars.map(&:to_h).to_json]]
    when '/best_car'
      [200, { 'Content-Type' => 'application/json' }, ['Rada sznycel']]
    end
  end
end

run GeneticarsApi.new
