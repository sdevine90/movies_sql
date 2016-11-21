require('pg')
require_relative('../db/sql_runner')
require_relative('tickets')
require_relative('films')

class Customer

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = 
    "INSERT INTO customers 
    (name, funds)
    VALUES
    ('#{@name}', #{@funds}) RETURNING *;"
    result = SqlRunner.run(sql) 
    @id = result[0]['id'].to_i 
  end 

  def self.all()
    sql = "SELECT * FROM customers;"
    customers = SqlRunner.run(sql)
    return customers.map { |customers| Customer.new(customers)} 
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end

