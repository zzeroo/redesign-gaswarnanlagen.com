class StaticPagesController < ApplicationController
  def home
    @categories = Category.where(parent: nil)
    @news = News.all
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
