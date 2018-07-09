class RentalService
  def initialize(car_repo, rental_repo, discount_service, commission_service)
    @car_repo = car_repo
    @rental_repo = rental_repo
    @discount_service = discount_service
    @commission_service = commission_service
  end

  def get_all_rentals
    rental_data = @rental_repo.get_all

    rentals = []
    rental_data.each do |item|
      car_id = item["car_id"]
      car_data = @car_repo.get_car_by_id(car_id)

      if car_data.empty?
        raise Exception.new(sprintf("car not found, id : %s", car_id))
      end

      item["car"] = Car.create_from_array(car_data)

      rental = Rental.create_from_array(item)

      rental.discount = @discount_service.day_discount_compute(rental.car.price_per_day, rental.get_period)
      rental.commission = @commission_service.get_commission(rental.get_cost, rental.get_period)

      rentals << rental
    end

    rentals
  end
end