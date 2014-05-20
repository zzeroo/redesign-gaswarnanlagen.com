class DocumentsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
 
  def index
    @documents = Document.all
  end
  
  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = 'Dokument gespeichert'
      redirect_to action: "index"
    else
      render :action => :new
    end
  end

  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end



  private

  def document_params
    params.require(:document).permit(:title, :body, :attached_assets_attributes => [:asset, :asset_file_name ])
  end

end

