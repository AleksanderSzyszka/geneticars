require 'pry'
require './lib/population.rb'

class GeneticarsApi
  def call(env)
    request = Rack::Request.new(env)
    case request.path_info
    when '/generate_population'
      [200, { 'Content-Type' => 'application/json' }, [Population.generate(population_count: 100).map(&:to_h).to_json]]
    when '/crossover'
      [200, { 'Content-Type' => 'application/json' }, ['Rada sznycel']]
    when '/best_car'
      [200, { 'Content-Type' => 'application/json' }, ['Rada sznycel']]
    end
  end
end

run GeneticarsApi.new
