require "rails_helper"

RSpec.describe "Employments", type: :request do
  let(:employment_attributes) { FactoryBot.attributes_for(:employment) }
  let(:valid_session) { {} }
  let(:personal_datum) { FactoryBot.create(:personal_datum) }

  describe "GET #index" do
    it "returns a success response" do
      employment = personal_datum.employments.create! employment_attributes
      get personal_datum_employments_path(personal_datum), params: {personal_datum_id: personal_datum.to_param}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    it "creates a new Employment with valid attribues" do
      expect {
        post personal_datum_employments_path(personal_datum), params: {employment: employment_attributes}
      }.to change(Employment, :count).by(1)
    end
  end

  describe "PUT/PATCH #update" do
    it "updates the employment successfully" do
      employment = personal_datum.employments.create(employment_attributes)
      employment_attributes[:employer] = "Changed"
      put personal_datum_employment_path(personal_datum, employment), params: {employment: employment_attributes}
      employment.reload
      expect(employment.employer).to eq("Changed")
    end
  end
end
