class BankOfGhanaRatesController < ApplicationController
  before_action :set_bank_of_ghana_rate, only: [:show, :edit, :update, :destroy]

  # GET /bank_of_ghana_rates
  # GET /bank_of_ghana_rates.json
  def index
    @bank_of_ghana_rates = BankOfGhanaRate.all
  end

  # GET /bank_of_ghana_rates/1
  # GET /bank_of_ghana_rates/1.json
  def show
  end

  # GET /bank_of_ghana_rates/new
  def new
    @bank_of_ghana_rate = BankOfGhanaRate.new
  end

  # GET /bank_of_ghana_rates/1/edit
  def edit
  end

  # POST /bank_of_ghana_rates
  # POST /bank_of_ghana_rates.json
  def create
    @bank_of_ghana_rate = BankOfGhanaRate.new(bank_of_ghana_rate_params)

    respond_to do |format|
      if @bank_of_ghana_rate.save
        format.html { redirect_to @bank_of_ghana_rate, notice: 'Bank of ghana rate was successfully created.' }
        format.json { render :show, status: :created, location: @bank_of_ghana_rate }
      else
        format.html { render :new }
        format.json { render json: @bank_of_ghana_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_of_ghana_rates/1
  # PATCH/PUT /bank_of_ghana_rates/1.json
  def update
    respond_to do |format|
      if @bank_of_ghana_rate.update(bank_of_ghana_rate_params)
        format.html { redirect_to @bank_of_ghana_rate, notice: 'Bank of ghana rate was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_of_ghana_rate }
      else
        format.html { render :edit }
        format.json { render json: @bank_of_ghana_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_of_ghana_rates/1
  # DELETE /bank_of_ghana_rates/1.json
  def destroy
    @bank_of_ghana_rate.destroy
    respond_to do |format|
      format.html { redirect_to bank_of_ghana_rates_url, notice: 'Bank of ghana rate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_of_ghana_rate
      @bank_of_ghana_rate = BankOfGhanaRate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_of_ghana_rate_params
      params.require(:bank_of_ghana_rate).permit(:discount_rate_91_days, :interest_rate_91_days, :discount_rate_182_days, :interest_rate_182_days, :start_date, :end_date)
    end
end
