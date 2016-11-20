require('pry-byebug')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')



film1 = Film.new({ 
  "title" => "The Hulk Gone Mad",
  "price" => 7
  })

film1.save()


customer1 = Customer.new({
  "name" => "Bobster",
  "funds" => 10
  })


customer1.save() 

ticket1 = Ticket.new({
  "customer_id" => customer1.id,
  "film_id" => film1.id
  })


ticket1.save()

binding.pry
nil

# films
# customers
# tickets