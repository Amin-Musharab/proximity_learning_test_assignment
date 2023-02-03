class PersonalDataController < ApplicationController
  before_action :set_personal_datum, only: %i[show edit update destroy]

  # GET /personal_data or /personal_data.json
  def index
    @personal_data = PersonalDatum.includes(:employment)
    @employments = @personal_data.take.employments if @personal_data.present?
  end

  def retrieve_employments
    redirect_to personal_datum_employments_path(PersonalDatum.take)
  end

  # GET /personal_data/new
  def new
    @personal_datum = PersonalDatum.new
  end

  # # GET /personal_data/1/edit
  # def edit
  # end

  # POST /personal_data or /personal_data.json
  def create
    @personal_datum = PersonalDatum.new(personal_datum_params)

    respond_to do |format|
      if @personal_datum.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.append("personal-data", partial: "personal_data/personal_datum",
            locals: {personal_datum: @personal_datum})
        end
        format.html { redirect_to personal_datum_url(@personal_datum), notice: "Personal datum was successfully created." }
        format.json { render :show, status: :created, location: @personal_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_data/1 or /personal_data/1.json
  def update
    respond_to do |format|
      if @personal_datum.update(personal_datum_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@personal_datum, partial: "personal_data/personal_datum",
            locals: {personal_datum: @personal_datum})
        end
        format.html { redirect_to personal_datum_url(@personal_datum), notice: "Personal datum was successfully updated." }
        format.json { render :show, status: :ok, location: @personal_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_datum
    @personal_datum = PersonalDatum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_datum_params
    params.require(:personal_datum).permit(:first_name, :last_name, :nick_name, :phone_number, :email, :street, :city, :state, :zip)
  end
end
