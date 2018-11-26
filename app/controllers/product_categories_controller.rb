class ProductCategoriesController < ApplicationController

  def new
    @pcat_search = ProductCategory.new
  end

  def create
    pcat_search = ProductCategory.new(prod_cat_params)
    # raise "Wyat's a bitch"
    if pcat_search.save
      redirect_to dash_path
    end
  end

  def show
    @cat = ProductCategory.find(params[:id])
    @category_inventory = Inventory.get_all(@cat.name.titleize)
  end

  def confirm_cat
    @cat = params[:name].titleize
    @new_cat = ProductCategory.new
    @category_inventory = Inventory.get_all(@cat)
  end

  private

  def prod_cat_params
    params.require(:product_category).permit(:name, :currently_selling, :nuber_of_visits)
  end
end
