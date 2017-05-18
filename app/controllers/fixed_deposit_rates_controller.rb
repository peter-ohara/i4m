class FixedDepositRatesController < ApplicationController
  before_action :set_fixed_deposit_rate, only: [:show, :edit, :update, :destroy]

  # GET /fixed_deposit_rates
  # GET /fixed_deposit_rates.json
  def index
    @fixed_deposit_rates = FixedDepositRate.all
  end

  # GET /fixed_deposit_rates/1
  # GET /fixed_deposit_rates/1.json
  def show
  end

  # GET /fixed_deposit_rates/new
  def new
    @fixed_deposit_rate = FixedDepositRate.new
  end

  # GET /fixed_deposit_rates/1/edit
  def edit
  end

  # POST /fixed_deposit_rates
  # POST /fixed_deposit_rates.json
  def create
    @fixed_deposit_rate = FixedDepositRate.new(fixed_deposit_rate_params)

    respond_to do |format|
      if @fixed_deposit_rate.save
        format.html { redirect_to @fixed_deposit_rate, notice: 'Fixed deposit rate was successfully created.' }
        format.json { render :show, status: :created, location: @fixed_deposit_rate }
      else
        format.html { render :new }
        format.json { render json: @fixed_deposit_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixed_deposit_rates/1
  # PATCH/PUT /fixed_deposit_rates/1.json
  def update
    respond_to do |format|
      if @fixed_deposit_rate.update(fixed_deposit_rate_params)
        format.html { redirect_to @fixed_deposit_rate, notice: 'Fixed deposit rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @fixed_deposit_rate }
      else
        format.html { render :edit }
        format.json { render json: @fixed_deposit_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixed_deposit_rates/1
  # DELETE /fixed_deposit_rates/1.json
  def destroy
    @fixed_deposit_rate.destroy
    respond_to do |format|
      format.html { redirect_to fixed_deposit_rates_url, notice: 'Fixed deposit rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_deposit_rate
      @fixed_deposit_rate = FixedDepositRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixed_deposit_rate_params
      params.require(:fixed_deposit_rate).permit(:fixed_deposit_investment_id, :interest_rate, :start_date)
    end
end
