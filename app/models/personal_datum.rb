class PersonalDatum < ApplicationRecord
  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates :first_name, length: {maximum: 25}
  validates :last_name, length: {maximum: 50}
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :phone_number, format: {with: /\A\d{3}-\d{3}-\d{4}\z/}

  store :personal_info, accessors: [:first_name, :last_name, :nick_name, :phone_number], coder: JSON
  store :address, accessors: [:street, :city, :state, :zip], coder: JSON

  has_many :employments, dependent: :destroy
end
