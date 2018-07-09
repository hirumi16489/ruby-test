require "json"

def compare_json_files(file1, file2)
  h_1 = JSON.parse(IO.read(file1))
  h_2 = JSON.parse(IO.read(file2))

  if h_1 != h_2
    raise Exception.new("expected output and actual output are not equal !")
  end

  puts "everythings went as expected ! :)"
end