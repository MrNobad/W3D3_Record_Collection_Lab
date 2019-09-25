require('pry')
require_relative('models/artist')

artist1 = Artists.new({ "name" => "Prince" })
artist1.save()

binding.pry
nil
