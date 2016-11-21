require('pg')
require_relative('../db/sql_runner')
require_relative('customers')
require_relative('tickets')

class Film
  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i 
  end

  def save()
    sql = 
    "INSERT INTO films 
    (title, price)
    VALUES
    ('#{@title}', #{@price}) RETURNING *;"
    result = SqlRunner.run(sql) 
    @id = result[0]['id'].to_i 
  end 

  def self.all
    sql = "SELECT * FROM films;" 
    films = SqlRunner.run(sql)
    return films.map { |films| Film.new(films) }
  end

  def update
    sql = 
    "UPDATE films
    SET (title, price) = 
    ('#{@title}', #{@price}) WHERE id =#{@id};" #where id picks just one
    SqlRunner.run(sql)
  end


  def self.delete_all() 
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
