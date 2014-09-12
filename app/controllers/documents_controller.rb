# Documents controller
class DocumentsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_document, only: [:show, :edit, :update, :destroy]
 
  # GET /documents
  def index
    @documents = Document.all
  end
  
  # GET /document/1
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # POST /documents/new
  def create
    @document = Document.new(document_params)
    if @document.save
      flash[:success] = 'Dokument gespeichert'
      redirect_to action: "index"
    else
      render :action => :new
    end
  end

  # PUT /document/1
  def edit
  end
  
  # PATCH /document/1
  def update
    if @document.update_attributes(document_params)
      flash[:success] = "Produktgruppe wurde aktualisiert"
      redirect_to @document
    else
      render 'edit'
    end
  end

  # DELETE /document/1
  def destroy
    @document.destroy
    redirect_to documents_path
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def find_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:title, :body, :attached_assets_attributes => [:asset, :asset_file_name ])
    end

end
