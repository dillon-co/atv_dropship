class InventoriesController < ApplicationController
  def index
    ### Get tires
    @brands = Inventory.map_all_brands
    # if params == ""
    @snow_plows = Inventory.get_all("Plow Kit")
    # @snow_plows = Inventory.get_all("Winter")
    @shirts = Inventory.get_all("Shirt")
  end

  def show
    @prod = Inventory.find(params[:id])
    @order_item = current_order.order_items.new
    @sizes = Inventory.get_all("Send-It").map{ |s_obj| s_obj[1][:sizes].first}.uniq
    @sizes = ["Small", "Medium", "Large", "X-Large", "XX-Large"]
  end

  private

  def ensure_cart_exists
    session[:cart] ||= []
  end

end
