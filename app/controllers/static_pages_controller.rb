class StaticPagesController < ApplicationController
  def home
    @categories = Category.where(parent: nil).where(published: true).order('created_at')
    @news = News.order(:news_date, :created_at)
  end

  def references
  end

  def about
  end

  def distributors
  end

  def contact
  end

end
