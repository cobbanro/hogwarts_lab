require_relative('../db/sql_runner')
require_relative('student')

class House

  attr_accessor(:name, :url)
  attr_reader(:id)

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']
  end

  def save()
    sql = "INSERT INTO houses
    (name, url) VALUES ($1,$2)
    RETURNING id"
    values = [@name,@url]
    @id = SqlRunner.run(sql,values)[0]['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    return House.new(SqlRunner.run(sql,values).first())
  end

  def self.all()
    sql = "SELECT * FROM houses"
    return SqlRunner.run(sql).map { |house| House.new(house) }
  end

end
