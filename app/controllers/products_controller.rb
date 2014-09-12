# Products controller
class ProductsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy, :ast]

  def index
    # with solr search
    @search = Product.search do
      fulltext params[:search]
      paginate page: params[:page], per_page: 30
    end

    @products = @search.results
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Produkt wurde gelöscht."
    redirect_to products_url
  end

  # TODO: Beschreibund dieser Action
  # FIXME: Restfull ist das nicht
  def ast
    respond_to do |format|
      format.html
      format.txt
    end
  end

  private

  def find_product
  end

  def product_params
    params.require(:product).permit(:product_nr, :description, :short_description, :short_text1, :short_text2, :technical_data, :has_ast, :tdb, :logo)
  end

end

