class CodesController < ApplicationController
  before_action :set_code, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /codes or /codes.json
  def index
    @codes = Code.where(user_id: current_user.id)
  end

  # GET /codes/1 or /codes/1.json
  def show
  end

  # GET /codes/new
  def new
    @code = Code.new
  end

  # GET /codes/1/edit
  def edit
  end

  # POST /codes or /codes.json
  def create
    @code = Code.new(code_params)

    respond_to do |format|
      if @code.save
        format.html { redirect_to @code, notice: "Code was successfully created." }
        format.json { render :show, status: :created, location: @code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /codes/1 or /codes/1.json
  def update
    respond_to do |format|
      if @code.update(code_params)
        format.html { redirect_to @code, notice: "Code was successfully updated." }
        format.json { render :show, status: :ok, location: @code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /codes/1 or /codes/1.json
  def destroy
    @code.destroy
    respond_to do |format|
      format.html { redirect_to codes_url, notice: "Code was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_code
      @code = Code.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def code_params
      params.require(:code).permit(:code, :user_id, :webhook, :forward_address, :company_id, :newtin_code)
    end
end
