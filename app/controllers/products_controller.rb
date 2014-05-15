class ProductsController < ApplicationController

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

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Produkt wurde gelöscht."
    redirect_to products_url
  end

end

