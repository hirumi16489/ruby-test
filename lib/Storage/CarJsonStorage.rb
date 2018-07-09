require_relative "./JsonFileStorage"

class CarJsonStorage < JsonFileStorage
  def get_car_by_id(id)
    data = self.get_data("cars")

    data.each do |car|
      if car["id"] == id
        return car
      end
    end

    []
  end
end