require_relative './Repo'

class CarRepo < Repo
  def get_car_by_id(id)
    @storage.get_car_by_id(id)
  end
end