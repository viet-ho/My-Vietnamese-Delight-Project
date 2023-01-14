class PromoItemsController < ApplicationController
  before_action :set_promo_item, only: %i[ show edit update destroy ]

  # GET /promo_items or /promo_items.json
  def index
    @promo_items = PromoItem.all
  end

  # GET /promo_items/1 or /promo_items/1.json
  def show
  end

  # GET /promo_items/new
  def new
    @promo_item = PromoItem.new
  end

  # GET /promo_items/1/edit
  def edit
  end

  # POST /promo_items or /promo_items.json
  def create
    @promo_item = PromoItem.new(promo_item_params)

    respond_to do |format|
      if @promo_item.save!
        format.html { redirect_to promo_item_url(@promo_item), notice: "Promo item was successfully created." }
        format.json { render :show, status: :created, location: @promo_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promo_items/1 or /promo_items/1.json
  def update
    respond_to do |format|
      if @promo_item.update(promo_item_params)
        format.html { redirect_to promo_item_url(@promo_item), notice: "Promo item was successfully updated." }
        format.json { render :show, status: :ok, location: @promo_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_items/1 or /promo_items/1.json
  def destroy
    @promo_item.destroy

    respond_to do |format|
      format.html { redirect_to promo_items_url, notice: "Promo item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo_item
      @promo_item = PromoItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def promo_item_params
      params.require(:promo_item).permit(:name, :description, :image, :price)
    end
end
