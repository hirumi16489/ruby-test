require_relative "../../../jobs/backend/lib/Container"
require_relative "../../../jobs/backend/lib/tools/dump"
require_relative "../../../jobs/backend/lib/tools/compare_json_files"
require "json"

c = Container.new("./data/input.json", "../lib/config.yml")

rentals = c.rental_service.get_all_rentals

output = {}

output["rentals"] = rentals.map do |rental|
  h = {"id": rental.id}

  h["actions"] = rental.get_transactions.map do |transaction|
    {
        "who": transaction.user,
        "type": transaction.type,
        "amount": transaction.amount
    }
  end

  h
end

IO.write("./data/output.json", JSON.generate(output))

compare_json_files("./data/expected_output.json", "./data/output.json")
