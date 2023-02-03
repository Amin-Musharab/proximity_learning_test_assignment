class Employment < ApplicationRecord
  belongs_to :personal_datum

  validates :employer, :date_started, :date_ended, presence: true

  validate :validate_dates

  def validate_dates
    return unless dates_present?

    if date_started > date_ended
      errors.add(:base, "End date can not be less than start date")
    elsif date_started > Date.today || date_ended > Date.today
      errors.add(:base, "Start date or End date can not be greater than current date")
    end
  end

  def dates_present?
    date_started && date_ended
  end
end
