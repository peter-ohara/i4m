class PurchasedTBillsController < ApplicationController
  before_action :set_purchased_t_bill, only: [:show, :edit, :update, :destroy]

  # GET /purchased_t_bills
  # GET /purchased_t_bills.json
  def index
    @purchased_t_bills = PurchasedTBill.all
  end

  # GET /purchased_t_bills/1
  # GET /purchased_t_bills/1.json
  def show
  end

  # GET /purchased_t_bills/new
  def new
    @purchased_t_bill = PurchasedTBill.new
  end

  # GET /purchased_t_bills/1/edit
  def edit
  end

  # POST /purchased_t_bills
  # POST /purchased_t_bills.json
  def create
    @purchased_t_bill = PurchasedTBill.new(
      user: @current_user,
      principal_pesewas: saved_t_bill_params[:principal] * 100,
      tenure: saved_t_bill_params[:tenure],
      bank_of_ghana_rate_id: BankOfGhanaRate.current_rate.id
    )

    respond_to do |format|
      if @purchased_t_bill.save
        format.html { redirect_to @purchased_t_bill, notice: 'Purchased t bill was successfully created.' }
        format.json { render :show, status: :created, location: @purchased_t_bill }
      else
        format.html { render :new }
        format.json { render json: @purchased_t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchased_t_bills/1
  # PATCH/PUT /purchased_t_bills/1.json
  def update
    respond_to do |format|
      if @purchased_t_bill.update(
        user: @current_user,
        principal_pesewas: saved_t_bill_params[:principal] * 100,
        tenure: saved_t_bill_params[:tenure],
        bank_of_ghana_rate_id: BankOfGhanaRate.current_rate.id
      )
        format.html { redirect_to @purchased_t_bill, notice: 'Purchased t bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchased_t_bill }
      else
        format.html { render :edit }
        format.json { render json: @purchased_t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchased_t_bills/1
  # DELETE /purchased_t_bills/1.json
  def destroy
    @purchased_t_bill.destroy
    respond_to do |format|
      format.html { redirect_to purchased_t_bills_url, notice: 'Purchased t bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchased_t_bill
    @purchased_t_bill = PurchasedTBill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchased_t_bill_params
    params.require(:purchased_t_bill).permit(:principal_pesewas, :tenure)
  end
end
