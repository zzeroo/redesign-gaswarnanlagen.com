class ProductImportsController < ApplicationController
  before_action :admin_user, only: [:new, :create]
  #before_action :signed_in_user, only: [:new, :create, :destroy]

  def new
    @product_import = ProductImport.new
  end

  def create
    @product_import = ProductImport.new(params[:product_import])
    if @product_import.save
      flash[:success] = "Produkte erfolgreich importiert."
      redirect_to root_url
    else
      render :new
    end
  end
end
