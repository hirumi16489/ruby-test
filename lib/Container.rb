require "json"
require "yaml"
require_relative "../../../jobs/backend/lib/Model/Car"
require_relative "../../../jobs/backend/lib/Model/Commission"
require_relative "../../../jobs/backend/lib/Model/DayDiscountConfig"
require_relative "../../../jobs/backend/lib/Model/Rental"
require_relative "../../../jobs/backend/lib/Repository/CarRepo"
require_relative "../../../jobs/backend/lib/Repository/RentalRepo"
require_relative "../../../jobs/backend/lib/Storage/CarJsonStorage"
require_relative "../../../jobs/backend/lib/Storage/RentalJsonStorage"
require_relative "../../../jobs/backend/lib/Service/CommisionService"
require_relative "../../../jobs/backend/lib/Service/DiscountService"
require_relative "../../../jobs/backend/lib/Service/RentalService"

class Container

  attr_reader :car_repo, :rental_repo, :rental_service

  def initialize(source, config)

    config = YAML.load(IO.read(config))["config"]

    @discount_service = DiscountService.new(config["discount"])
    @commission_service = CommissionService.new(config["commission"])
    @source = source
    @car_repo = CarRepo.new(CarJsonStorage.new(source))
    @rental_repo = RentalRepo.new(RentalJsonStorage.new(source))
    @rental_service = RentalService.new(@car_repo, @rental_repo, @discount_service, @commission_service)
  end
end