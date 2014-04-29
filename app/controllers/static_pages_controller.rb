class StaticPagesController < ApplicationController
  def home
    @categories = Category.where(published: true)
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
