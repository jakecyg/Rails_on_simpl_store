class ProductController < ApplicationController
  def index
    @products = Product.order(:title)
  end
end
