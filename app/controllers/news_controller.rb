class NewsController < ApplicationController
  before_action :admin_user, only: [:new, :create, :update, :destroy]
  #before_action :signed_in_user, only: [:new, :create, :destroy]
 
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
    @news = News.find(params[:id])
  end
  
  def update
    @news = News.find(params[:id])
    if @news.update_attributes(news_params)
      flash[:success] = "News erfolgreich geändert"
      redirect_to news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to news_index_path
  end

  private

  def news_params
    params.require(:news).permit(:title, :news_date, :news_body, :news_image)
  end

end
