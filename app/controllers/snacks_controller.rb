class SnacksController < ApplicationController
  before_action :set_snack, only: %i[ show edit update destroy swap_out swap_in ]

  # GET /snacks or /snacks.json
  def index
    @snacks = current_user.snacks.includes(:flavors)
  end

  # GET /snacks/1 or /snacks/1.json
  def show
  end

  # GET /snacks/new
  def new
    @available_snacks = Snack.where.not(id: current_user.snack_ids)
    @snack = current_user.snacks.new
    render layout: false if turbo_frame_request?
  end

  # GET /snacks/1/edit
  def edit
  end

  # POST /snacks or /snacks.json
  def create
    if snack_params[:existing_snack_id].present?
      snack = Snack.find(snack_params[:existing_snack_id])
      current_user.snacks << snack unless current_user.snacks.include?(snack)
      redirect_to snacks_path, notice: "#{snack.name} added to your snacks."
    else
      @snack = Snack.new(snack_params.except(:existing_snack_id))
      @snack.flavor_ids = @snack.flavor_ids.reject(&:blank?)

      respond_to do |format|
        if @snack.save
          current_user.snacks << @snack
          format.html { redirect_to snacks_path, notice: "Snack was successfully created." }
          format.json { render :show, status: :created, location: @snack }
        else
          @available_snacks = Snack.where.not(id: current_user.snack_ids)
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @snack.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /snacks/1 or /snacks/1.json
  def update
    respond_to do |format|
      if @snack.update(snack_params)
        format.html { redirect_to snacks_path, notice: "Snack was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @snack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snacks/1 or /snacks/1.json
  def destroy
    @snack.destroy
    respond_to do |format|
      format.html { redirect_to snacks_path, notice: "Snack successfully deleted!" }
      format.json { head :no_content }
    end
  end

  def swap_out
    respond_to do |format|
      if current_user.snacks.delete(@snack)
        format.html { redirect_to snacks_path, notice: "Snack removed from your bar." }
        format.json { head :no_content }
      else
        format.html { redirect_to snacks_path, alert: "Unable to remove snack from bar" }
        format.json { render json: { error: "Unable to remove snack" }, status: :unprocessable_entity }
      end
    end
  end

  def swap_in
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snack
      @snack = current_user.snacks.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def snack_params
      params.expect(snack: [ :name, :description, :img_url, :existing_snack_id, flavor_ids: [] ])
    end
end
