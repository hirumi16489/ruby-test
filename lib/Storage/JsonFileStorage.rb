class JsonFileStorage

  def initialize(source)
    @source = source
  end

  def get_data(sub_key = nil)
    input = IO.read(@source)

    if sub_key == nil
      JSON.parse(input)
    end

    hash = JSON.parse(input)

    hash[sub_key]
  end

end
