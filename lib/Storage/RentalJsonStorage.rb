require_relative "./JsonFileStorage"

class RentalJsonStorage < JsonFileStorage
  def get_all
    self.get_data("rentals")
  end
end