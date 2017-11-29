require "unirest"
require "pp"

base_url = "http://localhost:3000/v1"

while true
  system "clear"
  puts "Choose an option:"
  puts "[1] Show all contacts"
  puts "[2] Create a contact"
  puts "[3] Show a contact"
  puts "[4] Update a contact"
  puts "[5] Destroy a contact"
  puts
  puts "[signup] Sign up (create a user)"
  puts 
  puts "[q] Quit"

  input_option = gets.chomp
  if input_option == "1"
    response = Unirest.get("#{base_url}/contacts")
    contacts = response.body
    pp contacts
  elsif input_option == "2"
    params = {}
    print "New contact first name: "
    params[:first_name] = gets.chomp
    print "New contact middle name: "
    params[:middle_name] = gets.chomp
    print "New contact last name: "
    params[:last_name] = gets.chomp
    print "New contact email: "
    params[:email] = gets.chomp
    print "New contact phone number: "
    params[:phone_number] = gets.chomp
    print "New contact bio: "
    params[:bio] = gets.chomp
    response = Unirest.post("#{base_url}/contacts", parameters: params)
    contact = response.body
    pp contact
  elsif input_option == "3"
    print "Enter a contact id: "
    contact_id = gets.chomp
    response = Unirest.get("#{base_url}/contacts/#{contact_id}")
    contact = response.body
    pp contact
  elsif input_option == "4"
    print "Enter a contact id: "
    contact_id = gets.chomp
    response = Unirest.get("#{base_url}/contacts/#{contact_id}")
    contact = response.body
    params = {}
    print "Updated first name (#{contact["first_name"]}): "
    params[:first_name] = gets.chomp
    print "Updated middle name (#{contact["middle_name"]}): "
    params[:middle_name] = gets.chomp
    print "Updated last name (#{contact["last_name"]}): "
    params[:last_name] = gets.chomp
    print "Updated email (#{contact["email"]}): "
    params[:email] = gets.chomp
    print "Updated phone number (#{contact["phone_number"]}): "
    params[:phone_number] = gets.chomp
    print "Updated bio (#{contact["bio"]}): "
    params[:bio] = gets.chomp
    params.delete_if { |_key, value| value.empty? }
    response = Unirest.patch("#{base_url}/contacts/#{contact_id}", parameters: params)
    contact = response.body
    pp contact
  elsif input_option == "5"
    print "Enter a contact id: "
    contact_id = gets.chomp
    response = Unirest.delete("#{base_url}/contacts/#{contact_id}")
    pp response.body
  elsif input_option == "signup"
    print "Enter name: "
    input_name = gets.chomp
    print "Enter email: "
    input_email = gets.chomp
    print "Enter password: "
    input_password = gets.chomp
    print "Confirm password: "
    input_password_confirmation = gets.chomp
    response = Unirest.post(
      "#{base_url}/users",
      parameters: {
        name: input_name,
        email: input_email,
        password: input_password,
        password_confirmation: input_password_confirmation
      }
    )
    pp response.body
  elsif input_option == "q"
    puts "Goodbye!"  
    break
  end
  puts "Press enter to continue"
  gets.chomp
end
