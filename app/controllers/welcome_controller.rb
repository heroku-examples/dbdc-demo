class WelcomeController < ApplicationController
  before_filter :protect!
  before_filter :get_products
  
  protected
  def get_products
    @products = Product.all
  end
end
