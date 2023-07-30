class ProductsController < ApplicationController
  def index
    @categories = Category.pluck("category_name")
    @products = Product.search(params[:keyword], params[:category_id]).page(params[:page]).per(2)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
end
