class Contact < ApplicationRecord
  validates :name, presence: true
  # Feature 2 - opted to leverage in framework regex vs external gem to reduce dependencies. 
  validates :email, uniqueness: {scope: :name}, format: { with: URI::MailTo::EMAIL_REGEXP }
end
