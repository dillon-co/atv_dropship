class InventoriesController < ApplicationController
  def index
    ### Get tires
    @brands = Inventory.map_all_brands
    # if params == ""
    # @snow_plows = Inventory.get_all("Plow Kit")
    @snow_plows = Inventory.get_all("Send-It")

    # @snow_plows = Inventory.where('name LIKE ?', '%Plow Kit%')
    # else
    #   if params['size'] != nil
    #     @tires = Inventory.where(
    #             "name LIKE ?
    #             AND size = ?",
    #             "%Tire%", params["size"])
    #   else
    #     @tires = Inventory.where(
    #             "name LIKE ?
    #             AND brand = ?
    #             AND size IS NOT NULL",
    #             "%Tire%", params["brand"])
    #   end
    #
    # end
    # @size_map = Inventory.map_all_sizes(Inventory.get_all("Tire"))
  end

  def show
    @prod = Inventory.find(params[:id])
  end

  private

  def ensure_cart_exists
    session[:cart] ||= []
  end

end
