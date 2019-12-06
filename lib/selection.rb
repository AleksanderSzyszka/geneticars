class Selection
  attr_reader :whole_distance, :cars

  def initialize(cars)
    @cars = prepare_cars(cars)
    @whole_distance = cars.sum(&:distance)
    @car_probabilities = prepare_probabilities
  end

  def sample
    car_probabilities.sample
  end

  private

  attr_reader :cars, :car_probabilities

  def prepare_cars(cars)
    cars.sort_by(&:distance)
  end

  def count_probability(car)
    car.distance.to_f / whole_distance
  end

  def prepare_probabilities
    cars.each_with_object([]) do |car, arr|
      car_occurence = (count_probability(car) * 100).to_i

      car_occurence.times { arr << car }
    end
  end
end