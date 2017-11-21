class Contact < ApplicationRecord
  def full_name
    "#{last_name}, #{first_name}"
  end

  def japan_phone_number
    "+81 #{phone_number}"
  end

  def as_json
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      full_name: full_name,
      email: email,
      phone_number: phone_number,
      japan_phone_number: japan_phone_number,
    }
  end
end
