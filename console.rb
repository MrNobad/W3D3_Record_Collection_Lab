require('pry')
require_relative('models/artist')
require_relative('models/albums')

artist1 = Artists.new({ "name" => "Prince" })
artist1.save()

album1 = Albums.new({ "title" => "Purple Rain", "genre" => "Rock", "artist_id" => artist1.id })
album1.save()



binding.pry
nil
