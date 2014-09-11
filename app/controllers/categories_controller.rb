# Controller for product categories
class CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_category, only: [:show, :edit, :update, :destroy]
 
  def index
    @categories = Category.where(children: nil).order(:id)
  end
  
  def show
    @products = @category.products.paginate(:page => params[:page], :per_page =>10 ) if @category.products
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
  end
  
  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end


  private
  
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit( :name, :description, :published, :product_nr_prefix, :background_color, :logo, :parent_id, attached_assets_attributes: [ :asset, :_destroy] )
  end

end
