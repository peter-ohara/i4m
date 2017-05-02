class SavedTBillsController < ApplicationController
  before_action :set_saved_t_bill, only: [:show, :edit, :update, :destroy]

  # GET /saved_t_bills
  # GET /saved_t_bills.json
  def index
    @saved_t_bills = SavedTBill.all
  end

  # GET /saved_t_bills/1
  # GET /saved_t_bills/1.json
  def show
  end

  # GET /saved_t_bills/new
  def new
    @saved_t_bill = SavedTBill.new
  end

  # GET /saved_t_bills/1/edit
  def edit
  end

  # POST /saved_t_bills
  # POST /saved_t_bills.json
  def create
    @saved_t_bill = SavedTBill.new
    # :user_id, :principal, :tenure, :bank_of_ghana_rate_id)
    @saved_t_bill.user_id = saved_t_bill_params[:user_id]
    @saved_t_bill.principal_pesewas = saved_t_bill_params[:principal] * 100
    @saved_t_bill.tenure = saved_t_bill_params[:tenure]
    @saved_t_bill.bank_of_ghana_rate_id = BankOfGhanaRate.current_rate.id

    respond_to do |format|
      if @saved_t_bill.save
        format.html { redirect_to @saved_t_bill, notice: 'Saved t bill was successfully created.' }
        format.json { render :show, status: :created, location: @saved_t_bill }
      else
        format.html { render :new }
        format.json { render json: @saved_t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_t_bills/1
  # PATCH/PUT /saved_t_bills/1.json
  def update
    respond_to do |format|
      if @saved_t_bill.update(
        user_id: saved_t_bill_params[:user_id],
        principal_pesewas: saved_t_bill_params[:principal] * 100,
        tenure: saved_t_bill_params[:tenure],
        bank_of_ghana_rate_id: BankOfGhanaRate.current_rate.id
      )
        format.html { redirect_to @saved_t_bill, notice: 'Saved t bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_t_bill }
      else
        format.html { render :edit }
        format.json { render json: @saved_t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_t_bills/1
  # DELETE /saved_t_bills/1.json
  def destroy
    @saved_t_bill.destroy
    respond_to do |format|
      format.html { redirect_to saved_t_bills_url, notice: 'Saved t bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saved_t_bill
    @saved_t_bill = SavedTBill.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def saved_t_bill_params
    params.require(:saved_t_bill).permit(:user_id, :principal, :tenure, :bank_of_ghana_rate_id)
  end
end
