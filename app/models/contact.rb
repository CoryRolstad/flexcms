class Contact < ApplicationRecord
  validates :name, presence: true
  # Feature 2 - opted to leverage in framework regex vs external gem to reduce dependencies. 
  validates :email, uniqueness: {scope: :name}, format: { with: URI::MailTo::EMAIL_REGEXP }
  # Feature 3 - 7 or 10 digit phone numbers
  validates :phone, format: { with: /(\d{3}-){1,2}(\d{4})/, message: 'Phone number must be in 7 digit(###-####) or 10 digit (###-###-####) format' }
end
