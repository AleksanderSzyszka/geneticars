class Coronation
  def initialize(generation_winner)
    @generation_winner = generation_winner
  end

  def call
    return if current_best && current_best['distance'] > generation_winner.distance

    store_winner
  end

  private

  attr_reader :generation_winner

  def store_winner
    file = File.open('./data/best.json', 'w')
    file.write(generation_winner.to_h.to_json)
    file.close
  end

  def current_best
    JSON.parse(File.read("./data/best.json"))
  rescue JSON::ParserError
    nil
  end
end
