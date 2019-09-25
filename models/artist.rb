require('pg')
require_relative('../db/sql_runner')
require_relative('albums')

class Artists

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @name = options["name"]

  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |album| Albums.new(album) }
  end

  def self.all()
    sql = "SELECT * FROM artists"
    SqlRunner.run(sql)
  end


end
