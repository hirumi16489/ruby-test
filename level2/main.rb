require_relative "../../../jobs/backend/lib/Container"
require_relative "../../../jobs/backend/lib/tools/dump"
require "json"

c = Container.new("./data/input.json", "../lib/config.yml")

rentals = c.rental_service.get_all_rentals

output = {}

output["rentals"] = rentals.map do |rental|
  {
      "id": rental.id,
      "price": rental.get_cost
  }
end

IO.write("./data/output.json", JSON.generate(output))