# News controller
class NewsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  # before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_news, only: [:edit, :update, :destroy]

  # GET /news
  def index
    @news = News.order(news_date: :desc)
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1
  def edit
  end

  # POST /news/1
  def create
    @news = News.create(news_params)
    if @news.save
      flash[:success] = "News wurden gespeichert"
      redirect_to news_index_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /news/1
  def update
    if @news.update_attributes(news_params)
      flash[:success] = "News erfolgreich geändert"
      redirect_to news_index_path
    else
      render 'edit'
    end
  end

  # DELETE /news/1
  def destroy
    @news.destroy
    redirect_to news_index_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title, :news_date, :news_body, :news_image)
    end
end
