class EmploymentsController < ApplicationController
  before_action :set_employment, only: %i[edit update]
  before_action :set_personal_datum, only: %i[index new create edit update]

  # GET /employments or /employments.json
  def index
    @employments = @personal_datum.employments
  end

  # GET /employments/new
  def new
    @employment = @personal_datum.employments.build
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments or /employments.json
  def create
    @employment = @personal_datum.employments.build(employment_params)

    respond_to do |format|
      if @employment.save
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("employments-data", partial: "employments/employment",
            locals: {employment: @employment, editable: true})
        end
        format.html { redirect_to personal_datum_employments_url(@employment), notice: "Employment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employments/1 or /employments/1.json
  def update
    respond_to do |format|
      if @employment.update(employment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(@employment, partial: "employments/employment",
            locals: {employment: @employment, editable: true})
        end
        format.html { redirect_to personal_datum_employment_url(@employment), notice: "Employment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employment
    @employment = Employment.find(params[:id])
  end

  def set_personal_datum
    @personal_datum = PersonalDatum.find(params[:personal_datum_id])
  end

  # Only allow a list of trusted parameters through.
  def employment_params
    params.require(:employment).permit(:employer, :date_started, :date_ended)
  end
end
