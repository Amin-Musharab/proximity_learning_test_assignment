require "rails_helper"

RSpec.describe "PersonalData", type: :request do
  let(:valid_attributes) { FactoryBot.attributes_for(:personal_datum) }

  describe "GET /personal_data" do
    it "returns a success response" do
      get personal_data_path
      expect(response).to be_successful
    end
  end

  describe "GET /personal_data/new" do
    it "returns a success response" do
      get new_personal_datum_path
      expect(response).to be_successful
    end
  end

  describe "GET /personal_data/edit" do
    it "returns a success response" do
      personal_datum = create(:personal_datum)
      get edit_personal_datum_path(personal_datum)
      expect(response).to be_successful
    end
  end

  describe "POST /personal_data" do
    context "with valid params" do
      it "creates a new PersonalDatum" do
        expect {
          post personal_data_path, params: {personal_datum: valid_attributes}
        }.to change(PersonalDatum, :count).by(1)
      end

      it "redirects to the created personal_datum" do
        post personal_data_path, params: {personal_datum: valid_attributes}
        expect(response).to redirect_to(PersonalDatum.last)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {personal_datum: {first_name: "", last_name: "Doe", email: "johndoe@example.com"}}
      end

      it "does not create a new PersonalDatum" do
        expect {
          post personal_data_path, params: invalid_params
        }.to change(PersonalDatum, :count).by(0)
      end

      it "returns an unprocessable entity response" do
        post personal_data_path, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PUT/PATCH #update" do
    it "updates personal_data successfully" do
      personal_datum = PersonalDatum.create(valid_attributes)
      valid_attributes[:email] = "email@changed.com"
      put personal_datum_path(personal_datum), params: {personal_datum: valid_attributes}
      personal_datum.reload
      expect(personal_datum.email).to eq("email@changed.com")
    end
  end
end
