require "rails_helper"

RSpec.describe PersonalDatum, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone_number) }

    it { is_expected.to validate_length_of(:first_name).is_at_most(25) }
    it { is_expected.to validate_length_of(:last_name).is_at_most(50) }

    it { is_expected.to allow_value("example@example.com").for(:email) }
    it { is_expected.not_to allow_value("invalid_email").for(:email) }

    it { is_expected.to allow_value("123-456-7890").for(:phone_number) }
    it { is_expected.not_to allow_value("1234567890").for(:phone_number) }
  end

  describe "columns" do
    it "should have store accessor for address with accessors street, city, state, and zip" do
      personal_datum = described_class.new
      expect(personal_datum).to respond_to(:street)
      expect(personal_datum).to respond_to(:city)
      expect(personal_datum).to respond_to(:state)
      expect(personal_datum).to respond_to(:zip)
    end
    it "should have store accessor for address with accessors street, city, state, and zip" do
      personal_datum = described_class.new
      expect(personal_datum).to respond_to(:street)
      expect(personal_datum).to respond_to(:city)
      expect(personal_datum).to respond_to(:state)
      expect(personal_datum).to respond_to(:zip)
    end
  end

  describe "associations" do
    it { is_expected.to have_many(:employments).dependent(:destroy) }
  end
end
