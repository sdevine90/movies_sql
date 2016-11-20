require('pg')
require_relative('../db/sql_runner')
require_relative('films')
require_relative('customers')


class Ticket
  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = 
    "INSERT INTO tickets 
    (customer_id, film_id)
    VALUES
    ('#{@customer_id}', '#{@film_id}') RETURNING *;"
    result = SqlRunner.run(sql) 
    @id = result[0]['id'].to_i 
  end 

  def self.all()
    sql = "SELECT * FROM tickets;"
    collectors = SqlRunner.run(sql)
    return tickets.map { |tickets| Ticket.new(tickets)} 
  end

end