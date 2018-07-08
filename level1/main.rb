require_relative "../../../jobs/backend/lib/Container"
require_relative "../../../jobs/backend/lib/tools/dump"

c = Container.new("./data/input.json")

rentalData = c.rental_repo.get_all

rentals = []
rentalData.each do |item|
  car_id = item["car_id"]
  carData = c.car_repo.get_car_by_id(car_id)

  if carData.empty?
    raise Exception.new(sprintf("car not found, id : %s", car_id))
  end

  item["car"] = Car.create_from_array(carData)

  rentals << Rental.create_from_array(item)
end

output = {}

output['rentals'] = rentals.map do |rental|
  {
      "id": rental.id,
      "price": rental.get_cost
  }
end

puts output






