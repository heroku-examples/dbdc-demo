class WelcomeController < ApplicationController
  include Databasedotcom::Rails::Controller

  before_filter :get_products

  protected
  def get_products
    @products = Product__c.all
  end
end
