require "pry"
class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]

  # # GET /line_items or /line_items.json
  # def index
  #   @line_items = LineItem.all
  # end

  # # GET /line_items/1 or /line_items/1.json
  # def show
  #   @line_item = LineItem.find(params[:id])
  # end

  # # GET /line_items/new
  # def new
  #   @line_item = LineItem.new
  # end

  # # GET /line_items/1/edit
  # def edit
  # end

  # POST /line_items or /line_items.json
  # def create
  #   @line_item = LineItem.new(line_item_params)

  #   respond_to do |format|
  #     if @line_item.save!
  #       format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully created." }
  #       format.json { render :show, status: :created, location: @line_item }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    # Find associated product and current cart
    chosen_menu_item = MenuItem.find(params[:menu_item_id])
    current_cart = Cart.last
    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.line_items.map(&:menu_item).include?(chosen_menu_item)
      # Find the line_item with the chosen_product
      @line_item = current_cart.line_items.find_by(:menu_item_id => chosen_menu_item)
      # Iterate the line_item's quantity by one
      @line_item.quantity += 1
    else
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.menu_item = chosen_menu_item
    end

    # Save and redirect to cart show path
    @line_item.save!
    redirect_to cart_path(current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    @line_item.quantity += 1
    @line_item.save!
    redirect_to cart_path(@current_cart)
  end

  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    if @line_item.quantity == 0
      @line_item.destroy
    else
      @line_item.save!
    end
    redirect_to cart_path(@current_cart)
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  # def update
  #   respond_to do |format|
  #     if @line_item.update(line_item_params)
  #       format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
  #       format.json { render :show, status: :ok, location: @line_item }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /line_items/1 or /line_items/1.json
  # def destroy
  #   @line_item.destroy

  #   respond_to do |format|
  #     format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_line_item
    #   @line_item = LineItem.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    # added quantity
    def line_item_params
      params.require(:line_item).permit(:quantity, :menu_item_id, :cart_id)
    end
end
