require "unirest"
require "pp"

puts "Choose an option:"
puts "[1] Show one contact"
puts "[2] Show all contacts"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/show_one_contact_url")
  contact = response.body
  p contact
elsif input_option == "2"
  response = Unirest.get("http://localhost:3000/show_all_contacts_url")
  contacts = response.body
  pp contacts
end
