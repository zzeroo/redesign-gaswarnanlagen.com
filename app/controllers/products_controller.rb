class ProductsController < ApplicationController

  def index
    # with solr search
    @search = Product.search do
      fulltext params[:search]
      paginate  :per_page => 10
    end

    @products = @search.results

    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls
    end
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

