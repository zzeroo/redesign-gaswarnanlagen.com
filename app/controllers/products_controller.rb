class ProductsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
 

  def index
    # with solr search
    @search = Product.search do
      fulltext params[:search]
      paginate page: params[:page], per_page: 30
    end

    @products = @search.results
  end
  
  def show
    @product = Product.find(params[:id])
  end

  def ast
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html
      format.txt
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Produkt wurde gelöscht."
    redirect_to products_url
  end

  private

  def product_params
    params.require(:product).permit(:product_nr, :description, :short_description, :short_text1, :short_text2, :technical_data, :has_ast)
  end

end

