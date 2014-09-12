# News controller
class NewsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :find_news, only: [:edit, :update, :destroy]
 
  def index
    @news = News.order(news_date: :desc)
  end
  
  def new
    @news = News.new
  end

  def create
    @news = News.create(news_params)
    if @news.save
      flash[:success] = "News wurden gespeichert"
      redirect_to news_index_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @news.update_attributes(news_params)
      flash[:success] = "News erfolgreich geändert"
      redirect_to news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_path
  end

  private

  def find_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :news_date, :news_body, :news_image)
  end

end
