class StaticPagesController < ApplicationController
  def home
    @product_groups = ProductGroup.where(published: true)
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
