class PhoneNumber < ApplicationRecord
  belongs_to :contact

  validates :number, format: { with: /(\d{3}-){1,2}(\d{4})/, message: 'Phone number must be in 7 digit(###-####) or 10 digit (###-###-####) format.' }
  validates :description, format:  { with: /^(Home)|(Work)|(Mobile)|(Fax)$/, message: "Description has to be Home, Work, Mobile or Fax."}
end
