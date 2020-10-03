class ProductsController < ApplicationController
  def index
    def index
      @products = Product.order(:title)
    end

    def show
      @product = Product.find(params[:id])
    end
  end
end
