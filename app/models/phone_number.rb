class PhoneNumber < ApplicationRecord
  belongs_to :contact
  belongs_to :phone_type
  accepts_nested_attributes_for :contact

  # validates :number, format: { with: /(\d{3}-){1,2}(\d{4})/, message: 'Phone number must be in 7 digit(###-####) or 10 digit (###-###-####) format.' }
end
