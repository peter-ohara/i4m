class NextOfKinsController < ApplicationController
  before_action :set_next_of_kin, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token, only: [:update, :create]

  # GET /next_of_kins
  # GET /next_of_kins.json
  def index
    @next_of_kins = NextOfKin.all
  end

  # GET /next_of_kins/1
  # GET /next_of_kins/1.json
  def show
  end

  # GET /next_of_kins/new
  def new
    @next_of_kin = NextOfKin.new
  end

  # GET /next_of_kins/1/edit
  def edit
  end

  # POST /next_of_kins
  # POST /next_of_kins.json
  def create
    @next_of_kin = NextOfKin.new(next_of_kin_params)

    respond_to do |format|
      if @next_of_kin.save
        format.html { redirect_to @next_of_kin, notice: 'Next of kin was successfully created.' }
        format.json { render :show, status: :created, location: @next_of_kin }
      else
        format.html { render :new }
        format.json { render json: @next_of_kin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /next_of_kins/1
  # PATCH/PUT /next_of_kins/1.json
  def update
    respond_to do |format|
      if @next_of_kin.update(next_of_kin_params)
        format.html { redirect_to @next_of_kin, notice: 'Next of kin was successfully updated.' }
        format.json { render :show, status: :ok, location: @next_of_kin }
      else
        format.html { render :edit }
        format.json { render json: @next_of_kin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /next_of_kins/1
  # DELETE /next_of_kins/1.json
  def destroy
    @next_of_kin.destroy
    respond_to do |format|
      format.html { redirect_to next_of_kins_url, notice: 'Next of kin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_next_of_kin
      @next_of_kin = NextOfKin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def next_of_kin_params
      params.require(:next_of_kin).permit(:name, :phone_number, :user_id)
    end
end
