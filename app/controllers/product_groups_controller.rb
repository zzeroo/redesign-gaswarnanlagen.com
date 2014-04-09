class ProductGroupsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]<%= debug(params) if Rails.env.development? %>
 
  def index
    @product_groups = ProductGroup.all
  end
  
  def show
    @product_group = ProductGroup.find(params[:id])
    @products = @product_group.products
  end

  def new
    @product_group = ProductGroup.new
  end

  def create
    @product_group = ProductGroup.create(product_group_params)
    if @product_group.save
      flash[:success] = "Product Gruppe wurde erstellt!"
      redirect_to product_groups_path
    else
      render 'new'
    end
  end

  def edit
    @product_group = ProductGroup.find(params[:id])
  end
  
  def update
    @product_group = ProductGroup.find(params[:id])
    if @product_group.update_attributes(product_group_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @product_group
    else
      render 'edit'
    end
  end

  def destroy
    @product_group = ProductGroup.find(params[:id])
    @product_group.destroy
    redirect_to product_groups_path
  end

  private

  def product_group_params
    params.require(:product_group).permit(:name, :description, :published, :product_nr_prefix)
  end

end
