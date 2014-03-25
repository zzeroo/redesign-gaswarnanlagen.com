class ProductsController < ApplicationController

  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
      format.xls
    end
  end
  
  def show
  end

end

