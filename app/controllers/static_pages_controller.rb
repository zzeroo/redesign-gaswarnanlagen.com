class StaticPagesController < ApplicationController
  def home
    @product_groups = ProductGroup.all
  end

  def help
  end

  def about
  end

  def contact
  end

end
