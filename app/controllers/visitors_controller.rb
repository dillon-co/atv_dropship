class VisitorsController < ApplicationController
  def index

    @snow_plows = Inventory.where("name LIKE '%Plow Kit%'")
    @shirts = Inventory.where("name LIKE '%Send-It%'")
    # @brands = Inventory.map_all_brands
    # @size_map = Inventory.map_all_sizes(@tires)
    # @featured_parts = []

  end
end
