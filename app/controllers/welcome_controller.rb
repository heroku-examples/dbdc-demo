class WelcomeController < ApplicationController
  include Databasedotcom::Rails::Controller
  self.dbdc_client = dbdc_client_from_env

  def self.const_missing(sym)
    custom_obj = sym.to_s + '__c'
    if sobject_types.include?(custom_obj)
      dbdc_client.materialize(custom_obj)
    else
      super
    end
  end

  before_filter :get_products

  protected
  def get_products
    @products = Product.all
  end
end
