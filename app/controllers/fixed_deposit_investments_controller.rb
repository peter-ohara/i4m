class FixedDepositInvestmentsController < ApplicationController
  before_action :set_fixed_deposit_investment, only: [:show, :edit, :update,
                                                      :destroy, :purchase,
                                                      :new_purchase]

  # GET /fixed_deposit_investments
  # GET /fixed_deposit_investments.json
  def index
    @fixed_deposit_investments = FixedDepositInvestment.all
  end

  # GET /fixed_deposit_investments/1
  # GET /fixed_deposit_investments/1.json
  def show
  end

  # GET /fixed_deposit_investments/new
  def new
    @fixed_deposit_investment = FixedDepositInvestment.new
  end

  # GET /fixed_deposit_investments/1/edit
  def edit
  end

  # POST /fixed_deposit_investments
  # POST /fixed_deposit_investments.json
  def create
    @fixed_deposit_investment = FixedDepositInvestment.new(fixed_deposit_investment_params)

    respond_to do |format|
      if @fixed_deposit_investment.save
        format.html { redirect_to @fixed_deposit_investment, notice: 'Fixed deposit investment was successfully created.' }
        format.json { render :show, status: :created, location: @fixed_deposit_investment }
      else
        format.html { render :new }
        format.json { render json: @fixed_deposit_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fixed_deposit_investments/1
  # PATCH/PUT /fixed_deposit_investments/1.json
  def update
    respond_to do |format|
      if @fixed_deposit_investment.update(fixed_deposit_investment_params)
        format.html { redirect_to @fixed_deposit_investment, notice: 'Fixed deposit investment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fixed_deposit_investment }
      else
        format.html { render :edit }
        format.json { render json: @fixed_deposit_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fixed_deposit_investments/1
  # DELETE /fixed_deposit_investments/1.json
  def destroy
    @fixed_deposit_investment.destroy
    respond_to do |format|
      format.html { redirect_to fixed_deposit_investments_url, notice: 'Fixed deposit investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_purchase
  end

  def purchase
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email]
    )

    purchase_attempt = FdPurchaseAttempt.new(user: @user,
      fixed_deposit_investment: @fixed_deposit_investment,
      principal_pesewas: params[:principal].to_i * 100
    )

    respond_to do |format|
      if purchase_attempt.save
        format.html {
          redirect_to @fixed_deposit_investment,
          notice: 'Congratulations!! You just joined our waiting list. We would contact you immediately your request can be processed.'
        }
        format.json { render :show, status: :created, location: @fixed_deposit_investment }
      else
        format.html { render :new }
        format.json { render json: @fixed_deposit_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fixed_deposit_investment
      @fixed_deposit_investment = FixedDepositInvestment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fixed_deposit_investment_params
      params.require(:fixed_deposit_investment).permit(:institution_id, :name, :period_in_days, :minimum_principal_pesewas, :risk_rating, :links, :email, :phone_number, :description)
    end
end
