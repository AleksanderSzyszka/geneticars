require 'pry'
require './lib/population.rb'

class GeneticarsApi
  def call(env)
    request = Rack::Request.new(env)
    case request.path_info
    when '/generate_population'
      population = Population.new
      population.generate
      population.save
      [200, { 'Content-Type' => 'application/json' }, [population.map(&:to_h).to_json]]
    when '/crossover'
      # => crossover, selection, mutation
      # => return new population
      params = JSON.parse(request.body.read)
      generation_index = params.first['id'].split('_').first
      population = Population.new(generation_index: generation_index)
      population.load
      [200, { 'Content-Type' => 'application/json' }, ['Rada sznycel']]
    when '/best_car'
      [200, { 'Content-Type' => 'application/json' }, ['Rada sznycel']]
    end
  end
end

run GeneticarsApi.new
