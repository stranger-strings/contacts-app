class ContactsController < ApplicationController
  def show_one_method
    contact = Contact.first
    render json: contact.as_json
  end

  def show_all_method
    contacts = Contact.all
    render json: contacts.as_json
  end
end
