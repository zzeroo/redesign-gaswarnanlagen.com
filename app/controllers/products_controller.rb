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

  def import
    Product.import(params[:file])
    redirect_to products_path, notice: "Produkte erfolgreich importiert."
  end


  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Produkt wurde gelöscht.."
    redirect_to products_url
  end


end

