# Controller for product categories
class CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  # before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.where(children: nil).order(:id)
  end

  # GET /categoy/1
  def show
    @products = @category.products.paginate(page: params[:page], per_page: 10) if @category.products
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories/new
  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:success] = "Product Gruppe wurde erstellt!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  # POST /categoy/1
  def edit
  end

  # PATCH /categoy/1
  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  # DELETE /categoy/1
  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description, :published, :product_nr_prefix, :background_color, :logo, :logo_delete, :parent_id, attached_assets_attributes: [:id, :asset, :_destroy])
    end
end
