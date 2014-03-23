class ProductGroupsController < ApplicationController

  def index
    @product_groups = ProductGroup.all
  end
  
  def show
    @product_group = ProductGroup.find(params[:id])
    @products = @product_group.products
  end

end
