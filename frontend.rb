require "unirest"
require "pp"

puts "Choose an option:"
puts "[1] Show all contacts"
puts "[2] Create a contact"
puts "[3] Show a contact"
puts "[4] Update a contact"
puts "[5] Destroy a contact"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/contacts")
  contacts = response.body
  pp contacts
elsif input_option == "2"
  params = {}
  print "New contact first name: "
  params[:first_name] = gets.chomp
  print "New contact last name: "
  params[:last_name] = gets.chomp
  print "New contact email: "
  params[:email] = gets.chomp
  print "New contact phone number: "
  params[:phone_number] = gets.chomp
  response = Unirest.post("http://localhost:3000/contacts", parameters: params)
  contact = response.body
  pp contact
elsif input_option == "3"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/contacts/#{contact_id}")
  contact = response.body
  pp contact
elsif input_option == "4"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/contacts/#{contact_id}")
  contact = response.body
  params = {}
  print "Updated first name (#{contact["first_name"]}): "
  params[:first_name] = gets.chomp
  print "Updated last name (#{contact["last_name"]}): "
  params[:last_name] = gets.chomp
  print "Updated email (#{contact["email"]}): "
  params[:email] = gets.chomp
  print "Updated phone number (#{contact["phone_number"]}): "
  params[:phone_number] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/contacts/#{contact_id}", parameters: params)
  contact = response.body
  pp contact
elsif input_option == "5"
  print "Enter a contact id: "
  contact_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/contacts/#{contact_id}")
  pp response.body
end
