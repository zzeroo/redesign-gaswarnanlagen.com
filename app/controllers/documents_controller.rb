# Documents controller
class DocumentsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_document, only: [:show, :edit, :update, :destroy]
 
  def index
    @documents = Document.all
  end
  
  def show
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
  end
  
  def update
    if @document.update_attributes(document_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end


  private

  def find_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :body, :attached_assets_attributes => [:asset, :asset_file_name ])
  end

end

