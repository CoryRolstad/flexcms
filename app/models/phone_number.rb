class PhoneNumber < ApplicationRecord
  belongs_to :contact
  accepts_nested_attributes_for :contact, reject_if: lambda {|attributes| attributes['kind'].blank?}, allow_destroy: true

  validates :number, format: { with: /(\d{3}-){1,2}(\d{4})/, message: 'Phone number must be in 7 digit(###-####) or 10 digit (###-###-####) format.' }
  validates :description, format: { with: /(Mobile)|(Home)|(Work)|(Fax)/, message: 'Phone Type must be Mobile, Home, Work, or Fax.' }
end
