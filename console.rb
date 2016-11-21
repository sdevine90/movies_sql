require('pry-byebug')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


film1 = Film.new({ 
  "title" => "The Hulk Gone Mad",
  "price" => 7
  })

film2 = Film.new({
  "title" => "bazinga",
  "price" => 8
  })

film1.save()
film2.save()
film2.title = "The Big Bang"
film2.update


customer1 = Customer.new({
  "name" => "Bobster",
  "funds" => 10
  })

customer2 = Customer.new({
  "name" => "lynard",
  "funds" => 12
  })


customer1.save() 
customer2.save()

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })
ticket2 = Ticket.new({
  "customer_id" => customer2.id,
  "film_id" => film2.id
  })


ticket1.save()
ticket2.save()

binding.pry
nil

# films
# customers
# tickets