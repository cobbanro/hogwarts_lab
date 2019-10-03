require('pg')
require_relative('../db/sql_runner')
require_relative('house')

class Student

  attr_accessor(:first_name, :last_name, :age, :house_id)
  attr_reader(:id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students
     (
      first_name,
      last_name,
      age,
      house_id
      ) VALUES
      ($1, $2, $3, $4) RETURNING id"
      values = [@first_name, @last_name, @age, @house_id]
      @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def house()
    sql = "SELECT name FROM houses WHERE id = $1;"
    values = [@house_id]
    return SqlRunner.run(sql,values).first['name']
  end

  def self.all()
    sql = "SELECT * FROM students;"
    results = SqlRunner.run(sql)
    return results.map { |student| Student.new(student)  }
  end

  def self.find(id_to_find)
    sql = "SELECT * FROM students WHERE id = $1;"
    values = [id_to_find]
    return Student.new(SqlRunner.run(sql,values).first)
  end

end
