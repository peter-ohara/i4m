class MutualFundsController < ApplicationController
  before_action :set_mutual_fund, only: [:show, :edit, :update, :destroy, :purchase]

  # GET /mutual_funds
  # GET /mutual_funds.json
  def index
    @mutual_funds = MutualFund.all
  end

  # GET /mutual_funds/1
  # GET /mutual_funds/1.json
  def show
  end

  # GET /mutual_funds/new
  def new
    @mutual_fund = MutualFund.new
  end

  # GET /mutual_funds/1/edit
  def edit
  end

  # POST /mutual_funds
  # POST /mutual_funds.json
  def create
    @mutual_fund = MutualFund.new(mutual_fund_params)

    respond_to do |format|
      if @mutual_fund.save
        format.html { redirect_to @mutual_fund, notice: 'Mutual fund was successfully created.' }
        format.json { render :show, status: :created, location: @mutual_fund }
      else
        format.html { render :new }
        format.json { render json: @mutual_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mutual_funds/1
  # PATCH/PUT /mutual_funds/1.json
  def update
    respond_to do |format|
      if @mutual_fund.update(mutual_fund_params)
        format.html { redirect_to @mutual_fund, notice: 'Mutual fund was successfully updated.' }
        format.json { render :show, status: :ok, location: @mutual_fund }
      else
        format.html { render :edit }
        format.json { render json: @mutual_fund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mutual_funds/1
  # DELETE /mutual_funds/1.json
  def destroy
    @mutual_fund.destroy
    respond_to do |format|
      format.html { redirect_to mutual_funds_url, notice: 'Mutual fund was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def purchase
    @user = User.create(
        first_name: params[:first_name],
        last_name: params[:last_name],
        phone_number: params[:phone_number],
        email: params[:email]
    )

    purchase_attempt = MutualFundPurchaseAttempt.new(user: @user,
                                             mutual_fund: @mutual_fund,
                                             principal_pesewas: params[:principal].to_i * 100
    )

    respond_to do |format|
      if purchase_attempt.save
        format.html { redirect_to @mutual_fund,
                      notice: "Purchase created successfully." }
        format.json { render :show, status: :created, location: @fixed_deposit_investment }
      else
        format.html { render :new }
        format.json { render json: @fixed_deposit_investment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mutual_fund
      @mutual_fund = MutualFund.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mutual_fund_params
      params.require(:mutual_fund).permit(:institution_id, :name, :minimum_principal_pesewas, :debit_order_pesewas, :management_fee_rate, :min_days_before_withdrawal, :risk_rating, :links, :email, :phone_number, :description)
    end
end
