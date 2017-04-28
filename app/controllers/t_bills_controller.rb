class TBillsController < ApplicationController
  before_action :set_t_bill, only: [:show, :edit, :update, :destroy]

  # GET /t_bills
  # GET /t_bills.json
  def index
    @t_bills = TBill.all
  end

  # GET /t_bills/1
  # GET /t_bills/1.json
  def show
  end

  # GET /t_bills/new
  def new
    @t_bill = TBill.new
  end

  # GET /t_bills/1/edit
  def edit
  end

  # POST /t_bills
  # POST /t_bills.json
  def create
    @t_bill = TBill.new(t_bill_params)

    respond_to do |format|
      if @t_bill.save
        format.html { redirect_to @t_bill, notice: 'T bill was successfully created.' }
        format.json { render :show, status: :created, location: @t_bill }
      else
        format.html { render :new }
        format.json { render json: @t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_bills/1
  # PATCH/PUT /t_bills/1.json
  def update
    respond_to do |format|
      if @t_bill.update(t_bill_params)
        format.html { redirect_to @t_bill, notice: 'T bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @t_bill }
      else
        format.html { render :edit }
        format.json { render json: @t_bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_bills/1
  # DELETE /t_bills/1.json
  def destroy
    @t_bill.destroy
    respond_to do |format|
      format.html { redirect_to t_bills_url, notice: 'T bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_bill
      @t_bill = TBill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def t_bill_params
      params.require(:t_bill).permit(:principal, :tenure)
    end
end
