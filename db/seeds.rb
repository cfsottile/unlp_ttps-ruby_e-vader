# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.create(
  first_name: "Isaac",
  last_name: "Newton",
  document_number: "90100200",
  gender: "male",
  birthday: Date.new(1642, 12, 25),
  cuilt: "20-90100200-5"
)
Client.create(
  first_name: "Nicolás",
  last_name: "Copérnico",
  document_number: "90100201",
  gender: "male",
  birthday: Date.new(1473, 2, 19),
  cuilt: "20-90100201-5"
)
Client.create(
  first_name: "Galileo",
  last_name: "Galilei",
  document_number: "90100202",
  gender: "male",
  birthday: Date.new(1564, 2, 15),
  cuilt: "20-90100202-5"
)
Client.create(
  first_name: "Ada",
  last_name: "Lovelace",
  document_number: "90100203",
  gender: "female",
  birthday: Date.new(1815, 12, 10),
  cuilt: "20-90100203-5"
)
Client.create(
  first_name: "Fabiola",
  last_name: "Gianotti",
  document_number: "90100204",
  gender: "female",
  birthday: Date.new(1962, 10, 29),
  cuilt:"20-90100204-5"
)
Client.create(
  first_name: "Peter Ware",
  last_name: "Higgs",
  document_number: "90100205",
  gender: "male",
  birthday: Date.new(1929, 5, 29),
  cuilt: "20-90100205-5"
)
Client.create(
  first_name: "Juan Carlos",
  last_name: "Miño",
  document_number: "90100206",
  gender: "male",
  birthday: Date.new(1928, 3, 15),
  cuilt: "20-90100206-5"
)
Client.create(
  first_name: "Alan Mathison",
  last_name: "Turing",
  document_number: "90100207",
  gender: "male",
  birthday: Date.new(1912, 6, 23),
  cuilt: "20-90100207-5"
)

Contact.create(
  client_id: 1,
  kind: "email",
  value: "isaac_newton@fibertel.com.ar"
)
Contact.create(
  client_id: 2,
  kind: "email",
  value: "nicolas_copernico@netverk.com"
)
Contact.create(
  client_id: 3,
  kind: "email",
  value: "galileo_galilei@aol.com"
)
Contact.create(
  client_id: 4,
  kind: "email",
  value: "ada_lovelace@arnet.com.ar"
)
Contact.create(
  client_id: 5,
  kind: "email",
  value: "fabiola.gianotti@cern.ch"
)
Contact.create(
  client_id: 5,
  kind: "phone_number",
  value: "+41-22-767.89.65"
)
Contact.create(
  client_id: 5,
  kind: "address",
  value: "CH-1211 Geneva 23, Switzerland"
)
Contact.create(
  client_id: 6,
  kind: "email",
  value: "p.w.higgs@ed.ac.uk"
)
Contact.create(
  client_id: 7,
  kind: "address",
  value: "Caa Guazú 961"
)
Contact.create(
  client_id: 8,
  kind: "address",
  value: "King's College, Cambridge"
)

Person.create(
  name: "CERN",
  cuilt: "10-90100200-1"
)
Person.create(
  name: "UTN-FRC",
  cuilt: "10-90100200-1"
)
Person.create(
  name: "University of London",
  cuilt: "10-90100200-1"
)
Person.create(
  name: "Kings' College",
  cuilt: "10-90100200-1"
)
Person.create(
  name: "University of Milan",
  cuilt: "10-90100200-1"
)

lorem_ipsum_texts = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco labo...",
  "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae...",
  "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas...",
  "Eum hinc argumentum te, no sit percipit adversarium, ne qui feugiat persecuti...",
  "The Lazy Description",
]

amounts = [120, 400, 1000, 4000000, 330003, 3333.33, 1000.20]

100.times do
  Invoice.create(
    client_id: Client.select(:id).map {|c| c.id}.sample,
    person_id: Person.select(:id).map {|c| c.id}.sample,
    description: lorem_ipsum_texts.sample,
    amount: amounts.sample,
    emission_date: Random.rand((Date.current - 1.year)..Date.current)
  )
end
