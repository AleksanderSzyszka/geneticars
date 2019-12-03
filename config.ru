require 'pry'

class GeneticarsApi
  def call(env)
    request = Rack::Request.new(env)
    case request.path_info
    when '/generate_population'
      [200, { 'Content-Type' => 'application/json' }, [{0 => [0,0,0,-1,1], 1 => [0,-1,-1,-1,-1]}.to_json]]
    when '/crossover'
      [200, {"Content-Type" => "text/html; charset=utf-8"}, ["Hello World"]]
    when '/best_car'
      [200, {"Content-Type" => "text/html; charset=utf-8"}, ["Hello World"]]
    end
  end
end

run GeneticarsApi.new
