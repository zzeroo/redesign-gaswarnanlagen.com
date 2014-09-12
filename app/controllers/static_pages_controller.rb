# Static Pages
class StaticPagesController < ApplicationController
  # GET /home
  def home
    @categories = Category.where(parent: nil).where(published: true).order('created_at')
    @news = News.order(news_date: :desc)
  end

  # GET /references
  def references
  end

  # GET /about
  def about
  end

  # GET /distributors
  def distributors
  end

  # GET /contact
  def contact
  end

end
