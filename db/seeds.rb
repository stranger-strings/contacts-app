# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
x = Contact.new(first_name: "Bob", last_name: "Charlie", email: "bob@bob.com", phone_number: "432423432423")
x.save

Contact.create(first_name: "Saron", last_name: "Yitbarek", email: "saron@email.com", phone_number: "3242432")
Contact.create(first_name: "Majora", last_name: "Carter", email: "majora@email.com", phone_number: "435435435")
