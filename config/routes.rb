Rails.application.routes.draw do
  get "/show_one_contact_url" => "contacts#show_one_method"
  get "/show_all_contacts_url" => "contacts#show_all_method"
end
