# Products controller
class ProductsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_product, only: [:show, :edit, :update, :destroy, :ast]

  # GET /products
  def index
    # with solr search
    @search = Product.search do
      fulltext params[:search]
      paginate page: params[:page], per_page: 30
    end

    @products = @search.results
  end

  # GET /product/1
  def show
  end

  # GET /products/new
  def new
  end

  # GET /product/1/edit
  def edit
  end

  # PATCH/ PUT /product/1
  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @product
    else
      render 'edit'
    end
  end

  # DELETE /product/1
  def destroy
    @product.destroy
    flash[:success] = "Produkt wurde gelöscht."
    redirect_to products_url
  end

  # TODO: Beschreibund dieser Action
  # TODO: Kann das in private?
  # FIXME: Restfull ist das nicht
  def ast
    respond_to do |format|
      format.html
      format.txt
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_nr, :description, :short_description, :short_text1, :short_text2, :technical_data, :has_ast, :tdb, :logo)
    end

end
