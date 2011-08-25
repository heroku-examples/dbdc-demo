class ProductsController < ApplicationController
  before_filter :protect!

  def index
    @products = Product.all
  end
end
