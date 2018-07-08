require_relative './Repo'

class RentalRepo < Repo

  def get_all
    @storage.get_all
  end

end