class ContactsController < ApplicationController
  def show_one_method
    contact = Contact.first
    render json: contact.as_json
  end
end
