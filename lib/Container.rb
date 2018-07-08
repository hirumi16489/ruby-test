require 'json'
require_relative '../../../jobs/backend/lib/Model/Car'
require_relative '../../../jobs/backend/lib/Model/Rental'
require_relative '../../../jobs/backend/lib/Repository/CarRepo'
require_relative '../../../jobs/backend/lib/Repository/RentalRepo'
require_relative '../../../jobs/backend/lib/Storage/CarJsonStorage'
require_relative '../../../jobs/backend/lib/Storage/RentalJsonStorage'

class Container

  attr_reader :car_repo, :rental_repo

  def initialize(source)
    @source = source
    @car_repo = CarRepo.new(CarJsonStorage.new(source))
    @rental_repo = RentalRepo.new(RentalJsonStorage.new(source))
  end
end