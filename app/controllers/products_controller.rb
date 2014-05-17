class ProductsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :destroy]
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

  def edit
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Produkt wurde gelöscht."
    redirect_to products_url
  end

end

