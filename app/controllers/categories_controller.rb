class CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]<%= debug(params) if Rails.env.development? %>
 
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "Product Gruppe wurde erstellt!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description, :published, :product_nr_prefix, :background_color, :logo)
  end

end
