require_relative "../../../jobs/backend/lib/Container"
require_relative "../../../jobs/backend/lib/tools/dump"
require_relative "../../../jobs/backend/lib/tools/compare_json_files"
require "json"

c = Container.new("./data/input.json", "../lib/config.yml")

rentals = c.rental_service.get_all_rentals

output = {}

output["rentals"] = rentals.map do |rental|
  {
    "id": rental.id,
    "price": rental.get_raw_cost
  }
end

IO.write("./data/output.json", JSON.generate(output))

compare_json_files("./data/expected_output.json", "./data/output.json")







