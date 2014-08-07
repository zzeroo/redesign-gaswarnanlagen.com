class CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
 
  def index
    @categories = Category.where(children: nil).order(:id)
  end
  
  def show
    @category = Category.find(params[:id])
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
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to categories_path
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
    params.require(:category).permit! #(:name, :description, :published, :product_nr_prefix, :background_color, :logo, :parent_id, asset: [:filename, :content_type], attached_assets_attributes: [:id, :asset_file_name, :asset_content_type, :asset_file_size, :asset_updated_at, :attachable_id, :attachable_type, :created_at, :updated_at, :_destroy] )
  end

end
