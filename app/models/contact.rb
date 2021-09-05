class Contact < ApplicationRecord
  # Feature 15 - has many relationship
  has_many :phone_numbers

  validates :name, presence: true
  # Feature 2 - opted to leverage in framework regex vs external gem to reduce dependencies. 
  validates :email, uniqueness: {scope: :name}, format: { with: URI::MailTo::EMAIL_REGEXP }
  # Feature 3 - 7 or 10 digit phone numbers
  validates :phone, format: { with: /(\d{3}-){1,2}(\d{4})/, message: 'Phone number must be in 7 digit(###-####) or 10 digit (###-###-####) format' }

  # Feature 10 - Birthdays 
  validates :birthday, presence: true

  # Feature 8 - Gravatar
  include Gravtastic
  gravtastic

  # Added for quick db seeding of random data
  def self.SeedMe(numberOfInstances)
    for i in 1..numberOfInstances do
      c = Contact.new
      c.name = Contact.RandomString
      c.birthday = Time.at(Random.new.rand(1630799834))
      c.email = "#{Contact.RandomString}@#{Contact.RandomString}.com"
      c.phone = "#{Random.new.rand(100..999)}-#{Random.new.rand(100..999)}-#{Random.new.rand(1000..9999)}"
      c.save
    end
  end

  def self.RandomString
    return (0...10).map { ('a'..'z').to_a[rand(26)] }.join
  end

end
